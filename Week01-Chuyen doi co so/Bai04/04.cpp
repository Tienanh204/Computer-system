#include<iostream>
#include<stack>
#include<sstream>
#include<vector>
#include<algorithm>
#include<cmath> 
using namespace std;


//4. Chuyen doi tu he 2 ve he 10
int binaryToDecimal(string s)
{

    int result = 0;
    int i = 0;
    for (int j = s.size() - 1; j >= 0; j--)
    {
        result += (s[j] - '0') * pow(2, i);
        i++;
    }
    return result;
}

int main()
{
    cout << "Nhap chuoi: ";
    string s;
    getline(cin, s);

    cout << binaryToDecimal(s) << endl;
    return 0;
}
