`timescale 1ns/1ps

//--------------------
//      DESIGN
//--------------------

module nand_gate (a,b,out);
  input a,b;
  output out;
  
  assign out = !(a & b);
endmodule

//--------------------
//     TESTBENCH
//--------------------

module tb;
  reg a,b;
  wire out;
  
  nand_gate dut(.a(a),.b(b),.out(out));
  
  initial begin
    $display("NAND Gate Operation: ");
    a=0; b=0; #10 $display("%b NAND %b = %b",a,b,out);
    a=0; b=1; #10 $display("%b NAND %b = %b",a,b,out);
    a=1; b=0; #10 $display("%b NAND %b = %b",a,b,out);
    a=1; b=1; #10 $display("%b NAND %b = %b",a,b,out);
    $finish;
  end
endmodule
