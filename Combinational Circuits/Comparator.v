//        3-bit Comparator
//---------------------------------
//     DESIGN - Comparator.v
//---------------------------------

module comparator(
  input [2:0]a,b,     //3 bit input a,b
  output a_ge_b,      //Output a greater than b
  output a_le_b, 		  //Output a less than b
  output a_eq_b);  		//Output a equal to b


  assign a_ge_b = (a > b);
  assign a_le_b = (a < b);
  assign a_eq_b = (a == b);

endmodule

//---------------------------------
//  TESTBENCH - Comparator_tb.v
//---------------------------------


module comparator_tb;
  reg [2:0] a, b;
  wire a_ge_b, a_le_b, a_eq_b;

  comparator dut (.a(a),
                  .b(b),
                  .a_ge_b(a_ge_b),
                  .a_le_b(a_le_b),
                  .a_eq_b(a_eq_b));

  initial begin

    // Test cases
    a = 3'b101; b = 4'b100; #10; 
    $display("a= %b,b= %b, a>b= %b, a<b= %b, a==b = %b",a,b,a_ge_b,a_le_b,a_eq_b);
    
    a = 3'b100; b = 4'b101; #10; 
    $display("a= %b,b= %b, a>b= %b, a<b= %b, a==b = %b",a,b,a_ge_b,a_le_b,a_eq_b);
    
    a = 3'b101; b = 4'b101; #10; 
    $display("a= %b,b= %b, a>b= %b, a<b= %b, a==b = %b",a,b,a_ge_b,a_le_b,a_eq_b);
    #10 $finish;
  end

endmodule
