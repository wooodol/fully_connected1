`timescale 1ns / 1ps

module tb_fully_connected();

  // Parameters
  parameter INPUT_NUM = 1536;
  parameter OUTPUT_NUM = 512;
  parameter DATA_BITS = 32;
  parameter NUM_REPS = 12; // Number of times to repeat the input sequence
  integer rep;
  integer i;

  // Inputs
  reg rst_n;
  reg valid_in;
  reg [DATA_BITS-1:0] data_in_1, data_in_2, data_in_3, data_in_4;
  reg [DATA_BITS-1:0] data_in_5, data_in_6, data_in_7, data_in_8;
  reg [DATA_BITS-1:0] data_in_9, data_in_10, data_in_11, data_in_12;
  reg [DATA_BITS-1:0] data_in_13, data_in_14, data_in_15, data_in_16;
  reg [DATA_BITS-1:0] data_in_17, data_in_18, data_in_19, data_in_20;
  reg [DATA_BITS-1:0] data_in_21, data_in_22, data_in_23, data_in_24;
  reg [DATA_BITS-1:0] data_in_25, data_in_26, data_in_27, data_in_28;
  reg [DATA_BITS-1:0] data_in_29, data_in_30, data_in_31, data_in_32;
  reg [DATA_BITS-1:0] data_in_33, data_in_34, data_in_35, data_in_36;
  reg [DATA_BITS-1:0] data_in_37, data_in_38, data_in_39, data_in_40;
  reg [DATA_BITS-1:0] data_in_41, data_in_42, data_in_43, data_in_44;
  reg [DATA_BITS-1:0] data_in_45, data_in_46, data_in_47, data_in_48;
  reg [DATA_BITS-1:0] data_in_49, data_in_50, data_in_51, data_in_52;
  reg [DATA_BITS-1:0] data_in_53, data_in_54, data_in_55, data_in_56;
  reg [DATA_BITS-1:0] data_in_57, data_in_58, data_in_59, data_in_60;
  reg [DATA_BITS-1:0] data_in_61, data_in_62, data_in_63, data_in_64;
  reg [DATA_BITS-1:0] data_in_65, data_in_66, data_in_67, data_in_68;
  reg [DATA_BITS-1:0] data_in_69, data_in_70, data_in_71, data_in_72;
  reg [DATA_BITS-1:0] data_in_73, data_in_74, data_in_75, data_in_76;
  reg [DATA_BITS-1:0] data_in_77, data_in_78, data_in_79, data_in_80;
  reg [DATA_BITS-1:0] data_in_81, data_in_82, data_in_83, data_in_84;
  reg [DATA_BITS-1:0] data_in_85, data_in_86, data_in_87, data_in_88;
  reg [DATA_BITS-1:0] data_in_89, data_in_90, data_in_91, data_in_92;
  reg [DATA_BITS-1:0] data_in_93, data_in_94, data_in_95, data_in_96;
  reg [DATA_BITS-1:0] data_in_97, data_in_98, data_in_99, data_in_100;
  reg [DATA_BITS-1:0] data_in_101, data_in_102, data_in_103, data_in_104;
  reg [DATA_BITS-1:0] data_in_105, data_in_106, data_in_107, data_in_108;
  reg [DATA_BITS-1:0] data_in_109, data_in_110, data_in_111, data_in_112;
  reg [DATA_BITS-1:0] data_in_113, data_in_114, data_in_115, data_in_116;
  reg [DATA_BITS-1:0] data_in_117, data_in_118, data_in_119, data_in_120;
  reg [DATA_BITS-1:0] data_in_121, data_in_122, data_in_123, data_in_124;
  reg [DATA_BITS-1:0] data_in_125, data_in_126, data_in_127, data_in_128;
reg clk;
  // Outputs
  wire [DATA_BITS-1:0] data_out;
  wire valid_out_fc;
  wire [DATA_BITS-1:0] partial_sum;
  wire [DATA_BITS-1:0] fa_a, fa_b;
  wire [DATA_BITS-1:0] fa_sum;
  
  wire [DATA_BITS-1:0] fm_z;
  wire fa_valid_d1;
  wire fm_valid_d1;
  wire state;
  wire [9:0] buf_idx;
  wire r;
  wire fa_valid;
  wire fm_valid;
  wire [10:0] sum_idx;
  wire [9:0] data_out_num;

  // Instantiate the Unit Under Test (UUT)
  fully_connected uut (
    .rst_n(rst_n),
    .valid_in(valid_in),
    .data_in_1(data_in_1), .data_in_2(data_in_2), .data_in_3(data_in_3), .data_in_4(data_in_4),
    .data_in_5(data_in_5), .data_in_6(data_in_6), .data_in_7(data_in_7), .data_in_8(data_in_8),
    .data_in_9(data_in_9), .data_in_10(data_in_10), .data_in_11(data_in_11), .data_in_12(data_in_12),
    .data_in_13(data_in_13), .data_in_14(data_in_14), .data_in_15(data_in_15), .data_in_16(data_in_16),
    .data_in_17(data_in_17), .data_in_18(data_in_18), .data_in_19(data_in_19), .data_in_20(data_in_20),
    .data_in_21(data_in_21), .data_in_22(data_in_22), .data_in_23(data_in_23), .data_in_24(data_in_24),
    .data_in_25(data_in_25), .data_in_26(data_in_26), .data_in_27(data_in_27), .data_in_28(data_in_28),
    .data_in_29(data_in_29), .data_in_30(data_in_30), .data_in_31(data_in_31), .data_in_32(data_in_32),
    .data_in_33(data_in_33), .data_in_34(data_in_34), .data_in_35(data_in_35), .data_in_36(data_in_36),
    .data_in_37(data_in_37), .data_in_38(data_in_38), .data_in_39(data_in_39), .data_in_40(data_in_40),
    .data_in_41(data_in_41), .data_in_42(data_in_42), .data_in_43(data_in_43), .data_in_44(data_in_44),
    .data_in_45(data_in_45), .data_in_46(data_in_46), .data_in_47(data_in_47), .data_in_48(data_in_48),
    .data_in_49(data_in_49), .data_in_50(data_in_50), .data_in_51(data_in_51), .data_in_52(data_in_52),
    .data_in_53(data_in_53), .data_in_54(data_in_54), .data_in_55(data_in_55), .data_in_56(data_in_56),
    .data_in_57(data_in_57), .data_in_58(data_in_58), .data_in_59(data_in_59), .data_in_60(data_in_60),
    .data_in_61(data_in_61), .data_in_62(data_in_62), .data_in_63(data_in_63), .data_in_64(data_in_64),
    .data_in_65(data_in_65), .data_in_66(data_in_66), .data_in_67(data_in_67), .data_in_68(data_in_68),
    .data_in_69(data_in_69), .data_in_70(data_in_70), .data_in_71(data_in_71), .data_in_72(data_in_72),
    .data_in_73(data_in_73), .data_in_74(data_in_74), .data_in_75(data_in_75), .data_in_76(data_in_76),
    .data_in_77(data_in_77), .data_in_78(data_in_78), .data_in_79(data_in_79), .data_in_80(data_in_80),
    .data_in_81(data_in_81), .data_in_82(data_in_82), .data_in_83(data_in_83), .data_in_84(data_in_84),
    .data_in_85(data_in_85), .data_in_86(data_in_86), .data_in_87(data_in_87), .data_in_88(data_in_88),
    .data_in_89(data_in_89), .data_in_90(data_in_90), .data_in_91(data_in_91), .data_in_92(data_in_92),
    .data_in_93(data_in_93), .data_in_94(data_in_94), .data_in_95(data_in_95), .data_in_96(data_in_96),
    .data_in_97(data_in_97), .data_in_98(data_in_98), .data_in_99(data_in_99), .data_in_100(data_in_100),
    .data_in_101(data_in_101), .data_in_102(data_in_102), .data_in_103(data_in_103), .data_in_104(data_in_104),
    .data_in_105(data_in_105), .data_in_106(data_in_106), .data_in_107(data_in_107), .data_in_108(data_in_108),
    .data_in_109(data_in_109), .data_in_110(data_in_110), .data_in_111(data_in_111), .data_in_112(data_in_112),
    .data_in_113(data_in_113), .data_in_114(data_in_114), .data_in_115(data_in_115), .data_in_116(data_in_116),
    .data_in_117(data_in_117), .data_in_118(data_in_118), .data_in_119(data_in_119), .data_in_120(data_in_120),
    .data_in_121(data_in_121), .data_in_122(data_in_122), .data_in_123(data_in_123), .data_in_124(data_in_124),
    .data_in_125(data_in_125), .data_in_126(data_in_126), .data_in_127(data_in_127), .data_in_128(data_in_128),
    .clk(clk),
    .data_out(data_out),
    .valid_out_fc(valid_out_fc),
    .partial_sum(partial_sum),
    .fa_a(fa_a),
    .fa_sum(fa_sum),
    .fa_b(fa_b),
    .fm_z(fm_z),
    .fa_valid_d1(fa_valid_d1),
    .fm_valid_d1(fm_valid_d1),
    .state(state),
    .buf_idx(buf_idx),
    .r(r),
    .fa_valid(fa_valid),
    .fm_valid(fm_valid),
    .sum_idx(sum_idx),
    .data_out_num(data_out_num)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    rst_n = 0;
    #20 rst_n = 1;
  end

  // Test stimulus
  initial begin
    // Initialize Inputs
    valid_in = 0;
    data_in_1 = 0; data_in_2 = 0; data_in_3 = 0; data_in_4 = 0;
    data_in_5 = 0; data_in_6 = 0; data_in_7 = 0; data_in_8 = 0;
    data_in_9 = 0; data_in_10 = 0; data_in_11 = 0; data_in_12 = 0;
    data_in_13 = 0; data_in_14 = 0; data_in_15 = 0; data_in_16 = 0;
    data_in_17 = 0; data_in_18 = 0; data_in_19 = 0; data_in_20 = 0;
    data_in_21 = 0; data_in_22 = 0; data_in_23 = 0; data_in_24 = 0;
    data_in_25 = 0; data_in_26 = 0; data_in_27 = 0; data_in_28 = 0;
    data_in_29 = 0; data_in_30 = 0; data_in_31 = 0; data_in_32 = 0;
    data_in_33 = 0; data_in_34 = 0; data_in_35 = 0; data_in_36 = 0;
    data_in_37 = 0; data_in_38 = 0; data_in_39 = 0; data_in_40 = 0;
    data_in_41 = 0; data_in_42 = 0; data_in_43 = 0; data_in_44 = 0;
    data_in_45 = 0; data_in_46 = 0; data_in_47 = 0; data_in_48 = 0;
    data_in_49 = 0; data_in_50 = 0; data_in_51 = 0; data_in_52 = 0;
    data_in_53 = 0; data_in_54 = 0; data_in_55 = 0; data_in_56 = 0;
    data_in_57 = 0; data_in_58 = 0; data_in_59 = 0; data_in_60 = 0;
    data_in_61 = 0; data_in_62 = 0; data_in_63 = 0; data_in_64 = 0;
    data_in_65 = 0; data_in_66 = 0; data_in_67 = 0; data_in_68 = 0;
    data_in_69 = 0; data_in_70 = 0; data_in_71 = 0; data_in_72 = 0;
    data_in_73 = 0; data_in_74 = 0; data_in_75 = 0; data_in_76 = 0;
    data_in_77 = 0; data_in_78 = 0; data_in_79 = 0; data_in_80 = 0;
    data_in_81 = 0; data_in_82 = 0; data_in_83 = 0; data_in_84 = 0;
    data_in_85 = 0; data_in_86 = 0; data_in_87 = 0; data_in_88 = 0;
    data_in_89 = 0; data_in_90 = 0; data_in_91 = 0; data_in_92 = 0;
    data_in_93 = 0; data_in_94 = 0; data_in_95 = 0; data_in_96 = 0;
    data_in_97 = 0; data_in_98 = 0; data_in_99 = 0; data_in_100 = 0;
    data_in_101 = 0; data_in_102 = 0; data_in_103 = 0; data_in_104 = 0;
    data_in_105 = 0; data_in_106 = 0; data_in_107 = 0; data_in_108 = 0;
    data_in_109 = 0; data_in_110 = 0; data_in_111 = 0; data_in_112 = 0;
    data_in_113 = 0; data_in_114 = 0; data_in_115 = 0; data_in_116 = 0;
    data_in_117 = 0; data_in_118 = 0; data_in_119 = 0; data_in_120 = 0;
    data_in_121 = 0; data_in_122 = 0; data_in_123 = 0; data_in_124 = 0;
    data_in_125 = 0; data_in_126 = 0; data_in_127 = 0; data_in_128 = 0;

    // Wait for reset to complete
    #20;
    // Start the test
    valid_in = 1;

    // Loop through the repetitions
    for (rep = 0; rep < NUM_REPS; rep = rep + 1) begin
      for (i = 0; i < 1; i = i + 1) begin
        data_in_1 = $urandom; data_in_2 = $urandom; data_in_3 = $urandom; data_in_4 = $urandom;
        data_in_5 = $urandom; data_in_6 = $urandom; data_in_7 = $urandom; data_in_8 = $urandom;
        data_in_9 = $urandom; data_in_10 = $urandom; data_in_11 = $urandom; data_in_12 = $urandom;
        data_in_13 = $urandom; data_in_14 = $urandom; data_in_15 = $urandom; data_in_16 = $urandom;
        data_in_17 = $urandom; data_in_18 = $urandom; data_in_19 = $urandom; data_in_20 = $urandom;
        data_in_21 = $urandom; data_in_22 = $urandom; data_in_23 = $urandom; data_in_24 = $urandom;
        data_in_25 = $urandom; data_in_26 = $urandom; data_in_27 = $urandom; data_in_28 = $urandom;
        data_in_29 = $urandom; data_in_30 = $urandom; data_in_31 = $urandom; data_in_32 = $urandom;
        data_in_33 = $urandom; data_in_34 = $urandom; data_in_35 = $urandom; data_in_36 = $urandom;
        data_in_37 = $urandom; data_in_38 = $urandom; data_in_39 = $urandom; data_in_40 = $urandom;
        data_in_41 = $urandom; data_in_42 = $urandom; data_in_43 = $urandom; data_in_44 = $urandom;
        data_in_45 = $urandom; data_in_46 = $urandom; data_in_47 = $urandom; data_in_48 = $urandom;
        data_in_49 = $urandom; data_in_50 = $urandom; data_in_51 = $urandom; data_in_52 = $urandom;
        data_in_53 = $urandom; data_in_54 = $urandom; data_in_55 = $urandom; data_in_56 = $urandom;
        data_in_57 = $urandom; data_in_58 = $urandom; data_in_59 = $urandom; data_in_60 = $urandom;
        data_in_61 = $urandom; data_in_62 = $urandom; data_in_63 = $urandom; data_in_64 = $urandom;
        data_in_65 = $urandom; data_in_66 = $urandom; data_in_67 = $urandom; data_in_68 = $urandom;
        data_in_69 = $urandom; data_in_70 = $urandom; data_in_71 = $urandom; data_in_72 = $urandom;
        data_in_73 = $urandom; data_in_74 = $urandom; data_in_75 = $urandom; data_in_76 = $urandom;
        data_in_77 = $urandom; data_in_78 = $urandom; data_in_79 = $urandom; data_in_80 = $urandom;
        data_in_81 = $urandom; data_in_82 = $urandom; data_in_83 = $urandom; data_in_84 = $urandom;
        data_in_85 = $urandom; data_in_86 = $urandom; data_in_87 = $urandom; data_in_88 = $urandom;
        data_in_89 = $urandom; data_in_90 = $urandom; data_in_91 = $urandom; data_in_92 = $urandom;
        data_in_93 = $urandom; data_in_94 = $urandom; data_in_95 = $urandom; data_in_96 = $urandom;
        data_in_97 = $urandom; data_in_98 = $urandom; data_in_99 = $urandom; data_in_100 = $urandom;
        data_in_101 = $urandom; data_in_102 = $urandom; data_in_103 = $urandom; data_in_104 = $urandom;
        data_in_105 = $urandom; data_in_106 = $urandom; data_in_107 = $urandom; data_in_108 = $urandom;
        data_in_109 = $urandom; data_in_110 = $urandom; data_in_111 = $urandom; data_in_112 = $urandom;
        data_in_113 = $urandom; data_in_114 = $urandom; data_in_115 = $urandom; data_in_116 = $urandom;
        data_in_117 = $urandom; data_in_118 = $urandom; data_in_119 = $urandom; data_in_120 = $urandom;
        data_in_121 = $urandom; data_in_122 = $urandom; data_in_123 = $urandom; data_in_124 = $urandom;
        data_in_125 = $urandom; data_in_126 = $urandom; data_in_127 = $urandom; data_in_128 = $urandom;
        #10; // Wait for 10 time units
      end
   end  
end
  
  initial begin
    $monitor("Time: %0t | data_out: %h | valid_out_fc: %b | partial_sum: %h | fa_a: %h | fa_sum: %h | clk: %b | fa_valid_d1: %b| fm_valid_d1: %b | state: %b | buf_idx: %h | r: %b | fa_valid: %b | fm_valid: %b | sum_idx: %h | data_out_num: %h ",
             $time, data_out, valid_out_fc, partial_sum, fa_a, fa_sum, clk, fa_valid_d1, fm_valid_d1, state, buf_idx, r, fm_valid, fa_valid, sum_idx, data_out_num);
  end

endmodule
