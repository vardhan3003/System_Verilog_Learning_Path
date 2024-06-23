/*Assume the class consists of three 8-bit data members a, b, and c. 
Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class.
Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.*/

class first;
  bit [7:0] a;
  bit [7:0] b;
  bit [7:0] c;
  
  function new(bit [7:0] a,bit [7:0] b,bit [7:0] c);
    this.a=a;
    this.b=b;
    this.c=c;
  endfunction
  
  function void display();
    $display("The value of a is : %d , the value of b is : %0d , the value of c is :%0d",a,b,c);
  endfunction
   
  endclass

  module tb;   
    first f;
    initial begin
      f=new(2,4,56);
      f.display();
    end
    
  endmodule
