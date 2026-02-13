module soc_top_example(
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] wdata,
    input we,
    output [31:0] rdata
);

wire [31:0] gpio_rdata;
wire [7:0] gpio_out;

// Instantiate GPIO
my_gpio gpio_inst (
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .wdata(wdata),
    .we(we),
    .rdata(gpio_rdata),
    .gpio_out(gpio_out)
);

// Address decoding example
assign rdata = (addr == 32'h00000030) ? gpio_rdata : 32'h00000000;

endmodule
