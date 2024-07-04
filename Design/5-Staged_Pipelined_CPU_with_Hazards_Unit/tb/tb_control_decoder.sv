module tb_control_decoder;
    
    logic       r_type;
    logic       i_type_lw;
    logic       i_type_addi;
    logic       i_type_jalr;
    logic       s_type;
    logic       sb_type;
    logic       u_type_auipc;
    logic       u_type_lui;
    logic       uj_type;
    logic       write;
    logic       store;
    logic       load;
    logic       branch;
    logic [1:0] alu_operand_a_selector;
    logic       alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [2:0] alu_operations_selector;

    control_decoder dut ( .* );

    initial begin
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b1; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b1; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b1; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b1; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b1; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b1; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b1; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b1; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b1;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0;
        #10ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_control_decoder.vcd");
        $dumpvars();
    end

endmodule : tb_control_decoder