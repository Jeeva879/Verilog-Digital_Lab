//Halfadder using Dataflow modeling
//-----------------
//     DESIGN 
//-----------------

module half_adder (
  input a,b,
  output sum,carry);

  //dataflow modeling
  assign sum = a ^ b;
  assign carry = a & b;
  
endmodule

//-----------------
//   TESTBENCH 
//-----------------

module half_adder_tb;
  reg a,b;
  wire sum,carry;
  
  half_adder dut(.a(a),.b(b),.sum(sum),.carry(carry));    
  
  initial begin
    $display("-------------------------");
    $display("  a    b  |  sum  carry  ");
    $display("-------------------------");

    a = 1'b0; b = 1'b0; #10;
    $display("  %b    %b  |   %b     %b", a, b, sum, carry);

    a = 1'b0; b = 1'b1; #10;
    $display("  %b    %b  |   %b     %b", a, b, sum, carry);

    a = 1'b1; b = 1'b0; #10;
    $display("  %b    %b  |   %b     %b", a, b, sum, carry);

    a = 1'b1; b = 1'b1; #10;
    $display("  %b    %b  |   %b     %b", a, b, sum, carry);

    $display("-------------------------");
    $finish;
  end
  
endmodule
