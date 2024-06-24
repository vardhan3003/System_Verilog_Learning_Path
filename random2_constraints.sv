/*Assume generator class consists of three 8-bit data members (x,y, and z).
Write a code to generate 20 random values for all the data members at an interval of 20 ns. 
Random values for all data members should range from 0 to 50.*/

class generator;
  randc byte x;
  randc byte y;
  randc byte z;
  
  constraint data { x inside {[0:50]};y inside{[0:50]};z inside {[0:50]};}
  //constraint data {x>=0;x<=50;y>=0;y<=50;z>=0;z<=50;} 
  
  
endclass 

module tb;
  generator g;
  integer i;
  
  initial begin
    g=new();
    for(i=0;i<20;i++) begin
      g.randomize();
      $display("The value of x is: %0d The value of y is:%0d,The value of z is:%0d",g.x,g.y,g.z);
      #20;
    end
  end
  
endmodule
