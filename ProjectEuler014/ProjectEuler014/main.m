//
//  main.m
//  ProjectEuler014
//
//  Created by Robert Jan Bruinier on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The following iterative sequence is defined for the set of positive integers:
//
//  n → n/2 (n is even)
//  n → 3n + 1 (n is odd)
//
// Using the rule above and starting with 13, we generate the following sequence:
//  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
//
// It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
//
// Which starting number, under one million, produces the longest chain?
//
// NOTE: Once the chain starts the terms are allowed to go above one million.

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    // solution:
    // store every calculated term count in an array because this way we don't have to recalculate them again in the following chains
    //
    
    const int maximumNumber = 1000000;
    
    int termList[maximumNumber];
    
    memset(termList, 0, maximumNumber * 4);
    
    for (int currentNumber = 1; currentNumber <= maximumNumber; currentNumber++)
    {    
        long value = currentNumber;

        int terms = 1;
         
        while (value != 1)
        {
            if ((value & 1) == 0)
            {
                value = value >> 1;
            }
            else
            {
                value += (value << 1) + 1;
            }
            
            if ((value < maximumNumber) && (termList[value - 1] != 0))
            {
                terms += termList[value - 1];
                
                break;
            }
            
            terms++;
            
        }
        
        termList[currentNumber - 1] = terms;
    }
    
    int maximumTerms = 0;
    int maximumIndex = 0;
    
    for (int i = 0; i < maximumNumber; i++)
    {
        if (termList[i] > maximumTerms)
        {
            maximumTerms = termList[i];
            maximumIndex = i;
        }
    }
    
    NSLog(@"Solution: %i has %i terms", maximumIndex + 1, maximumTerms);
    
    return 0;
}

