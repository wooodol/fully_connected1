`timescale 1ns / 1ps

module fully_connected #(parameter INPUT_NUM = 1536, OUTPUT_NUM = 512, DATA_BITS = 32) (
   input clk,
   input rst_n,
   input valid_in,
   input [DATA_BITS-1:0] data_in_1,  input [DATA_BITS-1:0] data_in_2,  input [DATA_BITS-1:0] data_in_3,
   input [DATA_BITS-1:0] data_in_4,  input [DATA_BITS-1:0] data_in_5,  input [DATA_BITS-1:0] data_in_6,
   input [DATA_BITS-1:0] data_in_7,  input [DATA_BITS-1:0] data_in_8,  input [DATA_BITS-1:0] data_in_9,
   input [DATA_BITS-1:0] data_in_10, input [DATA_BITS-1:0] data_in_11, input [DATA_BITS-1:0] data_in_12,
   input [DATA_BITS-1:0] data_in_13, input [DATA_BITS-1:0] data_in_14, input [DATA_BITS-1:0] data_in_15,
   input [DATA_BITS-1:0] data_in_16, input [DATA_BITS-1:0] data_in_17, input [DATA_BITS-1:0] data_in_18,
   input [DATA_BITS-1:0] data_in_19, input [DATA_BITS-1:0] data_in_20, input [DATA_BITS-1:0] data_in_21,
   input [DATA_BITS-1:0] data_in_22, input [DATA_BITS-1:0] data_in_23, input [DATA_BITS-1:0] data_in_24,
   input [DATA_BITS-1:0] data_in_25, input [DATA_BITS-1:0] data_in_26, input [DATA_BITS-1:0] data_in_27,
   input [DATA_BITS-1:0] data_in_28, input [DATA_BITS-1:0] data_in_29, input [DATA_BITS-1:0] data_in_30,
   input [DATA_BITS-1:0] data_in_31, input [DATA_BITS-1:0] data_in_32, input [DATA_BITS-1:0] data_in_33,
   input [DATA_BITS-1:0] data_in_34, input [DATA_BITS-1:0] data_in_35, input [DATA_BITS-1:0] data_in_36,
   input [DATA_BITS-1:0] data_in_37, input [DATA_BITS-1:0] data_in_38, input [DATA_BITS-1:0] data_in_39,
   input [DATA_BITS-1:0] data_in_40, input [DATA_BITS-1:0] data_in_41, input [DATA_BITS-1:0] data_in_42,
   input [DATA_BITS-1:0] data_in_43, input [DATA_BITS-1:0] data_in_44, input [DATA_BITS-1:0] data_in_45,
   input [DATA_BITS-1:0] data_in_46, input [DATA_BITS-1:0] data_in_47, input [DATA_BITS-1:0] data_in_48,
   input [DATA_BITS-1:0] data_in_49, input [DATA_BITS-1:0] data_in_50, input [DATA_BITS-1:0] data_in_51,
   input [DATA_BITS-1:0] data_in_52, input [DATA_BITS-1:0] data_in_53, input [DATA_BITS-1:0] data_in_54,
   input [DATA_BITS-1:0] data_in_55, input [DATA_BITS-1:0] data_in_56, input [DATA_BITS-1:0] data_in_57,
   input [DATA_BITS-1:0] data_in_58, input [DATA_BITS-1:0] data_in_59, input [DATA_BITS-1:0] data_in_60,
   input [DATA_BITS-1:0] data_in_61, input [DATA_BITS-1:0] data_in_62, input [DATA_BITS-1:0] data_in_63,
   input [DATA_BITS-1:0] data_in_64, input [DATA_BITS-1:0] data_in_65, input [DATA_BITS-1:0] data_in_66,
   input [DATA_BITS-1:0] data_in_67, input [DATA_BITS-1:0] data_in_68, input [DATA_BITS-1:0] data_in_69,
   input [DATA_BITS-1:0] data_in_70, input [DATA_BITS-1:0] data_in_71, input [DATA_BITS-1:0] data_in_72,
   input [DATA_BITS-1:0] data_in_73, input [DATA_BITS-1:0] data_in_74, input [DATA_BITS-1:0] data_in_75,
   input [DATA_BITS-1:0] data_in_76, input [DATA_BITS-1:0] data_in_77, input [DATA_BITS-1:0] data_in_78,
   input [DATA_BITS-1:0] data_in_79, input [DATA_BITS-1:0] data_in_80, input [DATA_BITS-1:0] data_in_81,
   input [DATA_BITS-1:0] data_in_82, input [DATA_BITS-1:0] data_in_83, input [DATA_BITS-1:0] data_in_84,
   input [DATA_BITS-1:0] data_in_85, input [DATA_BITS-1:0] data_in_86, input [DATA_BITS-1:0] data_in_87,
   input [DATA_BITS-1:0] data_in_88, input [DATA_BITS-1:0] data_in_89, input [DATA_BITS-1:0] data_in_90,
   input [DATA_BITS-1:0] data_in_91, input [DATA_BITS-1:0] data_in_92, input [DATA_BITS-1:0] data_in_93,
   input [DATA_BITS-1:0] data_in_94, input [DATA_BITS-1:0] data_in_95, input [DATA_BITS-1:0] data_in_96,
   input [DATA_BITS-1:0] data_in_97, input [DATA_BITS-1:0] data_in_98, input [DATA_BITS-1:0] data_in_99,
   input [DATA_BITS-1:0] data_in_100, input [DATA_BITS-1:0] data_in_101, input [DATA_BITS-1:0] data_in_102,
   input [DATA_BITS-1:0] data_in_103, input [DATA_BITS-1:0] data_in_104, input [DATA_BITS-1:0] data_in_105,
   input [DATA_BITS-1:0] data_in_106, input [DATA_BITS-1:0] data_in_107, input [DATA_BITS-1:0] data_in_108,
   input [DATA_BITS-1:0] data_in_109, input [DATA_BITS-1:0] data_in_110, input [DATA_BITS-1:0] data_in_111,
   input [DATA_BITS-1:0] data_in_112, input [DATA_BITS-1:0] data_in_113, input [DATA_BITS-1:0] data_in_114,
   input [DATA_BITS-1:0] data_in_115, input [DATA_BITS-1:0] data_in_116, input [DATA_BITS-1:0] data_in_117,
   input [DATA_BITS-1:0] data_in_118, input [DATA_BITS-1:0] data_in_119, input [DATA_BITS-1:0] data_in_120,
   input [DATA_BITS-1:0] data_in_121, input [DATA_BITS-1:0] data_in_122, input [DATA_BITS-1:0] data_in_123,
   input [DATA_BITS-1:0] data_in_124, input [DATA_BITS-1:0] data_in_125, input [DATA_BITS-1:0] data_in_126,
   input [DATA_BITS-1:0] data_in_127, input [DATA_BITS-1:0] data_in_128, //... up to input [DATA_BITS-1:0] data_in_128,
   output reg [DATA_BITS-1:0] data_out,
   output reg valid_out_fc,
   output reg [DATA_BITS-1:0] fa_a,fa_b,
   output wire [DATA_BITS-1:0] fa_sum,
   output reg [DATA_BITS-1:0] partial_sum,
   output reg [DATA_BITS-1:0] fm_a, fm_b,
   output wire [DATA_BITS-1:0] fm_z,
   output reg fm_valid_d1,
   output reg fa_valid_d1,
   output reg state,
   output reg [9:0] buf_idx,
   output reg r,
   output reg fm_valid,
   output reg fa_valid,
   output reg [10:0] sum_idx,
   output reg [9:0] data_out_num
);//입출력 포트 정의

localparam INPUT_WIDTH = 12;
localparam INPUT_NUM_DATA_BITS = 11;//파라미터 정의

reg [9:0] out_idx;
reg [DATA_BITS-1:0] buffer [0:INPUT_NUM - 1];
reg [DATA_BITS-1:0] weight [0:INPUT_NUM * OUTPUT_NUM - 1];
reg [DATA_BITS-1:0] bias [0:OUTPUT_NUM - 1];

wire fa_valid_d;
wire fm_valid_d;
reg q,w,e,t;

initial begin
   $readmemh("E:/Xilinx/project_7/project_7.srcs/sources_1/new/fc1_weight_16.txt", weight); 
   $readmemh("E:/Xilinx/project_7/project_7.srcs/sources_1/new/fc1_bias_16.txt", bias);
end //가중치, 편향값 파일 위치 주의

// 부동소수점 곱셈기 모듈 인스턴스
fm mul_inst (
    .clk(clk),
    .rst_n(rst_n),
    .a(fm_a),
    .b(fm_b),
    .z(fm_z),
    .valid(fm_valid_d),
    .v(fm_valid)
);

// 부동소수점 덧셈기 모듈 인스턴스
fa add_inst (
    .a(fa_a),
    .b(fa_b),
    .clk(clk),
    .sum(fa_sum),
    .valid(fa_valid_d),
    .v(fa_valid)
);

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        valid_out_fc <= 0;
        buf_idx <= 0;
        out_idx <= 0;
        state <= 0;
        partial_sum <= 0;
        fa_a <= 32'h00000000;
        sum_idx <= 0;
        fm_valid <= 0;
        fa_valid <= 0;
        fm_valid_d1 <= 0;
        fa_valid_d1 <= 0;
        q <= 1;
        w <= 0;
        e <= 0;
        r <= 0;
        t <= 0;
        data_out_num <= 0;
    end 
    else begin
    if(valid_out_fc==1) begin
        valid_out_fc <= 0;
    end else begin
        if (valid_in) begin
            if (~state) begin
                                buffer[buf_idx]               <= data_in_1;
                buffer[INPUT_WIDTH + buf_idx] <= data_in_2;
                buffer[INPUT_WIDTH * 2 + buf_idx]  <= data_in_3;
                buffer[INPUT_WIDTH * 3 + buf_idx]  <= data_in_4;
                buffer[INPUT_WIDTH * 4 + buf_idx]  <= data_in_5;
                buffer[INPUT_WIDTH * 5 + buf_idx]  <= data_in_6;
                buffer[INPUT_WIDTH * 6 + buf_idx]  <= data_in_7;
                buffer[INPUT_WIDTH * 7 + buf_idx]  <= data_in_8;
                buffer[INPUT_WIDTH * 8 + buf_idx]  <= data_in_9;
                buffer[INPUT_WIDTH * 9 + buf_idx]  <= data_in_10;
                buffer[INPUT_WIDTH * 10 + buf_idx] <= data_in_11;
                buffer[INPUT_WIDTH * 11 + buf_idx] <= data_in_12;
                buffer[INPUT_WIDTH * 12 + buf_idx] <= data_in_13;
                buffer[INPUT_WIDTH * 13 + buf_idx] <= data_in_14;
                buffer[INPUT_WIDTH * 14 + buf_idx] <= data_in_15;
                buffer[INPUT_WIDTH * 15 + buf_idx] <= data_in_16;
                buffer[INPUT_WIDTH * 16 + buf_idx] <= data_in_17;
                buffer[INPUT_WIDTH * 17 + buf_idx] <= data_in_18;
                buffer[INPUT_WIDTH * 18 + buf_idx] <= data_in_19;
                buffer[INPUT_WIDTH * 19 + buf_idx] <= data_in_20;
                buffer[INPUT_WIDTH * 20 + buf_idx] <= data_in_21;
                buffer[INPUT_WIDTH * 21 + buf_idx] <= data_in_22;
                buffer[INPUT_WIDTH * 22 + buf_idx] <= data_in_23;
                buffer[INPUT_WIDTH * 23 + buf_idx] <= data_in_24;
                buffer[INPUT_WIDTH * 24 + buf_idx] <= data_in_25;
                buffer[INPUT_WIDTH * 25 + buf_idx] <= data_in_26;
                buffer[INPUT_WIDTH * 26 + buf_idx] <= data_in_27;
                buffer[INPUT_WIDTH * 27 + buf_idx] <= data_in_28;
                buffer[INPUT_WIDTH * 28 + buf_idx] <= data_in_29;
                buffer[INPUT_WIDTH * 29 + buf_idx] <= data_in_30;
                buffer[INPUT_WIDTH * 30 + buf_idx] <= data_in_31;
                buffer[INPUT_WIDTH * 31 + buf_idx] <= data_in_32;
                buffer[INPUT_WIDTH * 32 + buf_idx] <= data_in_33;
                buffer[INPUT_WIDTH * 33 + buf_idx] <= data_in_34;
                buffer[INPUT_WIDTH * 34 + buf_idx] <= data_in_35;
                buffer[INPUT_WIDTH * 35 + buf_idx] <= data_in_36;
                buffer[INPUT_WIDTH * 36 + buf_idx] <= data_in_37;
                buffer[INPUT_WIDTH * 37 + buf_idx] <= data_in_38;
                buffer[INPUT_WIDTH * 38 + buf_idx] <= data_in_39;
                buffer[INPUT_WIDTH * 39 + buf_idx] <= data_in_40;
                buffer[INPUT_WIDTH * 40 + buf_idx] <= data_in_41;
                buffer[INPUT_WIDTH * 41 + buf_idx] <= data_in_42;
                buffer[INPUT_WIDTH * 42 + buf_idx] <= data_in_43;
                buffer[INPUT_WIDTH * 43 + buf_idx] <= data_in_44;
                buffer[INPUT_WIDTH * 44 + buf_idx] <= data_in_45;
                buffer[INPUT_WIDTH * 45 + buf_idx] <= data_in_46;
                buffer[INPUT_WIDTH * 46 + buf_idx] <= data_in_47;
                buffer[INPUT_WIDTH * 47 + buf_idx] <= data_in_48;
                buffer[INPUT_WIDTH * 48 + buf_idx] <= data_in_49;
                buffer[INPUT_WIDTH * 49 + buf_idx] <= data_in_50;
                buffer[INPUT_WIDTH * 50 + buf_idx] <= data_in_51;
                buffer[INPUT_WIDTH * 51 + buf_idx] <= data_in_52;
                buffer[INPUT_WIDTH * 52 + buf_idx] <= data_in_53;
                buffer[INPUT_WIDTH * 53 + buf_idx] <= data_in_54;
                buffer[INPUT_WIDTH * 54 + buf_idx] <= data_in_55;
                buffer[INPUT_WIDTH * 55 + buf_idx] <= data_in_56;
                buffer[INPUT_WIDTH * 56 + buf_idx] <= data_in_57;
                buffer[INPUT_WIDTH * 57 + buf_idx] <= data_in_58;
                buffer[INPUT_WIDTH * 58 + buf_idx] <= data_in_59;
                buffer[INPUT_WIDTH * 59 + buf_idx] <= data_in_60;
                buffer[INPUT_WIDTH * 60 + buf_idx] <= data_in_61;
                buffer[INPUT_WIDTH * 61 + buf_idx] <= data_in_62;
                buffer[INPUT_WIDTH * 62 + buf_idx] <= data_in_63;
                buffer[INPUT_WIDTH * 63 + buf_idx] <= data_in_64;
                buffer[INPUT_WIDTH * 64 + buf_idx] <= data_in_65;
                buffer[INPUT_WIDTH * 65 + buf_idx] <= data_in_66;
                buffer[INPUT_WIDTH * 66 + buf_idx] <= data_in_67;
                buffer[INPUT_WIDTH * 67 + buf_idx] <= data_in_68;
                buffer[INPUT_WIDTH * 68 + buf_idx] <= data_in_69;
                buffer[INPUT_WIDTH * 69 + buf_idx] <= data_in_70;
                buffer[INPUT_WIDTH * 70 + buf_idx] <= data_in_71;
                buffer[INPUT_WIDTH * 71 + buf_idx] <= data_in_72;
                buffer[INPUT_WIDTH * 72 + buf_idx] <= data_in_73;
                buffer[INPUT_WIDTH * 73 + buf_idx] <= data_in_74;
                buffer[INPUT_WIDTH * 74 + buf_idx] <= data_in_75;
                buffer[INPUT_WIDTH * 75 + buf_idx] <= data_in_76;
                buffer[INPUT_WIDTH * 76 + buf_idx] <= data_in_77;
                buffer[INPUT_WIDTH * 77 + buf_idx] <= data_in_78;
                buffer[INPUT_WIDTH * 78 + buf_idx] <= data_in_79;
                buffer[INPUT_WIDTH * 79 + buf_idx] <= data_in_80;
                buffer[INPUT_WIDTH * 80 + buf_idx] <= data_in_81;
                buffer[INPUT_WIDTH * 81 + buf_idx] <= data_in_82;
                buffer[INPUT_WIDTH * 82 + buf_idx] <= data_in_83;
                buffer[INPUT_WIDTH * 83 + buf_idx] <= data_in_84;
                buffer[INPUT_WIDTH * 84 + buf_idx] <= data_in_85;
                buffer[INPUT_WIDTH * 85 + buf_idx] <= data_in_86;
                buffer[INPUT_WIDTH * 86 + buf_idx] <= data_in_87;
                buffer[INPUT_WIDTH * 87 + buf_idx] <= data_in_88;
                buffer[INPUT_WIDTH * 88 + buf_idx] <= data_in_89;
                buffer[INPUT_WIDTH * 89 + buf_idx] <= data_in_90;
                buffer[INPUT_WIDTH * 90 + buf_idx] <= data_in_91;
                buffer[INPUT_WIDTH * 91 + buf_idx] <= data_in_92;
                buffer[INPUT_WIDTH * 92 + buf_idx] <= data_in_93;
                buffer[INPUT_WIDTH * 93 + buf_idx] <= data_in_94;
                buffer[INPUT_WIDTH * 94 + buf_idx] <= data_in_95;
                buffer[INPUT_WIDTH * 95 + buf_idx] <= data_in_96;
                buffer[INPUT_WIDTH * 96 + buf_idx] <= data_in_97;
                buffer[INPUT_WIDTH * 97 + buf_idx] <= data_in_98;
                buffer[INPUT_WIDTH * 98 + buf_idx] <= data_in_99;
                buffer[INPUT_WIDTH * 99 + buf_idx] <= data_in_100;
                buffer[INPUT_WIDTH * 100 + buf_idx] <= data_in_101;
                buffer[INPUT_WIDTH * 101 + buf_idx] <= data_in_102;
                buffer[INPUT_WIDTH * 102 + buf_idx] <= data_in_103;
                buffer[INPUT_WIDTH * 103 + buf_idx] <= data_in_104;
                buffer[INPUT_WIDTH * 104 + buf_idx] <= data_in_105;
                buffer[INPUT_WIDTH * 105 + buf_idx] <= data_in_106;
                buffer[INPUT_WIDTH * 106 + buf_idx] <= data_in_107;
                buffer[INPUT_WIDTH * 107 + buf_idx] <= data_in_108;
                buffer[INPUT_WIDTH * 108 + buf_idx] <= data_in_109;
                buffer[INPUT_WIDTH * 109 + buf_idx] <= data_in_110;
                buffer[INPUT_WIDTH * 110 + buf_idx] <= data_in_111;
                buffer[INPUT_WIDTH * 111 + buf_idx] <= data_in_112;
                buffer[INPUT_WIDTH * 112 + buf_idx] <= data_in_113;
                buffer[INPUT_WIDTH * 113 + buf_idx] <= data_in_114;
                buffer[INPUT_WIDTH * 114 + buf_idx] <= data_in_115;
                buffer[INPUT_WIDTH * 115 + buf_idx] <= data_in_116;
                buffer[INPUT_WIDTH * 116 + buf_idx] <= data_in_117;
                buffer[INPUT_WIDTH * 117 + buf_idx] <= data_in_118;
                buffer[INPUT_WIDTH * 118 + buf_idx] <= data_in_119;
                buffer[INPUT_WIDTH * 119 + buf_idx] <= data_in_120;
                buffer[INPUT_WIDTH * 120 + buf_idx] <= data_in_121;
                buffer[INPUT_WIDTH * 121 + buf_idx] <= data_in_122;
                buffer[INPUT_WIDTH * 122 + buf_idx] <= data_in_123;
                buffer[INPUT_WIDTH * 123 + buf_idx] <= data_in_124;
                buffer[INPUT_WIDTH * 124 + buf_idx] <= data_in_125;
                buffer[INPUT_WIDTH * 125 + buf_idx] <= data_in_126;
                buffer[INPUT_WIDTH * 126 + buf_idx] <= data_in_127;
                buffer[INPUT_WIDTH * 127 + buf_idx] <= data_in_128;
                buf_idx <= buf_idx + 1'b1;
                if (buf_idx == INPUT_WIDTH - 1) begin
                    buf_idx <= 0;
                    state <= 1;
                end
            end 
        end
    end

// 부동소수점 계산 블록 
     if (state) begin    
        if (sum_idx < INPUT_NUM) begin     
            if(q==1) begin
            // Multiply operation
            fm_a <= buffer[sum_idx];
            fm_b <= weight[out_idx * INPUT_NUM + sum_idx];
            fm_valid <= 1;
            q <= 0;
            w <= 1;
            r <= 0;
            end
            
            fm_valid_d1 <= fm_valid_d; // Pipeline the valid signal
            
            if (fm_valid_d1 && (w == 1)) begin
                                         
                fa_b <= fm_z;
                fa_valid <= 1;
                fm_valid <= 0;
                w <= 0;
                t <= 1;
            end
            
            fa_valid_d1 <= fa_valid_d; // Pipeline the valid signal
            
            if (fa_valid_d1 && (t == 1)) begin
                partial_sum <= fa_sum;
                sum_idx <= sum_idx + 1;
                fa_valid <= 0;
                t <= 0;               
                e <= 1;
            end
            
            if(e==1) begin
                fa_a <= partial_sum;
                e <= 0;
                r <= 1;
                q <= 1;
            end
            
        end else begin
            // Add bias
            fa_a <= partial_sum;
            fa_b <= bias[out_idx];
            fa_valid <= 1;
            fa_valid_d1 <= fa_valid_d;
            if (fa_valid_d1) begin
                data_out <= fa_sum;
                sum_idx <= 0;
                partial_sum <= 0;
                fa_valid <= 0;
                valid_out_fc <= 1;
                out_idx <= out_idx + 1'b1;
                data_out_num <= data_out_num + 1'b1;
                if(out_idx == OUTPUT_NUM -1) begin
                    out_idx <=0;
                    data_out_num <= 0;                  
                end
            end
        end
    end
end
end

endmodule
