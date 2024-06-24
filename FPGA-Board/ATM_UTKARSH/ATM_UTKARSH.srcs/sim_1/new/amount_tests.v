`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 00:13:52
// Design Name: 
// Module Name: amount_tests
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

module amount_tests(

    );
    
    reg [5:0] ss;
    wire [7:0] out1;
    
    determineAmount(ss, out1);
    
    //initialize variables
    initial begin
        ss = 6'b000000; // no money
        #100;
        ss = 6'b000001; // $1
        #100;
        ss = 6'b000010; // $5
        #100;
        ss = 6'b000011; // $6
        #100;
    end
    
endmodule
