//
//  main.m
//  ProjectEuler001
//
//  Created by Robert Jan Bruinier on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    // solution 01
    int sum = 0;
    
    for (int i = 0; i < 1000; i++)
    {
        if (((i % 3) == 0) || ((i % 5) == 0))
        {
            sum += i;
        }
    }
    
    NSLog(@"Solution #1: %i", sum);

    return 0;
}

