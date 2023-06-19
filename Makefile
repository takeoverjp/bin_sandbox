all: a.out
clean:
	rm -rf a.out lib*.so

liba.so: liba.c libb.so
	gcc $< -o $@ -lb -L. -shared -Wl,-rpath,'$$ORIGIN/'

libb.so: libb.c
	gcc $< -o $@ -shared

a.out: main.c liba.so
	gcc $< -o $@ -la -L. -Wl,-rpath-link,.
