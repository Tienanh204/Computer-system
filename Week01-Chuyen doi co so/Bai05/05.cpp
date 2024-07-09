#include<iostream>
#include<stack>
#include<sstream>
#include<string>
#include<vector>
#include<algorithm>
#include<cmath> 
using namespace std;

//5. Chuyen doi tu he 2 ve he 16
char numHex(int s)
{
    char hexchar[] = "123456789ABCDEF";
    if (s >= 0 && s <= 15)
        return hexchar[s];
    else
        return ' ';
}

vector<char> binaryToHexa(string s)
{
    vector<char> result;
    int temp = 0;

    while (s.size() % 4 != 0)
        s.insert(0, 1, '0');

    for (int i = 0; i < s.size(); i += 4)
    {
        temp = 0; 
        for (int j = 0; j < 4; j++)
        {
            temp = temp + (s[i + j] - '0') * pow(2, 3 - j);
        }
        result.push_back(numHex(temp-1));
    }
    return result;
}

int main()
{
    cout << "Nhap chuoi: ";
    string s;
    getline(cin, s);

    vector<char> result = binaryToHexa(s);
    for (int i = 0; i < result.size(); i++)
    {
        cout << result[i];
    }
    return 0;
}
