/*Data Types:
Hardware : (reg and wire)----->logic
Variable: Fixed: 2state(0,1)-------->       signed (8 bit--->byte), (16 bit--->shortint),(32 bit--->int),(64 bit--->long int)
                                            unsigned (8 bit--->bit[7:0]), (16 bit--->bit[15:0]),(32 bit--->bit[31:0]),(64 bit--->bit[63:0])
                 4state(0,1,Z,X)---->       integer

          Floating------------------>       real
Simulation time,real time(for floating points) */

/*Assume you have four variables ( a, b,c, and d )  in your testbench top. 
a and b are of the 8-bit reg type, while c and d are of the integer type. initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. 
Add a code to print the values of all the variables after 12 nSec.*/

module tb;
  reg [7:0] a;
  reg [7:0] b;
  integer c;
  integer d;
  initial begin
    a=8'd12;
    b=8'd34;
    c=32'd67;
    d=32'd255;
    #12;
    $display("The value of a is %d \n The value of b is %d \n The value of c is %d \n The value of d is %d",a,b,c,d);
  end
 endmodule
