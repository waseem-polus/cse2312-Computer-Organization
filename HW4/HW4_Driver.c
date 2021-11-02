#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

// a. bool isStrEqual(const char str1[], const char str2[])
// returns true (1) if the strings match, false (0) otherwise
// b. void strConcatenate(char strTo[], const char strFrom[])
// appends the contents of string strFrom to strTo
// note: strTo must have enough space to hold the contents of strFrom and strTo
// c. void leftString(char * strOut, const char * strIn, uint32_t length)
// input: array (strIn) containing the input string, and the number of characters to
// extract (length)
// output: array (strOut) containing up to, but not exceeding length number of
// strIn characters from the start of the array
// strIn = ‘abcdef’, length = 5 → returns strOut = ‘abcde’
// strIn = ‘abcdef’, length = 7 → returns strOut = ‘abcdef’
// d. int16_t decimalStringToInt16(const char * str)
// convert the null-terminated string (str) to a signed 16-bit integer
// treat the string as representing a decimal number
// if a character other than 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, or – is present or the value is
// out of range, return 0
// the -, if present after the first character should cause the function to return 0
// e. uint8_t hexStringToUint8(const char * str)
// convert the null-terminated string (str) to an unsigned 8-bit integer
// treat the string as representing a hexadecimal number
// if a character other than 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, or F is present
// or the value is too large, return 0.

extern bool isStrEqual(const char str1[], const char str2[]);
extern void strConcatenate(char strTo[], const char strFrom[]);
extern void leftString(char * strOut, const char * strIn, uint32_t length);
extern int16_t decimalStringToInt16(const char * str);
extern uint8_t hexStringToUint8(const char * str);

int main () {
const char str1[] = "This is string 1";
const char str2[] = "This is string 2";
const char str3[] = "This is string 1";

  bool returnVal = 0;

returnVal = isStrEqual(str1, str2);
  printf("Question 2a pt1, isStrEqual: Correct answer = %d\n", 0);
  printf("Question 2a pt1, isStrEqual: Student answer = %d\n", returnVal);

returnVal = isStrEqual(str1, str3);
  printf("Question 2a pt2, isStrEqual: Correct answer = %d\n", 1);
  printf("Question 2a pt2, isStrEqual: Student answer = %d\n\n", returnVal);

char str4[255] = "";
char str5[255] = "This is the beginning ";
char str6[255] = "of the end.";


  printf("Question 2b pt1, strConcatenate: Correct answer = %s\n", "This is the beginning of the end.");
  strConcatenate(str5,str6);
  printf("Question 2b pt1, strConcatenate: Student answer = %s\n", str5);
  strConcatenate(str6,str4);
  printf("Question 2b pt2, strConcatenate: Correct answer = %s\n", "of the end.");
  printf("Question 2b pt2, strConcatenate: Student answer = %s\n\n", str6);

char str7[255] = "";
  printf("Question 2c pt1, leftString: Correct answer = %s\n", "This is ");
  leftString(str7,str5, 7);
  printf("Question 2c pt1, leftString: Student answer = %s\n", str7);
  leftString(str4,str1, 25);
  printf("Question 2c pt2, leftString: Correct answer = %s\n", "This is string 1");
  printf("Question 2c pt2, leftString: Student answer = %s\n\n", str4);

const char neg_decimal[]  = "-23456";
const char pos_decimal[] = "32765";
const char bad_decimal[] = "123a45";
  printf("Question 2d pt1, decimalStringToInt16: Correct answer = %s\n", neg_decimal);
  printf("Question 2d pt1, decimalStringToInt16: Student answer = %hd\n", decimalStringToInt16(neg_decimal));

  printf("Question 2d pt2, decimalStringToInt16: Correct answer = %s\n", pos_decimal);
  printf("Question 2d pt2, decimalStringToInt16: Student answer = %hd\n", decimalStringToInt16(pos_decimal));

  printf("Question 2d pt3, decimalStringToInt16: Correct answer = %hd\n", 0);
  printf("Question 2d pt3, decimalStringToInt16: Student answer = %hd\n\n", decimalStringToInt16(bad_decimal));

const char hex1[] = "FF";
const char hex2[] = "C";
const char hex3[] = "q1";
const char hex4[] = "10";
const char hex5[] = "10ABC";

  printf("Question 2e pt1, hexStringToInt16: Correct answer = %hhu\n", 255);
  printf("Question 2e pt1, hexStringToInt16: Student answer = %hhu\n", hexStringToUint8(hex1));

  printf("Question 2e pt2, hexStringToInt16: Correct answer = %hhu\n", 12);
  printf("Question 2e pt2, hexStringToInt16: Student answer = %hhu\n", hexStringToUint8(hex2));

  printf("Question 2e pt3, hexStringToInt16: Correct answer = %hhu\n", 0);
  printf("Question 2e pt3, hexStringToInt16: Student answer = %hhu\n", hexStringToUint8(hex3));

  printf("Question 2e pt4, hexStringToInt16: Correct answer = %hhu\n", 16);
  printf("Question 2e pt4, hexStringToInt16: Student answer = %hhd\n", hexStringToUint8(hex4));

  printf("Question 2e pt5, hexStringToInt16: Correct answer = %hhu\n", 0);
  printf("Question 2e pt5, hexStringToInt16: Student answer = %hhd\n\n", hexStringToUint8(hex5));

}
