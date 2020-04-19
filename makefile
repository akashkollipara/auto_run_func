SHELL	:= /bin/bash
VERBOSE	?= 0
OUT	?= out
SRCS	:= src
INC	:= inc/
OBJS	:= $(notdir $(wildcard $(SRCS)/*.c))
OBJS	:= $(OBJS:.c=.o)
LD_SRC	:= section.ld
CFLAGS	:= -Werror -Wall -I $(INC) -Os		\
	   -ffunction-sections -fdata-sections

ifeq ($(VERBOSE),0)
.SILENT:
endif

default	: $(OUT) $(OUT)/main.elf

run	:
	chmod +x $(OUT)/main.elf
	$(OUT)/main.elf

$(OUT)/main.elf	: $(addprefix $(OUT)/,$(OBJS))
	@echo "Linking $(notdir $@) ..."
	$(CC) $(CFLAGS) $^ -o $@ -T $(LD_SRC) -Wl,--gc-sections

$(OUT)/%.o	:$(SRCS)/%.c
	@echo "Compiling $(notdir $<) ..."
	$(CC) $(CFLAGS) -c $< -o $@

$(OUT)	:
	mkdir -p out

clean	:
	rm -rf out/
