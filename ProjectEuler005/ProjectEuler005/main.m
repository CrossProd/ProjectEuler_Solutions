//
//  main.m
//  ProjectEuler005
//
//  Created by Robert Jan Bruinier on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    int number = 20 * 20;
    
    while (true)
    {
        bool found = true;
        
        for (int i = 20; i > 10; i--)
        {
            if ((number % i) != 0)
            {
                found = false;
                
                break;
            }
        }
        
        if (found)
        {
            break;
        }
        
        number++;
    }
    
    NSLog(@"Solution: %i", number);
    
    return 0;
}

