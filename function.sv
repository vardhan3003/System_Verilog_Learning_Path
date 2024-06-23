/*Create a function that will perform the multiplication of the two unsigned integer variables. 
Compare values return by function with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".*/

module tb;
  bit [31:0] a;
  bit [31:0] b;
  bit [31:0] result;
  
  function int multiply();
    return a*b;
  endfunction
  
  initial begin
    a=32'd3;
    b=32'd9;
    
    result=multiply();
    
    if (result==32'd27)
      $display(" The value of the result is : %d --->Passed",result);
    else
      $display("Result = %d Failed",result);
    
  end
  
endmodule
