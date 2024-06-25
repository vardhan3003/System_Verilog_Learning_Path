/*Take the help of pseudo-random number generator to generate values for wr and rst signal. rst should be low for apprx. 
30% of time whie wr should be high for apprx. 50% of time. Verify your code for 20 iterations by sending values of both wr and rst on a console. 
Generator code is mentioned in the Instruction tab.*/

class generator;
  
  rand bit rst;
  rand bit wr;
  
  constraint data{ rst dist{0:=30,1:=70};
                  wr   dist{0:=50,1:=50};
                 }
  function void display();
    $display("The value of rst:%0d and value of wr:%0d",rst,wr);
  endfunction
  
endclass

module tb;
  int i;
  generator g;
  initial begin
    g=new();
    for(i=0;i<20;i++) begin
      g.randomize();
      g.display();
    end
  end
endmodule
