#include <stdio.h>

extern int strlen(char *);
extern char *strchr(char *, int);
extern void *memset(void *, int, int);
extern void *memcpy(void *, void *, int);
extern int strcmp(char *, char *);
extern void *memmove(void *, void *, int);
extern int strncmp(char *, char *, int);
extern int strcasecmp(char *, char *);
extern char *rindex(char *, int);
extern char *strstr(char *, char *);
extern char *strpbrk(char *, char *);
extern int strcspn(char *, char *);

int main()
{
  char str[] = "Hello World";

  printf("%lu\n", strlen(str));
  printf("%s\n", strchr(str, 'W'));
  memset(str, '0', 5);
  printf("%s\n", str);
  memcpy(str, "Salut Monde", 11);
  printf("%s\n", str);
  printf("%d\n", strcmp(str, "Salut Monde"));
  printf("%d\n", strcmp(str, "Hello World"));
  memmove(&str[3], str, 7);
  printf("%s\n", str);
  printf("%d\n", strncmp(str, "Salut Monde", 7));
  printf("%d\n", strncmp(str, "Salut Monde", 3));
  printf("%d\n", strcasecmp(str, "SAlSaLuT Me"));
  printf("%d\n", strcasecmp(str, "SAlSaLit Me"));
  printf("%s\n", rindex(str, 'l'));
  printf("%s\n", strstr(str, "Salut N"));
  printf("%s\n", strstr(str, "ut M"));
  printf("%s\n", strpbrk(str, "uma"));
  printf("%d\n", strcspn(str, "me "));
  return 0;
}
