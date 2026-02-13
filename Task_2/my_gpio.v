module my_gpio (
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] wdata,
    input we,
    output reg [31:0] rdata,
    output reg [7:0] gpio_out
);

reg [31:0] gpio_reg;

always @(posedge clk) begin
    if (rst)
        gpio_reg <= 0;
    else if (we)
        gpio_reg <= wdata;
end

always @(*) begin
    rdata = gpio_reg;
    gpio_out = gpio_reg[7:0];
end

endmodule
