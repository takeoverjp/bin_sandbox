#include <stdio.h>

extern int func_a();

int
main() {
  printf ("main\n");
  return func_a();
}
