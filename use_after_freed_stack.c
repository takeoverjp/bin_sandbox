#include <stdio.h>

static char*
return_stack_address() {
  char buf[1024] = {0};
  printf ("%p\n", buf);
  snprintf(buf, sizeof(buf), "Hello stack");
  return buf;
}

int
main() {
  char* ptr = return_stack_address();
  printf ("%p\n", ptr);
  ptr = 0x1ffefff270;
  printf ("%s\n", ptr);
  *ptr = '\0';
  return 0;
}
