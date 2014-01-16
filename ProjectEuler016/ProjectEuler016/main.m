//
//  main.m
//  ProjectEuler016
//
//  Created by Robert Jan Bruinier on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// 2 to the 15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

// What is the sum of the digits of the number 2 to the 1000?

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    // 2 ^ 1 =  2
    // 2 ^ 2 =  4
    // 2 ^ 3 =  8
    // 2 ^ 4 = 16
    // 2 ^ 8 = 32
    
    const int maxDigits = 400;
    
    int digits[maxDigits];
    
    memset(digits, 0, maxDigits * 4);
    
    digits[0] = 2;
    
    const int power = 1000;
    
    for (int i = 2; i <= power; i++)
    {
        for (int j = maxDigits - 1; j >= 0; j--)
        {
            digits[j] *= 2;
            
            if (digits[j] >= 10)
            {
                digits[j] -= 10;
                
                int index = j + 1;
                
                while (true)
                {
                    digits[index]++;
                    
                    if (digits[index] >= 10)
                    {
                        digits[index] -= 10;
                        
                        index++;
                    }
                    else
                    {
                        break;
                    }
                }
            }
        }
    }

    long sum = 0;
    
    for (int i = 0; i < maxDigits; i++)
    {
        sum += digits[i];
    }

    NSLog(@"Solution: %lu", sum);

    return 0;
}

