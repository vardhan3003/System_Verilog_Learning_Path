module tb;

  // Recursive Fibonacci function WITH automatic
  function automatic int fib(input int n);
    int result;  // Now this variable is unique to each recursive call
    if (n == 0)
      result = 0;
    else if (n == 1)
      result = 1;
    else
      result = fib(n-1) + fib(n-2); // Recursive calls
    return result;
  endfunction

  initial begin
    int x = 5;
    $display("Fibonacci(%0d) = %0d", x, fib(x));  // Output: 5
  end
endmodule
