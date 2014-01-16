//
//  main.m
//  ProjectEuler067
//
//  Created by Robert Jan Bruinier on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
//
// 3
// 7 4
// 2 4 6
// 8 5 9 3
//
// That is, 3 + 7 + 4 + 9 = 23.
//
// Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    const int nrOfRows = 100;
    
    FILE *file = fopen("data.in", "r");
    
    if (file == NULL)
    {
        NSLog(@"BURN");
        
        return -1;        
    }
    
    // first step is to read in the complete triangle
    
    int **triangle = malloc(nrOfRows * sizeof(int*)); 
    
    char lineBuffer[nrOfRows * 3];
    
    for (int rowNr = 0; rowNr < nrOfRows; rowNr++)
    {
        triangle[rowNr] = malloc((rowNr + 1) * sizeof(int));
        
        fgets(lineBuffer, nrOfRows * 3, file);
        
        NSLog(@"%s", lineBuffer);
        
        for (int i = 0; i <= rowNr; i++)
        {
            char buffer[3];
            
            memcpy(buffer, lineBuffer + (i * 3), 2);
            
            triangle[rowNr][i] = atoi(buffer);
            
            NSLog(@"Number: %i", triangle[rowNr][i]);
        }
    }
    
    fclose(file);
    
    NSLog(@"Start!");
    
    // now we can analyze - calculate sums bottom to top
    
    for (int rowNr = nrOfRows - 2; rowNr >= 0; rowNr--)
    {
        for (int i = 0; i <= rowNr; i++)
        {
            int topValue = triangle[rowNr][i];
            
            int bottomValue1 = triangle[rowNr + 1][i]; 
            int bottomValue2 = triangle[rowNr + 1][i + 1];
            
            int sum = topValue + MAX(bottomValue1, bottomValue2);
            
            triangle[rowNr][i] = sum;
        }
    }
    
    // solution is of course now in the top field
    
    NSLog(@"Solution: %i", triangle[0][0]);
    
    return 0;
}

