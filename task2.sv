/*Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). 
Store this value in the local array of the testbench top and also print the value of each element of this array on the console.*/

module tb;
 
  
  task automatic gen( ref int value,ref int ans);
    ans = 8*value;
  endtask
  
  int value;
  int ans;
  int i;
  
  initial begin
    for(i=0;i<32;i++) begin
      gen(i,ans);
      $display("8 * %d = %d",i,ans);
    end
    $finish();
  end
  
endmodule
