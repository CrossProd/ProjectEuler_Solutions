//
//  main.m
//  ProjectEuler015
//
//  Created by Robert Jan Bruinier on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Starting in the top left corner of a 2×2 grid, there are 6 routes (without backtracking) to the bottom right corner.
//
// How many routes are there through a 20×20 grid?

#import <Foundation/Foundation.h>

double factorial(long number);

double factorial(long number)
{
    double factorial = 1;
    
    for (long i = 2; i <= number; i++)
    {
        factorial *= i;
    }
    
    return factorial;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    // Solution found here: http://en.wikipedia.org/wiki/Self-avoiding_walk
    
    // formula: (2n)! / (n! x n!)
    
    long size = 20;
    
    double solution = factorial(2 * size) / (factorial(size) * factorial(size));
    
    NSLog(@"Solution: %0.0f", solution);
    
    sleep(1);
    return 0;
}

