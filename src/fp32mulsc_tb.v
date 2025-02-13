`timescale 1ns/10ps
module fp32mulsc_tb();

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] z;

    fp32mulsc DUT (
        .a(a), 
        .b(b), 
        .z(z)
    );

    initial begin
        // Test case 1: 1.5 * 2.0 = 3.0
        a = 32'h3fc00000; 
        b = 32'h40000000; 
        #10;
        $display("Test case 1: a = %h, b = %h, z = %h", a, b, z);

        // Test case 2: -2.5 * 4.0 = -10.0
        a = 32'hc0200000; 
        b = 32'h40800000; 
        #10;
        $display("Test case 2: a = %h, b = %h, z = %h", a, b, z);

        // Test case 3: 0 * 5.0 = 0
        a = 32'h00000000; 
        b = 32'h40a00000; 
        #10;
        $display("Test case 3: a = %h, b = %h, z = %h", a, b, z);

        // Test case 4: NaN * 3.0 = NaN
        a = 32'h7fc00000; 
        b = 32'h40400000; 
        #10;
        $display("Test case 4: a = %h, b = %h, z = %h", a, b, z);

        // Test case 5: Inf * 2.0 = Inf
        a = 32'h7f800000; 
        b = 32'h40000000; 
        #10;
        $display("Test case 5: a = %h, b = %h, z = %h", a, b, z);

        // Test case 6: -Inf * 3.0 = -Inf
        a = 32'hff800000; 
        b = 32'h40400000; 
        #10;
        $display("Test case 6: a = %h, b = %h, z = %h", a, b, z);

        // Test case 7: 1.5 * -2.0 = -3.0
        a = 32'h3fc00000; 
        b = 32'hc0000000; 
        #10;
        $display("Test case 7: a = %h, b = %h, z = %h", a, b, z);

        // Test case 8: Small numbers
        a = 32'h00000001; 
        b = 32'h00800000; 
        #10;
        $display("Test case 8: a = %h, b = %h, z = %h", a, b, z);

        // Test case 9: Zero * Zero
        a = 32'h00000000; 
        b = 32'h00000000; 
        #10;
        $display("Test case 9: a = %h, b = %h, z = %h", a, b, z);

	// Test case 10: +Infinity * +Infinity
        a = 32'h7F800000;
        b = 32'h7F800000; 
        #10;
        $display("Test 10: %h * %h = %h", a, b, z);

        // Test case 11:  -Infinity * -Infinity
        a = 32'hFF800000; 
        b = 32'hFF800000; 
        #10;
        $display("Test 11: %h * %h = %h", a, b, z);

        // Test case 12:  +Infinity * -Infinity
        a = 32'h7F800000; 
        b = 32'hFF800000; 
        #10;
        $display("Test 12: %h * %h = %h", a, b, z);

        // Test case 13:  NaN * NaN
        a = 32'h7FC00000; 
        b = 32'h7FC00000; 
        #10;
        $display("Test 13: %h * %h = %h", a, b, z);

        // Test case 14:  NaN * +Infinity
        a = 32'h7FC00000; 
        b = 32'h7F800000;
        #10;
        $display("Test 14: %h * %h = %h", a, b, z);

        // Test case 15:  NaN * -Infinity
        a = 32'h7FC00000; 
        b = 32'hFF800000; 
        #10;
        $display("Test 15: %h * %h = %h", a, b, z);

        // Test case 16:  NaN * 0
        a = 32'h7FC00000; 
        b = 32'h00000000; 
        #10;
        $display("Test 16: %h * %h = %h", a, b, z);

        // Test case 17:  +Infinity * 0
        a = 32'h7F800000;
        b = 32'h00000000; 
        #10;
        $display("Test 17: %h * %h = %h", a, b, z);

        // Test case 18:  -Infinity * 0
        a = 32'hFF800000; 
        b = 32'h00000000; 
        #10;
        $display("Test 18: %h * %h = %h", a, b, z);

        $stop;
    end

endmodule
