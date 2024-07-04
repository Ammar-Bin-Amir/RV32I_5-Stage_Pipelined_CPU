module tb_type_decoder;

    logic [6:0] opcode;
    logic       r_type;
    logic       i_type_lw;
    logic       i_type_addi;
    logic       i_type_jalr;
    logic       s_type;
    logic       sb_type;
    logic       u_type_auipc;
    logic       u_type_lui;
    logic       uj_type;

    type_decoder dut ( .* );

    initial begin
        #10ns opcode = 7'h00;
        #10ns opcode = 7'h33;
        #10ns opcode = 7'h03;
        #10ns opcode = 7'h13;
        #10ns opcode = 7'h67;
        #10ns opcode = 7'h23;
        #10ns opcode = 7'h63;
        #10ns opcode = 7'h17;
        #10ns opcode = 7'h37;
        #10ns opcode = 7'h6f;
        #10ns opcode = 7'hff;
        #10ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_type_decoder.vcd");
        $dumpvars();
    end

endmodule : tb_type_decoder