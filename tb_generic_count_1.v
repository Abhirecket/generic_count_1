`timescale 1ns / 1ps

module tb_generic_count_1;
parameter WIDTH = 32 ;
parameter DEPTH = $clog2(WIDTH); 
    // Inputs
    reg [WIDTH-1:0] d_in;
    reg clk, rst;

    // Outputs
    wire [DEPTH-1:0] d_out;

    // Instantiate the unit under test (UUT)
    generic_count_1 uut      
    (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .d_out(d_out)
    );

    // Clock generation
    always begin
        clk = 0;
        #5; // Half clock period
        clk = 1;
        #5; // Half clock period
    end

    // Reset generation
    initial begin
        rst = 1;
        #5; // Assert reset for 10 time units
        rst = 0;
    end

    // Stimulus
    initial begin
        // Initialize inputs
        d_in = 0;
        
        // Apply stimulus here
        @(posedge clk)
        // Example: 
         d_in = 7'b0000001; //1 Sample input
        @(posedge clk)
         d_in = 7'b0101001; //3 Sample input
        @(posedge clk)
         d_in = 7'b0111101; //5 Sample input
        @(posedge clk)
         d_in = 7'b1110101; //5 Sample input
        @(posedge clk)
         d_in = 7'b0010101; //3 Sample input
        @(posedge clk)
        d_in = 0;
        
        #50; // Wait for 50 time units
        
        // Add more stimulus if needed
        
        // Terminate simulation
        $finish;
    end

//    // Monitor
//    always @(posedge clk) begin
//        // Add monitor logic here if needed
//    end

endmodule

