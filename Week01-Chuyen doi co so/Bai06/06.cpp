#include<iostream>
#include<stack>
#include<sstream>
#include<string>
#include<vector>
#include<algorithm>
#include<cmath> 
using namespace std;

//6. Chuyen doi tu he 16 ve he 2
int numHex(char &s)
{
    if (s >= 'A' && s <= 'F')
        return s - 'A' + 10;
    else
        return s - '0';
}

vector<int> hexaToBinary(string s)
{
    vector<int> result;
    int temp = 0;
    for (int i = s.size() - 1; i >= 0 ; i--)
    {
        temp = numHex(s[i]);
        while (temp > 0)
        {
            result.push_back(temp % 2);
            temp /= 2;
        }
    }
    reverse(result.begin(), result.end());
    return result;
}

int main()
{
    cout << "Nhap chuoi: ";
    string s;
    getline(cin, s);

    vector<int> result = hexaToBinary(s);
    for (int i = 0; i < result.size(); i++)
    {
        cout << result[i];
    }
    return 0;
}
