NAME=climber

.SUFFIXES: .asm .o .gb

all: $(NAME).gb

game.o: game.asm
	rgbasm -o game.o game.asm

$(NAME).gb: game.o
	rgblink -n game.sym -m $*.map -o $@ $<
	rgbfix -v $@

run: $(NAME).gb
	gngb --fps -a $(NAME).gb

clean:
	$(RM) game.o $(NAME).gb
