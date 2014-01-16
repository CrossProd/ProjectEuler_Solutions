//
//  main.m
//  ProjectEuler009
//
//  Created by Robert Jan Bruinier on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a2 + b2 = c2
//
// For example, 32 + 42 = 9 + 16 = 25 = 52.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

#import <Foundation/Foundation.h>
#import <math.h>

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    const int magicNumber = 1000;
    
    for (int a = 1; a < magicNumber * 0.34; a++)
    {
        for (int b = a + 1; b < magicNumber; b++)
        {
            int product = (a * a) + (b * b);
            
            float c = (float)sqrt(product);
            int roundedC = (int)c;
            
            bool isNatural = (c - roundedC) == 0.0f;
                         
            if (isNatural)
            {
                if ((a + b + roundedC) == 1000)
                {
                    NSLog(@"Solution: %i", a * b * roundedC); 
                }
            }
        }
    }
    
    return 0;
}

