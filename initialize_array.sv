module tb;
  int element  [5]='{1,2,3,4,5}; //Unique values
  int element1 [5]='{5{1}};      //Repetive Values
  int element2  [5]='{default:1}; //default values
  
  initial begin
    $display("The array element is %0p",element);
    $display("The array element1 is %0p",element1);
    $display("The array element2 is %0p",element2);
  end
  
endmodule
