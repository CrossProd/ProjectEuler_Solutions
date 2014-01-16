//
//  main.m
//  ProjectEuler019
//
//  Created by Robert Jan Bruinier on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isLeapYear(int year);
int daysInMonth(int month, int year);

BOOL isLeapYear(int year)
{
    return ((year % 4) == 0) && (!((year % 100) == 0) || ((year % 400) == 0));
}

int daysInMonth(int month, int year)
{
    int data[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    int days = data[month];
    
    if ((month == 1) && isLeapYear(year))
    {
        days++;
    }
    
    return days;
}

int main (int argc, const char * argv[])
{
    NSLog(@"Start!");
    
    int day = 1;
    
    int sundaysCount = 0;
    
    for (int year = 1900; year <= 2000; year++)
    {
        for (int month = 0; month < 12; month++)
        {
            if ((year >= 1901) && ((day % 7) == 0))
            {
                NSLog(@"%i-%i was a sunday.", month, year);
                
                sundaysCount++;
            }
            
            day += daysInMonth(month, year);
        }
    }
    
    NSLog(@"%i", sundaysCount);
    
    sleep(1);
    
    return 0;
}

