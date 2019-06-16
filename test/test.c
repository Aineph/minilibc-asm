/*
 * Created by Nicolas Fez for minilibc-asm.
 * Started on 10/06/2019.
 */

#include <stdio.h>
#include <string.h>

int main()
{
    char str[] = "Hello World";

    printf("%ld\n", strlen(str));
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
    printf("%s\n", strstr(str, "ut M"));
    printf("%s\n", strpbrk(str, "uma"));
    printf("%ld\n", strcspn(str, "me "));
    printf("%s\n", str);
    printf("%s\n", strcpy(str, "Hello World"));
    printf("%s\n", strncpy(str, "Salut", 6));
    printf("%s\n", strcat(str, " Wo"));
    printf("%s\n", strncat(str, "rldAbcdefg", 3));
    return 0;
}
