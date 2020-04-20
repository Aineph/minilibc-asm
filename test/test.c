/*
 * Created by Nicolas Fez for minilibc-asm.
 * Started on 10/06/2019.
 */

#include <stdio.h>
#include <string.h>

extern void *memrchr(void *, int, int);

int main()
{
    char test_string[] = "A random test string";
    int error_flag = 0;

    if (strlen(test_string) != 20)
    {
        printf("strlen test failed.\n");
        error_flag = 1;
    }
    if (strcmp(strchr(test_string, 't'), "test string"))
    {
        printf("strchr test failed.\n");
        error_flag = 1;
    }
    if (strcmp(memchr(test_string, 't', 10), "test string"))
    {
        printf("memchr test failed.\n");
        error_flag = 1;
    }
    if (strcmp(index(test_string, 't'), "test string"))
    {
        printf("index test failed.\n");
        error_flag = 1;
    }
    memset(test_string, ' ', 9);
    if (strcmp(test_string, "         test string"))
    {
        printf("memset test failed.\n");
        error_flag = 1;
    }
    memcpy(test_string, "A memcpy ", 9);
    if (strcmp(test_string, "A memcpy test string"))
    {
        printf("memcpy test failed.\n");
        error_flag = 1;
    }
    if (strcmp(test_string, "A memcpy test string"))
    {
        printf("strcmp test failed.\n");
        error_flag = 1;
    }
    memmove(&test_string[2], &test_string[14], 6);
    if (strcmp(test_string, "A string test string"))
    {
        printf("memmove test failed.\n");
        error_flag = 1;
    }
    if (strncmp(test_string, "A string", 8))
    {
        printf("strncmp test failed.\n");
        error_flag = 1;
    }
    if (strcasecmp(test_string, "a StRiNg TeSt StRiNg"))
    {
        printf("strcasecmp test failed.\n");
        error_flag = 1;
    }
    if (strcmp(rindex(test_string, 's'), "string"))
    {
        printf("rindex test failed.\n");
        error_flag = 1;
    }
    if (strcmp(memrchr(test_string, 's', 15), "string"))
    {
        printf("memrchr test failed.\n");
        error_flag = 1;
    }
    if (strcmp(strrchr(test_string, 's'), "string"))
    {
        printf("strrchr test failed.\n");
        error_flag = 1;
    }
    if (strcmp(strstr(test_string, "string"), "string test string"))
    {
        printf("strstr test failed.\n");
        error_flag = 1;
    }
    if (strcmp(strpbrk(test_string, "abcdef"), "est string"))
    {
        printf("strpbrk test failed.\n");
        error_flag = 1;
    }
    if (strcspn(test_string, "et") != 3)
    {
        printf("strcspn test failed.\n");
        error_flag = 1;
    }
    if (strspn(test_string, "A string") != 10)
    {
        printf("strspn test failed.\n");
        error_flag = 1;
    }
    strcpy(test_string, "A strcpy");
    if (strcmp(test_string, "A strcpy"))
    {
        printf("strcpy test failed.\n");
        error_flag = 1;
    }
    strncpy(test_string, "A random", 8);
    if (strcmp(test_string, "A random"))
    {
        printf("strncpy test failed.\n");
        error_flag = 1;
    }
    strcat(test_string, " string");
    if (strcmp(test_string, "A random string"))
    {
        printf("strcat test failed.\n");
        error_flag = 1;
    }
    strncat(test_string, " test", 5);
    if (strcmp(test_string, "A random string test"))
    {
        printf("strncat test failed.\n");
        error_flag = 1;
    }
    if (!error_flag)
        printf("All tests passed successfully !\n");
    return 0;
}
