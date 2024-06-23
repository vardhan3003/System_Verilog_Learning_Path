/*Create two arrays of reg type capable of storing 15 elements. Use $urandom function to add 15 values to the array. Print the value of all the elements of the array on a single line.*/

module tb;
  reg [7:0] arr[15];
  reg [7:0] arr1[15];
  int i=0;
  initial begin
    for(i=0;i<15;i++) begin
      arr[i]=$urandom();
      arr1[i]=$urandom();
    end
  end
  initial begin
    #10;
    $display("The values of the array are:%0p",arr);
    $display("The values of the array are:%0p",arr1);
  end
endmodule
