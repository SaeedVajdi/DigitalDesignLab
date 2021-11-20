module mux2_1(input [63:0] in1,in2,input select,output [63:0] out);

    assign out = select ? in2 : in1;

endmodule
module testbench;
    reg [63:0]in1,in2;
    reg select;
    wire [63:0]out;

    mux2_1 mux(.in1(in1), .in2(in2), .select(select), .out(out));

    initial begin
        in1=64'b00100;
        in2=64'b00010;
        select=1'b0;
        #2    in1=64'b10000;
        #2    select=1'b1;
        #2    in2=64'b00001;
    end

    initial begin $monitor("input1=%b\ninput2=%b\nselect line=%b\noutput=%b\n\n",
        in1,in2, select, out);
    end
endmodule