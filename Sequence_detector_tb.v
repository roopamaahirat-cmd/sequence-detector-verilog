`timescale 1ns / 1ps

module seq_1010_tb;

//internal regs/wires
reg    clk, rst, din;
wire   dout         ;

always
   #5 clk = ~clk;
   
   
initial begin

    clk = 0;
    rst = 1;
    din = 0;
    
    #10 rst = 0;
    
    
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    
    #40 $stop;
end

//initial begin
//end

//instantation
seq_1010 uut(
     .i_clock(clk),
     .i_reset(rst),
     .i_btn(din),
     .o_led(dout)
);

    