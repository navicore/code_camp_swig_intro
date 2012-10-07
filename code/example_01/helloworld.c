#include <stdio.h>
#include "helloworld.h"

int callme(char *somestring) {
  printf("hello %s\n", somestring);
  return 0;
}

int main() {
  callme("world");
  return 0;
}

