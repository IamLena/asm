// lab_09.cpp: ���������� ����� ����� ��� ����������� ����������.
// 1 task

#include "stdafx.h"
extern "C" void f(int n, int *g);
int N = 6, NF = 1;


int _tmain(int argc, _TCHAR* argv[])
{
	f(N, &NF);
	printf("%d %d", N, NF);
	return 0;
}

