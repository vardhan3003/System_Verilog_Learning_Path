/*Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver.
Also, verify the data by printing the value of data members of Generator and Driver.*/

class transaction;
 
  bit [7:0] addr = 8'h12;
  bit [3:0] data = 4'h4;
  bit we = 1'b1;
  bit rst = 1'b0;
 
endclass

class generator;
  
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task run();
    t=new();
    $display("The value of the addr:%0h , data:%0h , we:%0h ,rst:%0h",t.addr,t.data,t.we,t.rst);
    t.addr=8'h4;
    mbx.put(t); 
    
   
  endtask
  
endclass

class driver;
  
  transaction tx;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
  endfunction
  
  task run();
    mbx.get(tx);
    $display("The value of the addr:%0h , data:%0h , we:%0h ,rst:%0h",tx.addr,tx.data,tx.we,tx.rst);
  endtask
  
endclass

module top;
  generator g;
  driver d;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx=new();
    g=new(mbx);
    d=new(mbx);
    g.run();
    d.run();
    $finish;
  end
  
endmodule
