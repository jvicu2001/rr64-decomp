# Using Mischief Makers' and Dr Mario 64 Makefile as guides

BASENAME	:= ridgeracer64

COMPARE		?= 1

BUILD_DIR	:= build
ASM_DIRS	:= asm asm/data
BIN_DIRS	:= assets
SRC_DIRS	:= src
TOOLS_DIR	:= tools
LIB_DIR		:= lib
LD_DIR		:= ld_scripts

S_FILES		= $(foreach dir,$(ASM_DIRS) $(SRC_DIRS),$(wildcard $(dir)/*.s))
C_FILES		= $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
BIN_FILES	= $(foreach dir,$(BIN_DIRS),$(wildcard $(dir)/*.bin))
O_FILES		= $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file).o) \
				$(foreach file,$(C_FILES),$(BUILD_DIR)/$(file).o) \
				$(foreach file,$(BIN_FILES),$(BUILD_DIR)/$(file).o)

TARGET 		= $(BUILD_DIR)/$(BASENAME)
ROM 		= $(TARGET).z64
ELF 		= $(TARGET).elf

LD_SCRIPT	= $(LD_DIR)/$(BASENAME).ld

CROSS		:= mips-linux-gnu-
AS			:= $(CROSS)as
LD			:= $(CROSS)ld
OBJCOPY		:= $(CROSS)objcopy
PYTHON		:= python3
SPLAT		:= $(PYTHON) -m splat split
SPLAT_YAML  := $(BASENAME).yaml

KMC_URL		:= https://github.com/decompals/mips-gcc-2.7.2/releases/download/v0.1/gcc-2.7.2-linux.tar.gz

IINC		:= -Iinclude -I $(LIB_DIR)/ultralib/include -I $(LIB_DIR)/ultralib/include/PR

KMC			:= $(TOOLS_DIR)/gcc-kmc

CC 			:= $(KMC)/gcc
CPP			:= cpp

OPT_FLAGS	:= -O2
MIPS_VERSION:= -mips3
CFLAGS		:= $(OPT_FLAGS) $(MIPS_VERSION)

LD_FILES	= $(foreach dir,$(LD_DIR),$(wildcard $(dir)/*.ld))
LD_FLAGS	:= -Map $(BASENAME).map -L$(BUILD_DIR)/lib -lgultra_rom

AS_FLAGS	:= $(IINC) -march=vr4300 -mabi=32

LIBULTRA_VERSION 	:= J
LIBULTRA_TARGET		:= libgultra_rom
LIBULTRA			:= $(LIB_DIR)/ultralib/build/$(LIBULTRA_VERSION)/$(LIBULTRA_TARGET)/$(LIBULTRA_TARGET).a
LIBULTRA_FLAGS		:= VERSION=$(LIBULTRA_VERSION) TARGET=$(LIBULTRA_TARGET) COMPARE=0 MODERN_LD=1

ARMIPS_BINARY	:= $(TOOLS_DIR)/armips-bin/build/armips

F3DEX2				:= $(LIB_DIR)/F3DEX2
# Version from https://shygoo.net/n64-uncompiled/all-ucode-signatures.txt
# Signature at 0x241B8
F3DEX2_VERSION		:= F3DEX2_2.08
F3DEX2_FLAGS		:= ARMIPS=../../$(ARMIPS_BINARY)

N64SYM				:= $(TOOLS_DIR)/n64sym/bin/n64sym
N64SYM_LD			:= $(LD_DIR)/n64sym_gen.ld
N64SYM_FLAGS		:= -l $(BUILD_DIR)/lib/libgultra_rom.a -f "splat" -o $(N64SYM_LD)

# Recipes
## General
### Clean generated files
clean:
	$(RM) -r $(BUILD_DIR)/
	$(RM) ridgeracer64.map
	$(RM) -r asm/
	$(RM) -r assets/
	$(RM) $(N64SYM_LD)


distclean: clean
	$(RM) -r $(TOOLS_DIR)/gcc-kmc
	$(RM) -r $(TOOLS_DIR)/armips-bin/build
	$(MAKE) -C $(TOOLS_DIR)/n64sym clean
	$(MAKE) -C $(LIB_DIR)/ultralib distclean
	$(MAKE) -C $(LIB_DIR)/f3dex2 clean


### Split files running splat
split:	$(N64SYM_LD) $(BUILD_DIR)/lib/libgultra_rom.a $(F3DEX2)
	@echo "Removing old asm files..."
	$(RM) -r asm/
	@echo "Running splat..."
	$(SPLAT) $(SPLAT_YAML)


### All. Split baserom with splat and create new ROM
all: split
	$(MAKE) $(ROM)
ifeq ($(COMPARE), 1)
	md5sum $(ROM)
	md5sum -c $(BASENAME).md5
endif

### Ensure all build directories exist
build_dirs:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/asm
	@mkdir -p $(BUILD_DIR)/asm/data
	@mkdir -p $(BUILD_DIR)/assets
	@mkdir -p $(BUILD_DIR)/src
	@mkdir -p $(BUILD_DIR)/lib

### Phony targets
.PHONY: all clean split build_dirs

## Libraries
### KMC
$(KMC):
	@echo "Downloading KMC..."
	@mkdir -p $(TOOLS_DIR)/gcc-kmc
	@wget -O $(TOOLS_DIR)/gcc-kmc/kmc.tar.gz $(KMC_URL)
	@tar -xzf $(TOOLS_DIR)/gcc-kmc/kmc.tar.gz -C $(TOOLS_DIR)/gcc-kmc
	@$(RM) $(TOOLS_DIR)/gcc-kmc/kmc.tar.gz
	@echo "KMC downloaded and extracted."

### ultralib
$(LIBULTRA):
	@echo "Building ultralib..."
	$(LIBULTRA_FLAGS) $(MAKE) -C $(LIB_DIR)/ultralib setup
	$(LIBULTRA_FLAGS) $(MAKE) -C $(LIB_DIR)/ultralib
	@echo "ultralib built."

### libgultra_rom
$(BUILD_DIR)/lib/libgultra_rom.a: $(LIBULTRA) | build_dirs
	@cp $< $@

### F3DEX2
$(F3DEX2):	$(ARMIPS_BINARY)
	@echo "Building F3DEX2..."
	$(F3DEX2_FLAGS) $(MAKE) -C $(LIB_DIR)/f3dex2 $(F3DEX2_VERSION)
	@echo "F3DEX2 built."

## Tools
### n64sym
$(N64SYM):
	@echo "Building n64sym..."
	$(MAKE) -C $(TOOLS_DIR)/n64sym
	@echo "n64sym built."

### armips
$(ARMIPS_BINARY):
	@echo "Building armips..."
	@mkdir -p $(TOOLS_DIR)/armips-bin/build
	@cmake -S $(TOOLS_DIR)/armips -B $(TOOLS_DIR)/armips-bin/build -DCMAKE_BUILD_TYPE=Release
	@cmake --build $(TOOLS_DIR)/armips-bin/build --config Release
	@echo "armips built."

## Build
### ROM
$(ROM): $(ELF)
	@echo "Creating ROM..."
	$(OBJCOPY) -O binary $< $@
	@echo "ROM created: $@"

### ELF
$(ELF): $(O_FILES) $(BUILD_DIR)/lib/libgultra_rom.a | build_dirs
	@echo "Linking ELF..."
	$(LD) $(foreach file,$(LD_FILES),-T $(file)) $(LD_FLAGS) -o $@
	@echo "ELF linked: $@"

### Object files
$(BUILD_DIR)/%.bin.o: %.bin | build_dirs
	$(OBJCOPY) -I binary -O elf32-tradbigmips $< $@

$(BUILD_DIR)/%.s.o: %.s | build_dirs
	$(CPP) $(IINC) $< | $(AS) $(AS_FLAGS) -o $@

$(BUILD_DIR)/%.c.o: %.c | build_dirs
	$(CC) -c $(CFLAGS) $(MIPS_VERSION) $(OPT_FLAGS) -o $@ $<

### N64SYM LD script
$(N64SYM_LD): $(N64SYM)
	@echo "Generating symbols from ROM with n64sym..."
	$(N64SYM) baserom.z64 $(N64SYM_FLAGS)