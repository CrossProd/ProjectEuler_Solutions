//
//  main.m
//  ProjectEuler004
//
//  Created by Robert Jan Bruinier on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//
//Find the largest palindrome made from the product of two 3-digit numbers.

#import <Foundation/Foundation.h>

const int minProduct = 100;
const int maxProduct = 999;

bool IsPalindrome(int number);
bool HasThreeDigitProduct(int number);

bool IsPalindrome(int number)
{
    int digitBuffer[50];
    
    int nrOfDigits = 0;
    
    while (true)
    {
        int digit = number % 10;
        
        digitBuffer[nrOfDigits] = digit;
        
        number /= 10;
        nrOfDigits++;
        
        if (number == 0)
        {
            break;
        }
    }
        
    for (int i = 0, j = nrOfDigits - 1; i < nrOfDigits >> 1; i++, j--)
    {
        if (digitBuffer[i] != digitBuffer[j])
        {
            return false;
        }
    }
    
    return true;
}

bool HasThreeDigitProduct(int number)
{
    for (int i = maxProduct; i >= minProduct; i--)
    {
        if (((number % i) == 0) && ((number / i) <= maxProduct))
        {
            int product1 = i;
            int product2 = number / i;
            
            NSLog(@"Product found: %i * %i = %i", product1, product2, number);
            
            return true;
        }
    }
    
    return false;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    int maxNumber = maxProduct * maxProduct;
    int minNumber = minProduct * minProduct;
    
    int number = maxNumber;
    
    while (true)
    {
        if (IsPalindrome(number))
        {
            // find product
            if (HasThreeDigitProduct(number))
            {
                break;
            }
        }
                
        number--;
        
        if (number < minNumber)
        {
            break;
        }
    }
    
    // 100 t/m 999 x 100 t/m 999
    
    NSLog(@"Solution: %i", number);
    
    return 0;
}

