module test_Risc_64_bit;

    // Inputs
    reg clk;

    Risc_16_bit uut(
        .clk(clk)
    );

    initial
        begin
            clk <= 0;
            #160
            $finish;
        end

    always
        begin
            #5 clk = ~clk;
        end

endmodule