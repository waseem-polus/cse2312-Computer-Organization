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

// return a substring starting at offset with max length
extern void strMid(char strTo[], const char strFrom[], uint32_t offset, uint32_t length);

// return a substring starting at offset with max length
extern void strCat(char strTo[], const char strFrom[]);

int main(void)
{
    char str[] = "Hello world";
    char str2[20];
    char str3[20] = "ABC ";
    uint32_t length = strLength(str);
    char match = 'o';
    uint32_t n = 2;
    int result;
    uint32_t ofs = 4; 
    uint32_t len = 20;

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


    strMid(str2, str, ofs, len);
    printf("ofs = %u\n", ofs);
    printf("len = %u\n", len);
    printf("str = \"%s\"\n", str);
    printf("str2 = \"%s\"\n", str2);

    strCat(str3, str);
    printf("str = %s\n", str);
    printf("str3 = %s\n", str3);
        
    return 0;
}


