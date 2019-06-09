#include <stdio.h>

extern int strlen(char *);
extern char *strchr(char *, int);
extern void *memset(void *, int, size_t);
extern void *memcpy(void*, void *, size_t);
extern int strcmp(char *, char *);

int main()
{
  char str[] = "Hello World";

  printf("%d\n", strlen(str));
  printf("%s\n", strchr(str, 'W'));
  memset(str, '0', 5);
  printf("%s\n", str);
  memcpy(str, "Salut Monde", 11);
  printf("%s\n", str);
  printf("%d\n", strcmp(str, "Salut Monde"));
  printf("%d\n", strcmp(str, "Hello World"));
  return 0;
}
