// Write a function capable of generating a square waveform with the help of period(in nSec) and duty cycle(0 to 1). 
//The phase difference is assumed to be 0 for the entire system operation. 
//Verify function behavior by generating waveform for the signal clk with period: 40 nsec and duty cycle: 0.4

//EDA Link: https://edaplayground.com/x/BC4F

`timescale 1ns/1ps

module tb;
  reg clk=0;
  
  task calc(input real period,input real duty_cycle,input real phase,output real phase_out, output real ton,output real toff); 
    phase_out = phase;
    ton       = period *duty_cycle;  // ton  = (1.0 / freq_hz) * duty_cycle * 1000_000_000 (if the frequency is given)
    toff      = period-ton;          // toff = (1000_000_000 / freq_hz) * - ton  
  endtask
  
  task clk_gen(input real phase_out,input real ton,input real toff);
    #phase_out;
    while(1) 
      begin
        clk=1;
        #ton;
        clk=0;
        #toff;
      end
  endtask
  
  real phase_out;
  real ton;
  real toff;
  
  initial begin
    calc(40,0.4,0,phase_out,ton,toff);
    clk_gen(phase_out,ton,toff);
  end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #400;
    $finish();
  end
endmodule
