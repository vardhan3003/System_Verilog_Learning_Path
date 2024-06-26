/*Create transaction, Generator and Driver code for Synchronus 4-bit Multiplier.*/

class transaction;
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] res;
  
  function void display();
    $display("The values of a:%0d \t b:%0d \t res:%0d",a,b,res);
  endfunction
  
  function transaction copy();
    copy=new();
    copy.a=a;
    copy.b=b;
    copy.res=res;   
  endfunction
endclass

class generator;  
  transaction t;
  mailbox #(transaction) mbx;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    t=new();
  endfunction
  
  task run();
    for(int i=0;i<10;i++) begin
      t.randomize();
      mbx.put(t.copy);
      $display("[GEN] : DATA SENT TO DRIVER");
      t.display();
      #40;
    end
    ->done;
  endtask
endclass

interface mul;
  logic clk;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] res;
  
endinterface

class driver;
  virtual mul m;
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task run();
    forever begin
      @(posedge m.clk);
      mbx.get(t);
      m.a <= t.a;
      m.b <= t.b;
      $display("[DRV] : Interface Trigger");
    end
  endtask 
endclass

module top;
  transaction t;
  mul m();
  mailbox #(transaction) mbx;
  generator g;
  driver d;
  event done;
  
  always #10 m.clk=~m.clk;
  
  multiply dut(m.clk,m.a,m.b,m.res);
  
  initial begin
    m.clk=0;
    mbx=new();
    g=new(mbx);
    d=new(mbx);
    d.m=m;
    done=g.done;
  end
  
  initial begin
    fork
      g.run();
      d.run();
    join_none
    wait(done.triggered)
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;  
  end
endmodule 
