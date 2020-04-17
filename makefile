
OUT	:= out
SRCS	:= src
INC	:= inc/
OBJS	:= main.o auto_run.o a.o b.o c.o d.o
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
