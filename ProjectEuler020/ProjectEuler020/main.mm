//
//  main.m
//  ProjectEuler020
//
//  Created by Robert Jan Bruinier on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

class BigInt
{
public:
    int capacity;
    
    int nrDigits;
    int *digits;
    
    int nrDigitsInBuffer;
    int *buffer;
    
    int nrDigitsInTemp;
    int *temp;
    
    char *textBuffer;
    
    BigInt(int capacity)
    {
        this->capacity = capacity;
                
        this->digits = (int *)malloc(capacity * sizeof(int));
        this->buffer = (int *)malloc(capacity * sizeof(int));
        this->temp = (int *)malloc(capacity * sizeof(int));
        
        this->textBuffer = (char *)malloc(capacity * sizeof(char));
        
        this->Reset();
    }

    void Reset()
    {
        this->ResetBuffer(this->digits, &this->nrDigits);
        this->ResetBuffer(this->buffer, &this->nrDigitsInBuffer);
        this->ResetBuffer(this->temp, &this->nrDigitsInTemp);
}
    
    void ResetBuffer(int *buffer, int *nrDigits)
    {
        *nrDigits = 0;
        
        memset(buffer, 0, this->capacity * sizeof(int));        
    }
    
    void SetIntInBuffer(int value, int *buffer, int *digitCounter)
    {
        *digitCounter = 0;
        
        this->ResetBuffer(buffer, &this->nrDigitsInBuffer);
        
        if (value <= 0)
        {
            return;
        }
        
        while (true)
        {
            buffer[(*digitCounter)++] = value % 10;
            
            value /= 10;
            
            if (value == 0)
            {
                break;
            }
        }
    }
    
    void SetIntInBuffer(int value)
    {
        this->SetIntInBuffer(value, this->buffer, &this->nrDigitsInBuffer);
    }

    void SetInt(int value)
    {
        this->SetIntInBuffer(value, this->digits, &this->nrDigits);
    }
    
    void MultiplyWithInt(int value)
    {
        this->SetIntInBuffer(value, this->buffer, &this->nrDigitsInBuffer);
                
        this->CopyDigitToTemp();
        this->ResetBuffer(this->digits, &this->nrDigits);
        
        for (int i = 0; i < this->nrDigitsInBuffer; i++)
        {
            for (int j = 0; j < this->nrDigitsInTemp; j++)
            {
                int digitIndex = i + j;
                
                int digit1 = this->temp[j];
                int digit2 = this->buffer[i];
                
                int product = digit1 * digit2; // min 0 * 0, max 9 * 9 = 81
                
                while (true)
                {
                    product = product + this->digits[digitIndex];
                    
                    this->digits[digitIndex] = product % 10;
                    
//                    this->PrintBuffer(this->buffer, this->nrDigitsInBuffer);
//                    this->PrintBuffer(this->temp, this->nrDigitsInTemp);
                    
                    product /= 10;
                    
                    if (product == 0)
                    {
                        break;
                    }
                    
                    digitIndex++;
                }

                this->nrDigits = MAX(this->nrDigits, digitIndex + 1);
            }
        }
        
    }
    
    void CopyDigitToTemp()
    {
        this->nrDigitsInTemp = this->nrDigits;

        memcpy(this->temp, this->digits, this->capacity * sizeof(int));
    }
    
    void PrintBuffer(int *buffer, int nrDigits)
    {
        memset(this->textBuffer, 0, capacity);
        
        bool started = false;
        int bufferIndex = 0;
        
        for (int i = nrDigits - 1; i >= 0; i--)
        {
            int digit = buffer[i];
            
            if (digit > 0)
            {
                started = true;
            }
            
            if (started)
            {
                this->textBuffer[bufferIndex++] = digit + 48;
            }
        }
        
        if (bufferIndex == 0)
        {
            this->textBuffer[0] = 48;
        } 
        
        NSLog(@"%s", this->textBuffer);
    }
    
    void PrintDigits(char *buffer, int size)
    {
        memset(buffer, 0, size);
        
        bool started = false;
        int bufferIndex = 0;
        
        for (int i = this->nrDigits - 1; i >= 0; i--)
        {
            int digit = this->digits[i];
            
            if (digit > 0)
            {
                started = true;
            }
            
            if (started)
            {
                buffer[bufferIndex++] = digit + 48;
            }
        }
        
        if (bufferIndex == 0)
        {
            buffer[0] = 48;
        }
    }
    
    long GetSumOfDigits()
    {
        long sum = 0;
        
        for (int i = this->nrDigits - 1; i >= 0; i--)
        {
            sum += (long)this->digits[i];
        }
        
        return sum;
    }
};

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    BigInt *bigInt = new BigInt(1000);
    
    bigInt->SetInt(100);
    
    for (int i = 99; i >= 1; i--)
    {
        bigInt->MultiplyWithInt(i);        
    }
    
    char textBuffer[1000];
    
    bigInt->PrintDigits(textBuffer, 1000);

    NSLog(@"Final Number: %s", textBuffer);
    
    long sum = bigInt->GetSumOfDigits();
    
    NSLog(@"Solution: %lu", sum);
    
    sleep(1);
    
    return 0;
}

