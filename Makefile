# ------------------------------------------------
# Generic STM32 Makefile
# ------------------------------------------------

# Target file name (Output will be firmware.elf / firmware.bin)
TARGET = firmware

# Build path
BUILD_DIR = build

# ------------------------------------------------
# Toolchain Definition
# ------------------------------------------------
PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

# ------------------------------------------------
# MCU Hardware Flags (STM32H563xx)
# ------------------------------------------------
CPU = -mcpu=cortex-m33
FPU = -mfpu=fpv5-sp-d16
FLOAT-ABI = -mfloat-abi=hard
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# ------------------------------------------------
# Source Files
# ------------------------------------------------
# C Sources (Add your neo_f10.c here when ready)
C_SOURCES =  \
Core/Src/main.c \
Core/Src/stm32h5xx_it.c \
Core/Src/system_stm32h5xx.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_cortex.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_gpio.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_uart.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_uart_ex.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_rcc.c \
Drivers/STM32H5xx_HAL_Driver/Src/stm32h5xx_hal_rcc_ex.c

# Assembly Startup File
ASM_SOURCES =  \
startup_stm32h563xx.s

# ------------------------------------------------
# Includes & Defines
# ------------------------------------------------
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32H563xx

C_INCLUDES =  \
-ICore/Inc \
-IDrivers/STM32H5xx_HAL_Driver/Inc \
-IDrivers/STM32H5xx_HAL_Driver/Inc/Legacy \
-IDrivers/CMSIS/Device/ST/STM32H5xx/Include \
-IDrivers/CMSIS/Include

# ------------------------------------------------
# Compiler & Linker Flags
# ------------------------------------------------
# Optimization and Debugging (-Og for debug, -O3 for release)
OPT = -Og -g3

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

# Linker Script
LDSCRIPT = STM32H563xx_FLASH.ld
LDFLAGS = $(MCU) -T$(LDSCRIPT) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# ------------------------------------------------
# Build Rules
# ------------------------------------------------
# Generate object list
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

# Default rule
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

# Compile C files
$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) $< -o $@

# Compile ASM files
$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

# Link ELF
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

# Generate HEX
$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

# Generate BIN
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@

$(BUILD_DIR):
	mkdir $@

# Clean target
clean:
	-rm -fR $(BUILD_DIR)