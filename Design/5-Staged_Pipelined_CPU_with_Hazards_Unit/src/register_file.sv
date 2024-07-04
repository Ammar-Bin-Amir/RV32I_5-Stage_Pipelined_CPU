module register_file (
    input  logic        clk,
    input  logic        en,
    input  logic [31:0] register_file_data,
    input  logic [4:0]  rd,
    input  logic [4:0]  rs1_address,
    input  logic [4:0]  rs2_address,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);
    
    logic [31:0] register_file [32];

    always_ff @(posedge clk) begin
        // Destination Register
        if (en) begin
            register_file[rd] <= register_file_data;
        end
        else begin
            register_file[rd] <= register_file[rd];
        end
    end

    always_comb begin
        // Address[0] = ZERO
        register_file[0] <= 0;
        
        // Source Register 1
        if (register_file[rs1_address] === 32'hxxxx_xxxx) begin
            rs1_data = 0;
        end
        else begin
            rs1_data = register_file[rs1_address];
        end
        
        // Source Register 2
        if (register_file[rs2_address] === 32'hxxxx_xxxx) begin
            rs2_data = 0;
        end
        else begin
            rs2_data = register_file[rs2_address];
        end
    end

endmodule : register_file