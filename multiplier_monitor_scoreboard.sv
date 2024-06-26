/*reate Monitor and Scoreboard Code for Synchronous 4-bit Multiplier. Stimulus is generated in Testbench top so do not add Transaction, Generator, or Driver Code. Also,
add the Scoreboard model to compare the response with an expected result.*/
class transaction;
  bit [3:0] a;
  bit [3:0] b;
  bit [7:0] res;
  
  function void display();
    $display("The values of the a:%0d ,b:%0d res=%0d",a,b,res);
  endfunction
endclass

interface mul;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] res;
  logic clk;
endinterface

class monitor;
  virtual mul m;
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task run();
    t=new();
    forever begin
      repeat(2) @(posedge m.clk)
        t.a=m.a;
      	t.b=m.b;
        t.res=m.res;
      $display("------------------------------");
      t.display();
      $display("[MON] Data sent to the scoreboard");              
      mbx.put(t);
    end
  endtask
  
endclass

class scoreboard;
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task compare(input transaction t);
    if(t.res==t.a*t.b)
      $display("[SCO]:Data matched");
    else
      $error("[SCO]: Data Unmatched");   
  endtask
  
  task run();
    forever begin
    mbx.get(t);
    $display("-----------------------------------------");
    $display("[SCO] : DATA RCVD FROM MONITOR");   
    t.display();
    compare(t);
    end
  endtask 
endclass

module tb;
  
   transaction t;
   mailbox #(transaction) mbx;
   monitor mon;
   scoreboard sco;
   mul m();
  
  always #10 m.clk=~m.clk;
  multiply dut(m.clk,m.a,m.b,m.res);
  
  initial begin
    m.clk=0;
    mbx=new();
    mon=new(mbx);
    sco=new(mbx);
    mon.m=m; 
  end
  
  int i=0;
  
  initial begin
    for(int i = 0; i < 20 ; i++) begin
      repeat(2) @(posedge m.clk);
      m.a <= $urandom_range(0,15);
      m.b <= $urandom_range(0,15);    
    end
  end
  
  initial begin
    fork
      mon.run();
      sco.run();
    join
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #450;
    $finish;
  end
  
endmodule
