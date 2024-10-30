`include "sync_fifo.v"
module sync_fifo_tb;
reg  clk_i,rst_i,wr_en_i,rd_en_i;
parameter WIDTH=16;
parameter DEPTH=16;
parameter PTR_WIDTH=$clog2(DEPTH); //log 16 base 2=4

reg [WIDTH-1:0] wdata_i;
wire [WIDTH-1:0] rdata_o;
wire full_o,empty_o,underflow_o,overflow_o;
reg [1000:0] testcase;

integer i;

sync_fifo dut(clk_i,rst_i,wr_en_i,rd_en_i,wdata_i,rdata_o,full_o,empty_o,underflow_o,overflow_o);


//clock generation 
always #5 clk_i=~clk_i;

//reset generation
initial begin
clk_i=0;
rst_i=1; //active reset
//assign some  value to avoid default  reg variable 
wr_en_i=0;
rd_en_i=0;
wdata_i=0;
repeat(2)@(posedge clk_i);
rst_i=0; // reset removal 

//same as scanf in c , to get data
$value$plusargs("testcase= %s",testcase);

//generate testcase
case(testcase) 
"test_wr":begin
write(DEPTH);
end
"test_rd":begin
end
"test_wr_rd":begin
end
"test_overflow_error":begin
end
"test_underflow_error":begin
end
"test_all_error":begin
end
"test_concurrent_wr_rd":begin
end


endcase
#100 $finish();
end
task write (input integer num_location);
begin
for(i=0;i<num_location;i=i+1)begin
@(negedge clk_i);
wr_en_i=1;
wdata_i=$random;
@(negedge clk_i);
wr_en_i=0;
wdata_i=0;

end
end
endtask
task read (input integer num_location);
begin
for(i=0;i<num_location;i=i+1)begin
@(negedge clk_i);
rd_en_i=1;
@(negedge clk_i);
rd_en_i=0;
end
end
endtask

initial begin
$fsdbDumpfile("sync_fifo.fsdb");
$fsdbDumpvars(0,sync_fifo_tb);
end
endmodule