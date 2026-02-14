#include <stdint.h>

#define GPIO_BASE   0x00000030

#define GPIO_DATA   (*(volatile uint32_t *)(GPIO_BASE + 0x00))
#define GPIO_DIR    (*(volatile uint32_t *)(GPIO_BASE + 0x04))
#define GPIO_READ   (*(volatile uint32_t *)(GPIO_BASE + 0x08))

int main()
{
    GPIO_DIR = 0x000000FF;      // lower 8 pins output

    GPIO_DATA = 0x000000AA;     // pattern 10101010

    for (volatile int i = 0; i < 100000; i++);

    GPIO_DATA = 0x00000055;     // pattern 01010101

    uint32_t val = GPIO_READ;   // read back

    while(1);

    return 0;
}
