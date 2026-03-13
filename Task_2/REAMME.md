#RISCV SoC Block Diagram
This is a basic overview of the System-on-Chip (SoC) block diagram. The explanation provided here is based on my understanding. Some internal logic used for selection and control is implemented in Verilog, but it is not included here to keep the diagram simple and clear.
The GPIO register is mapped to the address 0x2000_0000.

#GPIO IP Specification
Participants will:
Create a new RTL module for the GPIO IP
Implement:
Register storage
Write logic
Readback logic
Follow synchronous design principles

#GPIO IP Code

# RISCV SoC Block Diagram 

The Basic SoC Block daigram overview. The details as per my understanding. There are logic in between for the selection which is written in verilog not be considered here for accuracy. 

GPIO REGISTER at 0x2000_0000 as Address.
 

# Learning Lesson 

Input and Output Pins I made it separately. 
gpio_out  :----> Converted to Single BUS GPIO pins.
GPIO : The same pin acts as Input and Output.
**I am correcting this in the Task3**. 

<img width="628" height="352" alt="image" src="https://github.com/user-attachments/assets/9c1c1321-84cc-4050-8781-7e55c790d216" />

<img width="1668" height="1577" alt="image" src="https://github.com/user-attachments/assets/965dec3d-bcad-4318-a3b7-8a18ea149bcf" />


Source and Destination Registers :
```
// Source and destination registers
   wire [4:0] rs1Id = instr[19:15];
   wire [4:0] rs2Id = instr[24:20];
   wire [4:0] rdId  = instr[11:7];
```

CPU Read Registers from the Register File  :
```
      FETCH_REGS: begin
         rs1 <= RegisterBank[rs1Id];
         rs2 <= RegisterBank[rs2Id];
         state <= EXECUTE;
      end
```

CPU Write data to Registers : 
```
always @(posedge clk) begin
      if(!resetn) begin
         PC    <= 0;
         state <= FETCH_INSTR;
      end else begin
    if(writeBackEn && rdId != 0) begin
       RegisterBank[rdId] <= writeBackData;
       // $display("r%0d <= %b (%d) (%d)",rdId,writeBackData,writeBackData,$signed(writeBackData));
       // For displaying what happens.
    end
```

Memory Mapped Region.
```
    /*
      Memory-mapped IO in IO page : (0x0040_0000 : 0x007F_FFFF)
         - GPIO and UART peripherals are memory mapped in this range.
         - 22nd bit of mem_addr is used to distinguish between RAM and IO peripheral. 
         - It is high for the 4, 5, 6 and 7 numbers. 
         - In binary : 0000_0100_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx - 0000_0111_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx
   */
   wire isIO   = mem_addr[22];
   wire isGPIO = ((mem_addr & 32'hFFFF_FF00) == 32'h2000_0000); // Changed the Address MAP : 2000_0000. AT SoC Level making this change.
   wire isRAM  = !isIO;
  
  wire uart_valid = (isGPIO && gpio_out_enable) | (isIO & mem_wstrb & mem_wordaddr[IO_UART_DAT_bit]);
```    

# GPIO IP Specification

Participants will:
- Create a new RTL module for the GPIO IP
- Implement:
  - Register storage
  - Write logic
  - Readback logic
  - Follow synchronous design principles




## GPIO IP Code 




