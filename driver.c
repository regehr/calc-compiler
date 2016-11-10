extern long f(long, long, long, long, long, long);

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

void overflow_fail(int pos) {
  printf("integer error at position %d\n", pos);
  exit(-1);
}

int main(int argc, char *argv[]) {
  assert(sizeof(long) == 8);
  assert(argc <= 7);
  long a[6] = {0};
  int i;
  for (i = 1; i < argc; i++) {
    errno = 0;
    a[i - 1] = strtol(argv[i], 0, 10);
    assert(errno == 0);
  }
  printf("args = %ld %ld %ld %ld %ld %ld\n", a[0], a[1], a[2], a[3], a[4],
         a[5]);
  long res = f(a[0], a[1], a[2], a[3], a[4], a[5]);
  printf("result = %ld\n", res);
  return 0;
}
