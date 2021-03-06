//
//  main.m
//  ProjectEuler012
//
//  Created by Robert Jan Bruinier on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
//
//      1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
//
// Let us list the factors of the first seven triangle numbers:
//
//      1: 1
//      3: 1,3
//      6: 1,2,3,6
//      10: 1,2,5,10
//      15: 1,3,5,15
//      21: 1,3,7,21
//      28: 1,2,4,7,14,28
//
// We can see that 28 is the first triangle number to have over five divisors.
//
// What is the value of the first triangle number to have over five hundred divisors?


#import <Foundation/Foundation.h>


BOOL IsPrimeNumber(long number);
long GetNextPrimeNumber(long number);
void GetPrimeFactors(long number, long *buffer, int bufferSize, int *factorCount);

BOOL IsPrimeNumber(long number)
{
    if (number < 2)
    {
        return false;
    }
    
    for (long i = 2; i < (number >> 1) + 1; i++)
    {
        if ((number % i) == 0)
        {
            return false;
        }
    }
    
    return true;
}

long GetNextPrimeNumber(long number)
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

void GetPrimeFactors(long number, long *buffer, int bufferSize, int *factorCount)
{
    long primeNumber = 2;
    
    *factorCount = 0;
    
    while (true)
    {
        if ((number % primeNumber) == 0)
        {
            buffer[(*factorCount)++] = primeNumber;
            
            if (*factorCount == bufferSize)
            {
                NSLog(@"GetPrimeFactors: buffer full!");
                
                break;
            }

            number /= primeNumber;
            
            if (IsPrimeNumber(number))
            {
                buffer[(*factorCount)++] = number;

                break;
            }
            
            // primeNumber = 2;
        }
        else
        {
            primeNumber = GetNextPrimeNumber(primeNumber);
        }
    }
}

int GetNumberOfDivisors(long number)
{
    if (number == 1)
    {
        return 1;
    }
    
    if (IsPrimeNumber(number))
    {
        return 2;
    }
    
    const int bufferSize = 1000;
    
    long factors[bufferSize];
    
    memset(factors, 0, sizeof(long) * bufferSize);
    
    int nrOfFactors;
    
    GetPrimeFactors(number, factors, bufferSize, &nrOfFactors);
    
    // scan buffer
    int nrOfUniqueFactors = 0;
    
    long uniqueFactors[bufferSize];
    int factorsCount[bufferSize];
    
    long currentFactor = 0;
    for (int i = 0; i < nrOfFactors; i++)
    {
        if (factors[i] != currentFactor)
        {
            currentFactor = factors[i];

            nrOfUniqueFactors++;
            
            uniqueFactors[nrOfUniqueFactors - 1] = currentFactor;
            factorsCount[nrOfUniqueFactors - 1] = 0;
        }
        
        factorsCount[nrOfUniqueFactors - 1]++;
    }
    
    int divisors = 0;
    
    if (nrOfUniqueFactors > 0)
    {
        divisors = factorsCount[0] + 1;

//        NSLog(@"Unique factor %lu has %i occurances", uniqueFactors[0], factorsCount[0]);
    }
    
    for (int i = 1; i < nrOfUniqueFactors; i++)
    {
        divisors *= factorsCount[i] + 1;
        
//         NSLog(@"Unique factor %lu has %i occurances", uniqueFactors[i], factorsCount[i]);
    }
    
    return divisors;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    long triangleNumber = 1;
    long naturalNumber = 1;
    
//    NSLog(@"Solution: %i", GetNumberOfDivisors(triangleNumber));
    
    while (true)
    {     
        int numberOfDivisors = GetNumberOfDivisors(triangleNumber);
        
//            for (long divisor = 1; divisor <= (triangleNumber >> 1); divisor++)
//            {
//                if ((triangleNumber % divisor) == 0)
//                {
//                    numberOfDivisors++;
//                }
//            }
        
//        NSLog(@"Triangle number: %lu -> %i", triangleNumber, numberOfDivisors);

        if (numberOfDivisors >= 500)
        {
            NSLog(@"Solution: triangle number = %lu -> number of divisors = %i", triangleNumber, numberOfDivisors);

            break;
        }

        naturalNumber++;
        triangleNumber += naturalNumber;
        
//        if (naturalNumber > 10)
//        {
//            break;
//        }
    }
    
    return 0;
}

