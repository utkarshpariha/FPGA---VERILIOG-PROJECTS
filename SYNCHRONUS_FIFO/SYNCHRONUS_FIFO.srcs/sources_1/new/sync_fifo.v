`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 12:27:23 AM
// Design Name: 
// Module Name: sync_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//synchronus ckt
//clk ,rst
//it has memory
//input clk, rst ,wr_en,rd_en,wdata
//output rdata,full,empty,underflow,overflow
//parameter:WIDTH,DEPTH,PTR_WIDTH

module sync_fifo(clk_i,rst_i,wr_en_i,rd_en_i,wdata_i,rdata_o,full_o,empty_o,underflow_o,overflow_o );
    parameter WIDTH=16;
parameter DEPTH=16;
parameter PTR_WIDTH=$clog2(DEPTH); //log 16 base 2=4

input clk_i,rst_i,wr_en_i,rd_en_i;
input [WIDTH-1:0] wdata_i;
output reg [WIDTH-1:0] rdata_o;
output reg full_o,empty_o,underflow_o,overflow_o;
//internal variables 
//creating memory 
reg [WIDTH-1:0]mem[DEPTH-1:0];
reg [PTR_WIDTH-1:0]wr_ptr,rd_ptr;
reg  wr_toggle_f,rd_toggle_f;
integer  i;
//FIFO FUNCATIONALITY
always @(posedge clk_i)begin
//active high edge reset
if (rst_i) begin
rdata_o=0;
full_o=0;
empty_o=1;
underflow_o=0;
overflow_o=0;
wr_ptr=0;
rd_ptr=0;
wr_toggle_f=0;

rd_toggle_f=0;
for(i=0;i<DEPTH;i=i+1) mem[i]=0;
end
else
begin
//fifo funcationality to read and write a data 
//when wr_enable issued we check full
//full=1, overflow error 
//full=o ,write to the memory and update the wr_ptr by 1
//once it reaches depth perform roll over
if(wr_en_i==1)begin
if(full_o==1)
begin
overflow_o=1;
end
else
begin
mem[wr_ptr]=wdata_i;
if(wr_ptr==DEPTH-1)wr_toggle_f=~wr_toggle_f;
wr_ptr=wr_ptr+1;
end
end
//when rd_enable issued we check empty 
//empty =1 ,underflow error 
//empty =0 , read to the memory and update the rd_ptr by 1
if(rd_en_i==1)begin
if(empty_o==1)
begin
underflow_o=1;
end
else
begin
mem[rd_ptr]=rdata_o;
if(rd_ptr==DEPTH-1)rd_toggle_f=~rd_toggle_f;
rd_ptr=rd_ptr+1;
end
end
end
end 

//check for full and empty
always @(*) begin
//full=1 => wr_ptr==rd_ptr and wr_toggle_f!=rd_toggle_f
//empty=1 => wr_ptr=rd_ptr and wr_toggle_f==rd_toogle_f
if(wr_ptr==rd_ptr && wr_toggle_f!=rd_toggle_f) full_o=1;
if(wr_ptr==rd_ptr && wr_toggle_f==rd_toggle_f) empty_o=1;
end

endmodule
