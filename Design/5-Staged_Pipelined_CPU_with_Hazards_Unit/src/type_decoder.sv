module type_decoder (
    input  logic [6:0] opcode,
    output logic       r_type,
    output logic       i_type_lw,
    output logic       i_type_addi,
    output logic       i_type_jalr,
    output logic       s_type,
    output logic       sb_type,
    output logic       u_type_auipc,
    output logic       u_type_lui,
    output logic       uj_type
);
    
    localparam R_TYPE       = 7'h33;
    localparam I_TYPE_LW    = 7'h03;
    localparam I_TYPE_ADDI  = 7'h13;
    localparam I_TYPE_JALR  = 7'h67;
    localparam S_TYPE       = 7'h23;
    localparam SB_TYPE      = 7'h63;
    localparam U_TYPE_AUIPC = 7'h17;
    localparam U_TYPE_LUI   = 7'h37;
    localparam UJ_TYPE      = 7'h6f;
    
    always_comb begin
        r_type       = 1'b0;
        i_type_lw    = 1'b0;
        i_type_addi  = 1'b0;
        i_type_jalr  = 1'b0;
        s_type       = 1'b0;
        sb_type      = 1'b0;
        u_type_auipc = 1'b0;
        u_type_lui   = 1'b0;
        uj_type      = 1'b0;
        
        case (opcode)
            R_TYPE:       r_type       = 1'b1;
            I_TYPE_LW:    i_type_lw    = 1'b1;
            I_TYPE_ADDI:  i_type_addi  = 1'b1;
            I_TYPE_JALR:  i_type_jalr  = 1'b1;
            S_TYPE:       s_type       = 1'b1;
            SB_TYPE:      sb_type      = 1'b1;
            U_TYPE_AUIPC: u_type_auipc = 1'b1;
            U_TYPE_LUI:   u_type_lui   = 1'b1;
            UJ_TYPE:      uj_type      = 1'b1;
            default: begin
                r_type       = 1'b0;
                i_type_lw    = 1'b0;
                i_type_addi  = 1'b0;
                i_type_jalr  = 1'b0;
                s_type       = 1'b0;
                sb_type      = 1'b0;
                u_type_auipc = 1'b0;
                u_type_lui   = 1'b0;
                uj_type      = 1'b0;
            end
        endcase
    end

endmodule : type_decoder