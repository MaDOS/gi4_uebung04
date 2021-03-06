asm = nasm
asm_flags = -f elf -F dwarf -g
ld = ld
ld_flags = -lc -I/lib/ld-linux.so.2

all: a1 a2
	make clean

a1: a1.asm
	${asm} ${asm_flags} a1.asm
	${ld} ${ld_flags} -o a1 a1.o

a2: a2.asm
	${asm} ${asm_flags} a2.asm
	${ld} ${ld_flags} -o a2 a2.o

clean:
	rm -f *.o

beer:
	echo "Served"
