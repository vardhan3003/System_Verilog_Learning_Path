/*Create a Class consisting of 3 data members each of unsigned integer type. Initialize them to 45,78, and 90. Use the display function to print the values on the console.*/

class first;
  bit [31:0] a;
  bit [31:0] b;
  bit [31:0] c;
  
  function void display();
    $display("The values of a: %0d b:%0d and c:%0d",a,b,c);
  endfunction
  
endclass

module tb;
  first f;
  
  initial begin
    f=new();
    f.a=32'd45;
    f.b=32'd78;
    f.c=32'd90;
    f.display();
  end
endmodule
