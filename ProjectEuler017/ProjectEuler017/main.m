//
//  main.m
//  ProjectEuler017
//
//  Created by Robert Jan Bruinier on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
//If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
//
//NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

#import <Foundation/Foundation.h>

void prependString(char *buffer, char *source, char *prepend);
void numberToText(char *result, int number);

void prependString(char *buffer, char *source, char *prepend)
{
    char tempBuffer[100];
    
    strcpy(tempBuffer, prepend);
    strcat(tempBuffer, source);
    
    strcpy(buffer, tempBuffer);
}

void numberToText(char *result, int number)
{
    char *digits[] =
    {
        "",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen"
    };
    
    char *tens[] =
    {
        "",
        "ten",
        "twenty",
        "thirty",
        "forty",
        "fifty",
        "sixty",
        "seventy",
        "eighty",
        "ninety"
    };
    

    memset(result, 0, 100);
    
    // first digit
    int firstDigit = number % 10;
    int secondDigit = (number / 10) % 10;
    int thirdDigit = (number / 100) % 10;
    int fourthDigit = (number / 1000) % 10;
    
    if ((secondDigit <= 1))
    {
        prependString(result, "", digits[(secondDigit * 10) + firstDigit]);
    }
    else
    {
        prependString(result, "", digits[firstDigit]);
    }
    
    if ((secondDigit >= 2))
    {
        if (strlen(result) > 0)
        {
            prependString(result, result, "-");
        }

        prependString(result, result, tens[secondDigit]);
    }
    
    if (thirdDigit > 0)
    {
        if (strlen(result) > 0)
        {
            prependString(result, result, " hundred and ");
        }
        else
        {
            prependString(result, result, " hundred");            
        }
        
        prependString(result, result, digits[thirdDigit]);
    }

    if (fourthDigit > 0)
    {
        if (strlen(result) > 0)
        {
            prependString(result, result, " thousand and ");
        }
        else
        {
            prependString(result, result, " thousand");            
        }
        
        prependString(result, result, digits[fourthDigit]);
    }
    
    // tens
        
    return result;
}

int countCharactersInText(char *text)
{
    int count = strlen(text);
    
    for (long i = 0; i < strlen(text); i++)
    {
        if ((text[i] == ' ') || (text[i] == '-'))
        {
            count--;
        }
    }
    
    return count;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");

    int totalLength = 0;
    
    char result[100];
    
    for (int i = 1; i <= 1000; i++)
    {
        numberToText(result, i);

        int length = countCharactersInText(result);
        
        totalLength += length;
    }
    
    NSLog(@"Solution: %i", totalLength);
    
    sleep(1);
    
    return 0;
}

