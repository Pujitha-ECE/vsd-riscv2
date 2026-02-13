`timescale 1ns/1ps

module tb_gpio;

reg clk;
reg rst;
reg [31:0] addr;
reg [31:0] wdata;
reg we;
wire [31:0] rdata;
wire [7:0] gpio_out;

// Instantiate your GPIO
my_gpio dut (
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .wdata(wdata),
    .we(we),
    .rdata(rdata),
    .gpio_out(gpio_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("gpio.vcd");
    $dumpvars(0, tb_gpio);

    clk = 0;
    rst = 1;
    we = 0;
    addr = 0;
    wdata = 0;

    #20 rst = 0;

    // Write value to GPIO register (like CPU write)
    #10;
    addr = 32'h00000030;
    wdata = 32'h000000AA;
    we = 1;

    #10 we = 0;

    // Read back (like CPU read)
    #10;
    addr = 32'h00000030;

    #10;
    $display("Read Data = %h", rdata);
    $display("GPIO Output = %h", gpio_out);

    #20 $finish;
end

endmodule
