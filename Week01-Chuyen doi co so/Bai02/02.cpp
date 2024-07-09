#include<iostream>
#include<stack>
#include<vector>
#include <string>
using namespace std;

//2. Chuyen doi so tu he 10 ve he 16
//Cach 1
vector<char> decimalToHexa(int num)
{
    vector<char> res;
    char hexchar[] = "123456789ABCDEF";

    while (num > 0)
    {
        res.push_back(hexchar[num % 16 - 1]);
        num /= 16;
    }
    reverse(res.begin(), res.end());
    return res;
}


//Cach 2
//vector<string> decToHex(int n)
//{
//    vector<string> res;
//    while (n != 0)
//    {
//        int remainder = n % 16;
//        string temp;
//        if (remainder >= 10 && remainder <= 15)
//        {
//            char ch = 'A' + (remainder - 10);
//            temp = ch;
//            cout << temp << endl;
//        }
//        else
//        {
//            temp = to_string(remainder);
//        }
//        res.push_back(temp);
//        n /= 16;
//    }
//    reverse(res.begin(), res.end());
//    return res;
//}


int main()
{
    int num;
    cout << "Nhap n: ";
    cin >> num;

    vector<char> res = decimalToHexa(num);
    for (char x : res)
    {
        cout << x;
    }
}