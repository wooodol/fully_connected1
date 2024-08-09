/* Single Precision Floating Point Adder with Valid Signal */

`timescale 1ns / 1ps
module fa(
    input [31:0] a,
    input [31:0] b,
    input clk,
    input v,                   // Module activation signal
    output reg [31:0] sum,     // Result of the addition
    output reg valid           // Indicates when the computation is complete
);

reg [23:0] A_Mantissa, B_Mantissa;
reg [23:0] Temp_Mantissa;
reg [22:0] Mantissa;
reg [7:0] Exponent;
reg Sign;
reg [7:0] A_Exponent, B_Exponent, diff_Exponent;
reg A_sign, B_sign;
reg carry;
reg [7:0] exp_adjust;
reg zero_flag;
reg exp_overflow, exp_underflow;  // Overflow and underflow flags
reg comp;  // Compare flag

always @(posedge clk) begin
    if (v) begin
        exp_overflow = 0;
        exp_underflow = 0;

        // Compare exponents to align the mantissas
        comp =  (a[30:23] > b[30:23]) || ((a[30:23] == b[30:23]) && (a[22:0] >= b[22:0])) ? 1'b1 : 1'b0;
      
        A_Mantissa = comp ? {1'b1, a[22:0]} : {1'b1, b[22:0]};
        A_Exponent = comp ? a[30:23] : b[30:23];
        A_sign = comp ? a[31] : b[31];
      
        B_Mantissa = comp ? {1'b1, b[22:0]} : {1'b1, a[22:0]};
        B_Exponent = comp ? b[30:23] : a[30:23];
        B_sign = comp ? b[31] : a[31];

        // Align mantissas by shifting the smaller one
        diff_Exponent = A_Exponent - B_Exponent;
        B_Mantissa = (B_Mantissa >> diff_Exponent);

        // Perform addition or subtraction based on signs
        {carry, Temp_Mantissa} = (A_sign == B_sign) ? A_Mantissa + B_Mantissa : A_Mantissa - B_Mantissa;

        exp_adjust = A_Exponent;

        // Normalize the result
        if (carry) begin
            Temp_Mantissa = Temp_Mantissa >> 1;
            exp_adjust = exp_adjust + 1'b1;
            if (exp_adjust == 8'b11111111) begin
                exp_overflow = 1;  // Set overflow flag
            end
        end else begin
            zero_flag = (Temp_Mantissa == 0);  // Check if mantissa is zero
            while (!Temp_Mantissa[23] && !zero_flag) begin
                Temp_Mantissa = Temp_Mantissa << 1;
                exp_adjust = exp_adjust - 1'b1;
                if (exp_adjust == 8'b00000000) begin
                    exp_underflow = 1;  // Set underflow flag
                end
            end
        end

        // Determine sign of the result
        Sign = (Temp_Mantissa == 0) ? 0 : (A_sign == B_sign) ? A_sign : Temp_Mantissa[23] ? A_sign : B_sign;

        // Handle overflows and underflows
        if (exp_overflow) begin
            sum = {Sign, 8'b11111111, 23'b0};  // Infinity
        end else if (exp_underflow) begin
            sum = {Sign, 8'b00000000, 23'b0};  // Zero
        end else begin
            Mantissa = Temp_Mantissa[22:0];
            Exponent = exp_adjust;
            sum = {Sign, Exponent, Mantissa};  // Normal result
        end

        valid <= 1'b1;  // Set valid to indicate completion
    end else begin
        valid <= 1'b0;  // Reset valid when v is not active
    end
end

endmodule
