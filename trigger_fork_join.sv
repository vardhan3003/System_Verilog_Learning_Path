/*Create two tasks each capable of sending a message to Console at a fixed interval. 
Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. 
Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger. 
Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.*/
module top;
  event t1_done;
  event t2_done;
  
  int t1_count;
  int t2_count;
  
  task task1();
    #20;
    $display("Task1 Triggered");
    ->t1_done;
  endtask
  
  task task2();
    #40;
    $display("Task2 Triggered");
    ->t2_done;
  endtask
  
  task count();
    wait(t1_done.triggered);
    t1_count=t1_count+1;
    wait(t2_done.triggered);
    t2_count=t2_count+1;
  endtask
  
  integer i;
  initial begin
    for(i=0;i<20;i++) begin
      fork
        task1();
        task2();
        count();       
      join
    end
    
  end
  
  initial begin
    #200;
    $display("The count of the Task1:%0d, The count of the Task2:%0d",t1_count,t2_count);
    $finish();
  end
  
  
endmodule
