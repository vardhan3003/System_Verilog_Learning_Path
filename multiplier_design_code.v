module multiply(input clk,input [3:0] a,b,output reg [7:0] res);
  
  always @(posedge clk)
    res=a*b;
  
endmodule
