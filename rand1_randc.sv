/*Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.*/

class generator;
  randc byte a;
  randc byte b;
  randc byte c;
  function void display();
    $display("The value of a:%0d,The value of b:%0d,The value of c: %0d",a,b,c);
  endfunction
endclass

module tb;
  generator g;
  int i;
  
  initial begin
    g=new();
    for(i=0;i<20;i++) begin
      g.randomize();
      g.display();
      #20;
  	end
  end
endmodule
