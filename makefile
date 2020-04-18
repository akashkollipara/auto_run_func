
OUT	:= out
SRCS	:= src
INC	:= inc/
OBJS	:= $(notdir $(wildcard $(SRCS)/*.c))
OBJS	:= $(OBJS:.c=.o)
LD_SRC	:= section.ld
CFLAGS	:= -Werror -Wall -I $(INC)

default	: $(OUT) $(OUT)/main.elf

$(OUT)/main.elf: $(addprefix $(OUT)/,$(OBJS))
	echo "Linking $(notdir $@) ..."
	$(CC) $(CFLAGS) $^ -o $@ -T $(LD_SRC)

$(OUT)/%.o:$(SRCS)/%.c
	echo "Compiling $(notdir $<) ..."
	$(CC) $(CFLAGS) -c $< -o $@

$(OUT):
	mkdir -p out

clean:
	rm -rf out/

.SILENT:
