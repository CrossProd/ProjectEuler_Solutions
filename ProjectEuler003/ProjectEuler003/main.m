//
//  main.m
//  ProjectEuler003
//
//  Created by Robert Jan Bruinier on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?

#import <Foundation/Foundation.h>

BOOL IsPrimeNumber(unsigned long number);
unsigned long GetNextPrimeNumber(unsigned long number);

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

unsigned long GetNextPrimeNumber(unsigned long number)
{
    while (true)
    {
        number++;
        
        if (IsPrimeNumber(number))
        {
            return number;
        }
    }
    
    return 0;
}

int main (int argc, const char * argv[])
{
    // solution 01
    unsigned long value = 600851475143;
    unsigned long largestPrimeFactor = 0;
    
    if (IsPrimeNumber(value))
    {
        NSLog(@"%lu is a prime number so it does not have prime factors!", value);
        
        return 0;
    }
    
    unsigned long primeNumber = 2;
    
    NSLog(@"Start!");
    
    while (true)
    {
        if ((value % primeNumber) == 0)
        {
            NSLog(@"Factor found: %lu", primeNumber);
            
            largestPrimeFactor = MAX(primeNumber, largestPrimeFactor);
            
            value /= primeNumber;
            
            if (IsPrimeNumber(value))
            {
                NSLog(@"Factor found: %lu", value);

                largestPrimeFactor = MAX(value, largestPrimeFactor);
                
                break;
            }
            
            primeNumber = 2;
        }
        else
        {
            primeNumber = GetNextPrimeNumber(primeNumber);
        }
    }
    
    NSLog(@"Solution: The largest prime factor is %lu", largestPrimeFactor);
    
    return 0;
}

