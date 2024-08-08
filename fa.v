`timescale 1ns / 1ps
module fa (
    input [31:0] a,             
    input [31:0] b,             
    input clk,
    input v,                    // 덧셈기 활성화 신호 
    output reg [31:0] sum,      
    output reg valid           
);

reg [23:0] A_Mantissa, B_Mantissa;
reg [23:0] Temp_Mantissa;
reg [22:0] Mantissa;
reg [7:0] Exponent;
reg Sign;
reg [7:0] A_Exponent, B_Exponent, Temp_Exponent, diff_Exponent;
reg A_sign, B_sign, Temp_sign;
reg [32:0] Temp;
reg carry;
reg [2:0] one_hot;
reg comp;
reg [7:0] exp_adjust;
integer i;

always @(posedge clk) begin
    if (v) begin           // Only execute when v is 1
        comp =  (a[30:23] >= b[30:23]) ? 1'b1 : 1'b0;
  
        A_Mantissa = comp ? {1'b1, a[22:0]} : {1'b1, b[22:0]};
        A_Exponent = comp ? a[30:23] : b[30:23];
        A_sign = comp ? a[31] : b[31];
  
        B_Mantissa = comp ? {1'b1, b[22:0]} : {1'b1, a[22:0]};
        B_Exponent = comp ? b[30:23] : a[30:23];
        B_sign = comp ? b[31] : a[31];

        diff_Exponent = A_Exponent - B_Exponent;
        B_Mantissa = (B_Mantissa >> diff_Exponent);
        {carry, Temp_Mantissa} =  (A_sign ~^ B_sign) ? A_Mantissa + B_Mantissa : A_Mantissa - B_Mantissa ; 
        exp_adjust = A_Exponent;
        if (carry) begin
            Temp_Mantissa = Temp_Mantissa >> 1;
            exp_adjust = exp_adjust + 1'b1;
        end else begin
            for(i = 0; i < 24; i = i + 1) begin
               if (Temp_Mantissa[23]) begin
                   i = 24;
               end
               Temp_Mantissa = Temp_Mantissa << 1;
               exp_adjust = exp_adjust - 1'b1;
            end
        end

        Sign = A_sign;
        Mantissa = Temp_Mantissa[22:0];
        Exponent = exp_adjust;
        sum = {Sign, Exponent, Mantissa};   // Updated output signal to sum

        valid <= 1'b1;   // Set valid to 1 for one clock cycle
    end else begin
        sum <= sum;      // Maintain the previous sum value
        valid <= 1'b0;   // Ensure valid is 0 when not active
    end
end

endmodule
