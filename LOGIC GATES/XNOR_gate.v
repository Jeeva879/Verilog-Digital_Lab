`timescale 1ns/1ps

//--------------------
//       DESIGN
//--------------------

module xnor_gate (a,b,out);
  input a,b;
  output out;
  
  assign out = !(a ^ b);
  //assign out = (!a & !b) | (a & b);        // Boolean Expression for XNOR gate
endmodule

//--------------------
//      TESTBENCH
//--------------------

module tb;
  reg a,b;
  wire out;
  
  xnor_gate dut(.a(a),.b(b),.out(out));
  
  initial begin
    $display("XNOR Gate Operation: ");
    a=0; b=0; #10 $display("%b XNOR %b = %b",a,b,out);
    a=0; b=1; #10 $display("%b XNOR %b = %b",a,b,out);
    a=1; b=0; #10 $display("%b XNOR %b = %b",a,b,out);
    a=1; b=1; #10 $display("%b XNOR %b = %b",a,b,out);
    $finish;
  end
endmodule
