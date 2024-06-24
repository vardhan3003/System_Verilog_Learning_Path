/*For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5. 
Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b. 
Add Constraint Code and Testbench top code to  the Design.*/

class generator;
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  int min;
  int max;
  
  function new(input int min, input int max);
    this.min = min;
    this.max = max;  
  endfunction
  
   constraint data {
    a inside {[min:max]};
    b inside {[min:max-3]};
  }
  
endclass

module top;
  int i;
  int status=0;
  generator g;
  initial begin
    g=new(0,8);   
    for(i=0;i<20;i++) begin
      status=g.randomize();
      if (status) begin
        $display("The value of a and b are:%0d and %0d respectively",g.a,g.b);
        #20;
      end
      else begin
        $display("Randomization Failed");
      end
      
    end
  end
  
endmodule
