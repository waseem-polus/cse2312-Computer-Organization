// C99

#include <stdio.h>  // printf
#include <stdint.h> // C99 uintX_t and intX_t types

extern uint32_t strLength(const char str[]);

// returns position of first instance of character in string
// or -1 if not found
extern int32_t strFind(const char str[], char c);
 
// returns position of nth instance of character in string
// or -1 if not found
extern int32_t strFindN(const char str[], char c, uint32_t n); 

int main(void)
{
    char str[] = "Hello world";
    uint32_t length = strLength(str);
    char match = 'o';
    uint32_t n = 2;
    int result;

    printf("str = %s\n", str);
    printf("len = %u\n", length);
    printf("n   = %u\n", n);

    result = strFind(str, match);
    if (result < 0)
        printf("'%c' not found in \"%s\"\n", match, str);
    else
        printf("First instance of '%c' in \"%s\" found at offset %d\n", match, str, result);

    result = strFindN(str, match, n);
    if (result < 0)
        printf("nth instance of '%c' not found in \"%s\"\n", match, str);
    else
        printf("nth instance of '%c' in \"%s\" found at offset %d\n", match, str, result);
    return 0;
}


