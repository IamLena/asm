// lab_09.cpp: определяет точку входа для консольного приложения.
//
// 3 task 

#include "stdafx.h"
extern "C" void f(int N, int *g);
int N = 6;
int NF = 7;

int _tmain(int argc, _TCHAR* argv[])
{
	f(N, &NF);
	printf("%d %d", N, NF);
	return 0;
}

