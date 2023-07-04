.PHONY: all clean dump
all: a.out
clean:
	rm -rf a.out lib*.so

liba.so: liba.c libb.so
	gcc $< -o $@ -lb -L. -shared -Wl,-rpath,'$$ORIGIN/'

libb.so: libb.c
	gcc $< -o $@ -shared

a.out: main.c liba.so
	gcc $< -o $@ -la -L. -Wl,-rpath-link,.

dump: a.out liba.so libb.so
	readelf -d $^

use_after_freed_stack: use_after_freed_stack.c
	gcc -g -O0 $< -o $@

valgrind: use_after_freed_stack
	 valgrind --leak-check=full --leak-resolution=high ./use_after_freed_stack
