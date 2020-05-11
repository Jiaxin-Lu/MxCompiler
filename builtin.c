#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void __builtin_print(char *s)
{
    printf("%s", s);
}

void __builtin_println(char *s)
{
    printf("%s\n", s);
}

void __builtin_printInt(int x)
{
    printf("%d", x);
}

void __builtin_printlnInt(int x)
{
    printf("%d\n", x);
}

char* __builtin_getString()
{
    char* ptr = malloc(1000);
    scanf("%s", ptr);
    return ptr;
}

int __builtin_getInt()
{
    int x;
    scanf("%d", &x);
    return x;
}

char* __builtin_toString(int x)
{
    if (x == 0)
    {
        char* ptr = malloc(2);
        ptr[0] = '0';
        ptr[1] = '\0';
        return ptr;
    }
    char* ptr = malloc(12);
    int i = 0;
    if (x < 0)
    {
        ptr[i++] = '-';
        x = -x;
    }
    int base = 1000000000;
    while (base > x) 
        base /= 10;
    while (base > 0)
    {
        ptr[i++] = x / base + '0';
        x %= base;
        base /= 10;
    }
    ptr[i++] = '\0';
    return ptr;
}

int __builtin_string_length(char* ptr)
{
    return strlen(ptr);
}

char* __builtin_string_substring(char* ptr, int l, int r)
{
    char* nptr = malloc(r - l + 1);
    memcpy(nptr, ptr + l, r - l);
    nptr[r - l] = '\0';
    return nptr;
}

int __builtin_string_parseInt(char* ptr)
{
    int x;
    sscanf(ptr, "%d", &x);
    return x;
}

int __builtin_string_ord(char* ptr, int x)
{
    return ptr[x];
}

char* __builtin_string_add(char* ptr1, char* ptr2)
{
    int len1 = strlen(ptr1);
    int len2 = strlen(ptr2);
    char* nptr = malloc(len1 + len2 + 1);
    strcpy(nptr, ptr1);
    strcat(nptr, ptr2);
    return nptr;
}

int __builtin_string_eq(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) == 0;
}

int __builtin_string_neq(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) != 0;
}

int __builtin_string_lt(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) < 0;
}

int __builtin_string_leq(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) <= 0;
}

int __builtin_string_req(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) >= 0;
}

int __builtin_string_rt(char *ptr1, char *ptr2)
{
    return strcmp(ptr1, ptr2) > 0;
}