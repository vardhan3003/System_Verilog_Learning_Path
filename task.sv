/*Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. 
Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.*/

module tb;
  bit [5:0] addr;
  logic wr;
  logic en;
  logic clk=0;
  
  task gen();
    addr=$urandom;
    wr=$urandom;
    en=$urandom;
  endtask
  
  always #20 clk=~clk;
  integer i;
  
  initial begin
    
    for(i=0;i<10;i++) begin
      @(posedge clk)
        gen();
    end    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #400;
    $finish();
  end

  
endmodule
  
