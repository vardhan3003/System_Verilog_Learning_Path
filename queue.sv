// Create Queue.

module tb;

  int queue[$];

  int x,k;

  initial begin

    queue={1,3};

    $display("arr:%0p",queue);

    queue.push_front(0); //Adding at the start

    $display("arr:%0p",queue);

    queue.push_back(4);  //Adding at the end

    $display("arr:%0p",queue);

    queue.insert(2,2);  //Adding at the position 2 with the value 2 (position,value)

    $display("arr:%0p",queue);

    k=queue.pop_front(); //deleting at the start

    $display("Deleted value :%0d",k);

    $display("arr:%0p",queue);

    x=queue.pop_back(); //deleting at the end 

    $display("Deleted value:%0d",x);

    $display("arr:%0p",queue);

    queue.delete(1);//delete at a specific index

    $display("arr:%0p",queue);

  end

endmodule

