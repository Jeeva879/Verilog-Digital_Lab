//---------------------------------
//     DESIGN - DeMux_1to2.v
//---------------------------------

module demux_1to2(
    input data_in,
    input sel,           // 1-bit select line
    output out0,         // Output when sel=0
    output out1          // Output when sel=1
);

  assign out0 = (sel == 1'b0) ? data_in : 1'b0;      
  assign out1 = (sel == 1'b1) ? data_in : 1'b0;

endmodule

//---------------------------------
//     TESTBENCH - DeMux_1to2_tb.v
//---------------------------------

module demux_1to2_tb;

    reg data_in;
    reg sel;
    wire out0, out1;
    
  demux_1to2 dut (
      .data_in(data_in),
      .sel(sel),
      .out0(out0),
      .out1(out1));
    
  initial begin
        data_in = 1'b0;
        sel = 1'b0;
       

        // Test cases
      #10 data_in = 1'b1; sel = 1'b0; 
      $display("data_in= %b, sel= %b --> out0= %b,out1= %b",data_in,sel,out0,out1);
      #10 sel = 1'b1;
      $display("data_in= %b, sel= %b --> out0= %b,out1= %b",data_in,sel,out0,out1);
      #10 data_in = 1'b0;
      #10 sel = 1'b0;
      $display("data_in= %b, sel= %b --> out0= %b,out1= %b",data_in,sel,out0,out1);
      #10 data_in = 1'b1; sel = 1'b1;
      $display("data_in= %b, sel= %b --> out0= %b,out1= %b",data_in,sel,out0,out1);
      #10 data_in = 1'b0;
      #10 sel = 1'b0; 
      $display("data_in= %b, sel= %b --> out0= %b,out1= %b",data_in,sel,out0,out1);
      #10 $finish;
    end

endmodule
