`timescale 1ns / 1ps

module seq_1010(
    //Global signals
    input   i_clock,
    input   i_reset,
    
    //Btn
    input   i_btn,
    //LKD
    output  o_led
) ;

//Local parameters
localparam [2:0] s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4;

//internal regs or wire declarations
reg [2:0] state, next_state;

//reset condition
always@(posedge i_clock) begin

      if(i_reset)
          state <= 3'b000    ;
      else
          state <= next_state ;
          
end

always@(*) begin

     //store tbe state
     next_state = state;
     
     //state machine
     case(state)
     
         s0: next_state = i_btn ? s1 : s0;
         s1: next_state = i_btn ? s1 : s2;
         s2: next_state = i_btn ? s3 : s0;
         s3: next_state = i_btn ? s1 : s4;
         s4: next_state = i_btn ? s1 : s0;          //Non overlapping
         default: next_state = s0;       //overlapping

      endcase
      
end

assign o_led = (state == s4) ? 1 : 0;

endmodule
