// Fibonachi.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
#define HAVE_STRUCT_TIMESPEC

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int* values;
int amount;
pthread_t child;

void* calculateFibbonachi(void* vargp)
{
    int fib1;
    int fib2 = 1;
    int result;
    for (int i = 0; i < amount; i++)
    {
        if (i == 0)
        {
            result = 1;
            
        }
        else
        {
            result += fib1;
        }
        fib1 = fib2;
        fib2 = result;
        *(values + i) = result;
    }
    return NULL;
}

int main()
{
    printf("%s", "Please enter the amount of values you wan't to see");
    scanf_s("%i", &amount);
    pthread_create(&child, NULL, &calculateFibbonachi, NULL);
    for (int i = 0; i < (int) (sizeof values / sizeof values[0]); i++)
    {
        printf("%i", values[i]);
    }
    exit(0);
}
