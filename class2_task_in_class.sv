/*Assume class consists of three data members a, b, and c each of size 4-bit.
Create a task inside the class that returns the result of the addition of data members. 
The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.*/

class first;
  
  int a;
  int b;
  int c;
  int res;
  function new(bit [3:0] a,bit[3:0] b,bit [3:0] c);
    this.a=a;
    this.b=b;
   	this.c=c;
  endfunction
  
  task add();
    res=a+b+c;
  endtask
     
endclass

module tb;
  first f;
  initial begin
    f=new(1,2,4);
    f.add();
    $display("The result of the addition of a,b,c is :%0d",f.res);
  end
endmodule
