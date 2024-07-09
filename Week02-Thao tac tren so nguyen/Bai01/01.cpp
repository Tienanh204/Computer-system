#include<iostream>
#include<string>
#include <algorithm>
#include<vector>
using namespace std;


//a)
void printBinary(int x)
{
	cout << "Day bits (4 bytes) cua X: ";
	for (int i = 31; i >= 0; --i)
	{
		cout << ((x >> i) & 1);
	}
}

//b)

void printBinaryArr(int Arr[])
{
	cout << "Day bits tuong ung voi mang Arr[]: ";
	for (int i = 0; i < 32; i++)
	{
		cout << ((Arr[i] >> 0) & 1);
	}
	cout << endl;
}

int main()
{

	//a)
	cout << "Number: ";
	long long number; cin >> number;
	printBinary(number);
	cout << endl;
	//b)
	srand(time(NULL));
	int Arr[32];
	cout << "Mang Arr[]: ";
	for (int i = 0; i < 32; ++i) {
		Arr[i] = rand() % 2;
		cout << Arr[i];
	}
	cout << endl;
	printBinaryArr(Arr);
	return 0;
}