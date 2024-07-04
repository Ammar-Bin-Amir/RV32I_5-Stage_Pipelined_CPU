module rom (
    input  logic [11:0] instruction_memory_address,
    output logic [31:0] instruction_memory_data
);
    
    logic [31:0] instruction_memory [0:4095];

    // Upload Raw Data
    always_comb begin
        // instruction_memory[123] = 32'h7E80_0293;
        
        instruction_memory[0] = 32'h00000293;
        instruction_memory[1] = 32'h00128293;
        instruction_memory[2] = 32'h00502023;
        instruction_memory[3] = 32'h00002303;
        instruction_memory[4] = 32'hFF5FF0EF;
        
        // instruction_memory[0] = 32'h00400293;
        // instruction_memory[1] = 32'h00600313;
        // instruction_memory[2] = 32'h006283B3;
    end

    always_comb begin
        instruction_memory_data = instruction_memory[instruction_memory_address];
    end

endmodule : rom