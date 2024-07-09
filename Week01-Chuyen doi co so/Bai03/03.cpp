#include<iostream>
#include<stack>
#include<sstream>
#include<vector>
#include<algorithm>
#include<cmath> 
using namespace std;

//3. Chuyen doi tu he 16 ve he 10
int numHex(char s)
{
    if (s >= 'A' && s <= 'F') 
        return s - 'A' + 10;  
    else
        return s - '0'; 
}

int hexaToDecimal(string s)
{
    int ans = 0;
    int cnt = 0;
    for (int i = s.size() - 1; i >= 0; i--)
    {
        int temp = numHex(s[i]);
        ans = ans + temp * pow(16, cnt);
        cnt++;
    }
    return ans;
}

int main()
{
    cout << "Nhap chuoi: ";
    string s;
    getline(cin, s);

    cout << hexaToDecimal(s) << endl;
    return 0;
}
