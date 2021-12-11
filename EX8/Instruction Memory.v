module Instruction_Memory(
    input [15:0] pc,
    output [15:0] instruction
);

    reg [15:0] memory [15:0];
    wire [3:0] rom_addr = pc[4:1];
    initial
        begin
            $readmemb("C:\Users\ASUS\Desktop\EX8/Test.prog", memory, 0, 14);
        end
    assign instruction = memory[rom_addr];

endmodule