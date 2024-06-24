/*Create a deep copy of the Generator class. To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top.
Print the value of data members in the generator class as well as copied class. Refer Instruction tab for Generator class code.*/
class generator;  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
  
  function generator copy();
    copy=new();
    copy.a=a;
    copy.b=b;
    copy.wr=wr;
    copy.en=en;
    copy.s=s;
  endfunction
 
endclass

module tb;
  
  generator g;
  generator g1;
  
  initial begin
    g=new();
    g1=g.copy();
    g1.a=6;
    g1.display();
    g.display();
  end
  
endmodule
