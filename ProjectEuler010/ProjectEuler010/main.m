//
//  main.m
//  ProjectEuler010
//
//  Created by Robert Jan Bruinier on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    const int roof = 2000000;
    
    bool numbers[roof - 2];
    
    memset(numbers, 1, roof - 2);
    
    for (int i = 2; i < roof >> 1; i++)
    {
        for (int j = i * 2; j < roof; j += i)
        {
            numbers[j - 2] = 0;
        }
    }
    
    unsigned long sum = 0;
    
    for (int i = 2; i < roof; i++)
    {
        if (numbers[i - 2])
        { 
            sum += i;
            //NSLog(@"Prime number: %i", i);
        }
    }
    
    NSLog(@"Solution: %lu", sum);
    
    
    return 0;
}

