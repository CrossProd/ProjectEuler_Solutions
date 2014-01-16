//
//  main.m
//  ProjectEuler006
//
//  Created by Robert Jan Bruinier on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The sum of the squares of the first ten natural numbers is,
//   12 + 22 + ... + 102 = 385
//
// The square of the sum of the first ten natural numbers is,
//   (1 + 2 + ... + 10)2 = 552 = 3025
//
//  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//
//  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    unsigned long squaredSum = 0;
    unsigned long sum = 0;
    
    for (int i = 1; i <= 100; i++)
    {
        squaredSum += i * i;
        sum += i;
    }
    
    NSLog(@"Solution: %lu", (sum * sum) - squaredSum);
    
    return 0;
}

