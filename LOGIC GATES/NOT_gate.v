`timescale 1ns/1ps

//--------------------
//		DESIGN
//--------------------

module not_gate (a,out);
  input a;
  output out;
  
  assign out = !a;
endmodule

//--------------------
//		TESTBENCH
//--------------------

module tb;
  reg a;
  wire out;
  
  not_gate dut(.a(a),.out(out));
  
  initial begin
    $display("NOT Gate Operation: ");
    a=0; #10 $display("!%b = %b",a,out);
    a=1; #10 $display("!%b = %b",a,out);
    $finish;
  end
endmodule
