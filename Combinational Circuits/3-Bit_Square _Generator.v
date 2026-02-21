`timescale 1ns/1ps

//--------------------
//		DESIGN
//--------------------

module Square_generator (a,b,c,y0,y1,y2,y3,y4,y5);
  input a,b,c;
  output y0,y1,y2,y3,y4,y5;

  //Boolean Expressions are assigned to dedicated ports
  assign y0 = c;
  assign y1 = 0;
  assign y2 = (b & !c);
  assign y3 = (a & !b & c) | (!a & b & c);
  assign y4 = (a & !b) | (a & c);
  assign y5 = a & b;
endmodule

//--------------------
//		TESTBENCH
//--------------------

module tb;
  reg a,b,c;
  wire y0,y1,y2,y3,y4,y5;
  
  Square_generator dut(a,b,c,y0,y1,y2,y3,y4,y5);
  
  initial begin
    
    a=0; b=0; c=0; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=0; b=0; c=1; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=0; b=1; c=0; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=0; b=1; c=1; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=1; b=0; c=0; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=1; b=0; c=1; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=1; b=1; c=0; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    
    a=1; b=1; c=1; #10 
    $display("square value of %b%b%b = %b%b%b%b%b%b",a,b,c,y5,y4,y3,y2,y1,y0);
    $finish;
  end
endmodule
