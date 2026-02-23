//---------------------
//		DESIGN
//---------------------

module ring_counter (
  input wire clk,			//clock
  input wire rst,			//reset
  input wire en,			//enable
  output reg [3:0] count); //output count

  //ring counter logic - shifts single '1' through the register
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b0001;  // Initialize with LSB as '1'
    end else if (en) begin
      // Shift left with wrap-around (MSB goes to LSB)
      count <= {count[2:0], count[3]};
    end
  end
  
endmodule


//---------------------
//		TESTBENCH
//---------------------

module ring_counter_tb;
  reg clk, rst, en;
  wire [3:0] count;
    
  ring_counter dut (.clk(clk),.rst(rst),.en(en),.count(count));
    
  always #5 clk = ~clk;
    
  initial begin
    clk = 0; rst = 0; en = 0;
        
    // Test sequence
    #10 rst = 1;
    #20 rst = 0;
    #10 en = 1;
    #160;
    $finish;
  end
    
  always @(posedge clk) begin
    if (en)
      $display("Count: %b",count);
  end
  
endmodule
