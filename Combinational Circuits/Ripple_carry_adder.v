//4 bit Ripple Carry Adder using Fulladder
//-------------------------------------
//   DESIGN - Ripple_carry_adder.v
//-------------------------------------

//Fulladder module
module full_adder (
  input a,b,cin,
  output sum,cout);
  
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a );
endmodule

//Ripple carry adder module
module ripple_carry_adder (
  input [3:0]a,			//4 bit input a
  input [3:0]b,			//4 bit input b
  input cin,			//carry input
  output [3:0]sum,		//sum output
  output cout);			//carry output
  
  wire [3:0]carry;		//Internal carry wire
  
  // Instantiating 4 fulladders in cascade
  full_adder fa0 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(carry[0]));
  
  full_adder fa1 (.a(a[1]),.b(b[1]),.cin(carry[0]),.sum(sum[1]),.cout(carry[1]));
  
  full_adder fa2 (.a(a[2]),.b(b[2]),.cin(carry[1]),.sum(sum[2]),.cout(carry[2]));
  
  full_adder fa3 (.a(a[3]),.b(b[3]),.cin(carry[2]),.sum(sum[3]),.cout(cout));
  
endmodule

//-------------------------------------
// TESTBENCH - Ripple_carry_adder_tb.v
//-------------------------------------

module tb;
  reg [3:0]a; 
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  
  ripple_carry_adder dut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  
  initial begin
    
    //To generate multiple random test cases automatically
    /*repeat (20) begin
      a = $random; b = $random; cin = $random; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    end*/
    
    //Test case -1: Basic Addition without carry input
    a = 4'b0000; b = 4'b0000; cin = 1'b0; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    a = 4'b0101; b = 4'b0010; cin = 1'b0; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    
    //Test case -2: Addition with carry input
    a = 4'b0100; b = 4'b0001; cin = 1'b1; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    a = 4'b0011; b = 4'b1101; cin = 1'b1; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);

    //Test case -3: overflow cases
    a = 4'b1111; b = 4'b0001; cin = 1'b0; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    a = 4'b1111; b = 4'b1111; cin = 1'b0; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    a = 4'b1111; b = 4'b1111; cin = 1'b1; #10 
    $display("a= %b, b= %b, cin= %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    
  end
endmodule
