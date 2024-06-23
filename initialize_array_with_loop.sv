/*Create an array capable of storing 10 elements of an unsigned integer. Initialize all the 10 elements to a value equal to the square of the index of that element. 
for e.g. first element has index no. 0 so initialize it to 0, the second element has index no. 1 so initialize it to 1, the third element has index no. 2 so initialize it to 4, and so on. 
Verify the code by sending values of all the elements on Console.*/

module tb;
  bit [31:0] arr[10];
  int i=0;
  initial begin
    for(i=0;i<10;i++) begin
      arr[i]=i*i;
    end
  end
  initial begin
    #10;
    $display("The values of the array are:%0p",arr);
  end
endmodule

