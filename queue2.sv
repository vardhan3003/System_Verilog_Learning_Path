/*Create a Fixed-size array capable of storing 20 elements. 
Add random values to all the 20 elements by using $urandom function. Now add all the elements of the fixed-size array to the Queue in such a way that the first element of the 
Fixed-size array should be the last element of the Queue. Print all the elements of both fixed-size array and Queue on Console.*/

module tb;
  int arr[20];
  int i;
  
  initial begin
    for(i=0;i<20;i++)
      arr[i]=$urandom();
  end
  
  int queue[$];
  
  initial begin
    for(i=0;i<20;i++)
      queue.push_front(arr[i]);  
  end
  
  initial begin
    $display("The array arr is %0p",arr);
    $display("The queue queue is %0p",queue);
  end
  
endmodule
