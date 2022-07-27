module testbench();
  reg in;
  reg clk;
  reg reset;
  
  wire DETECT;
  sequence_DETECTOR UUT(in,clk,reset,DETECT);
  
  initial begin
    clk = 0;
    reset = 0;
    in = 0;
    
// i/o stream, input = 010101010

    #10;
    reset = 1;
    #10;
    reset = 0;
    #10;
    in = 0;
    #10;
    in = 1;
    #10;
    in = 0;
    #10;
    in = 1;
    #10;
    in = 0;
    #10;
    in = 1;
    #10;
    in = 0;
    #10;
    in = 1;
    #10;
    in = 0; 
  end
  
  always #5 clk = ~ clk;
  /*
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #120;
    $finish;*/
  end 
endmodule