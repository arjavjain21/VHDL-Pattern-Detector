// Code for design

module sequence_DETECTOR(in,clk,reset,DETECT);// in = input, clk= clock
  input in,clk,reset;
  output reg DETECT;
  
  reg [2:0]current_state;
  reg [2:0]next_state;

//A register stores its value from one assignment to the next and is used to model data storage elements.
  
  parameter [2:0]s0 = 3'b000;
  parameter [2:0]s1 = 3'b001;
  parameter [2:0]s2 = 3'b010;
  parameter [2:0]s3 = 3'b011;
  parameter [2:0]s4 = 3'b100;

//The needed states for the state machine.
  
  always @(posedge clk) //Positive edge or Posedge of a clock input CLK.
    begin
      if(reset) begin //if rst is true (ie 1), then begin
        DETECT = 1'b0;
        current_state = s0;
        next_state = s0;
      end 
      
      begin
         current_state = next_state;
        
        case(current_state) //switch case working on current state for the input pattern
          s0: if(in) 
            begin
              DETECT = 1'b0;
              next_state = s0;
            end
              
              else
                begin
                DETECT = 1'b0;
                next_state = s1;
                end 
          
          s1: if(in)
            begin
              DETECT = 1'b0;
              next_state = s2;
            end
              
              else
                begin
                DETECT = 1'b0;
                next_state = s1;
            end
          s2: if(in)
            begin
              DETECT = 1'b0;
              next_state = s0;
            end
              
              else
                begin
                DETECT = 1'b0;
                next_state = s3;
            end
          s3: if(in)
            begin
              DETECT = 1'b0;
              next_state = s4;
            end
              
              else
                begin
                DETECT = 1'b0;
                next_state = s0;
            end
          s4: if(in)
            begin
              DETECT = 1'b0;
              next_state = s0;
            end
              
              else
                begin
                DETECT = 1'b1;    //output is 1 when the code detects the pattern
                next_state = s3;
            end
        endcase
      end
    end
endmodule
