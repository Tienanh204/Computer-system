#include<iostream>
#include<stack>
#include<vector>
using namespace std;

//1. Chuyen doi so tu he 10 ve he 2
vector<int> decToBinary(int num)
{
	vector<int> res;
	while (num >  0)
	{
		res.push_back(num % 2);
		num /= 2;
	}
	reverse(res.begin(), res.end());
	return res;
}
int main()
{
	int num;
	cout << "Nhap n: ";
	cin >> num;

	vector<int> result = decToBinary(num);

	cout << "Ket qua: ";
	for (int x : result)
	{
		cout << x;
	}
	cout << endl;
}