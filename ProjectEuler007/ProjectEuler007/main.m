//
//  main.m
//  ProjectEuler007
//
//  Created by Robert Jan Bruinier on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
// 
// What is the 10 001st prime number?

#import <Foundation/Foundation.h>

BOOL IsPrimeNumber(unsigned long number);

BOOL IsPrimeNumber(unsigned long number)
{
    if (number < 2)
    {
        return false;
    }
    
    for (unsigned long i = 2; i < (number >> 1) + 1; i++)
    {
        if ((number % i) == 0)
        {
            return false;
        }
    }
    
    return true;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    int count = 1;
    
    for (unsigned long number = 3; ; number += 2)
    {
        if (IsPrimeNumber(number))
        {
            count++;
        }
        
        if (count == 10001)
        {
            NSLog(@"Solution: %lu", number);
            
            break;
        }
    }
    
    return 0;
}

