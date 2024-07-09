#include<iostream>
#include<string>
#include <algorithm>
#include<vector>
using namespace std;

int binaryToDecimal(string s) {
    int result = 0;
    int i = 0;
    for (int j = s.size() - 1; j >= 0; j--) {
        result += (s[j] - '0') * pow(2, i);
        i++;
    }
    if (s[0] == '1') {
        result -= pow(2, s.size() - 1);
    }
    return result;
}

string decimalToBinary(int num)
{
    string result = "";
    while (num > 0)
    {
        int temp = num % 2;
        result += to_string(temp);
        num /= 2;
    }
    reverse(result.begin(), result.end());
    return result;
}


bool checkWithinRange(int result)
{
    return (result >= -128 && result <= 127);
}

string addBits(string bitA, string bitB)
{
    string result = "";
    int carry = 0;
    int i = bitA.length() - 1, j = bitB.length() - 1;
    while (i >= 0 || j >= 0 || carry) {
        int sum = carry;
        if (i >= 0) sum += bitA[i--] - '0';
        if (j >= 0) sum += bitB[j--] - '0';

        result = to_string(sum % 2) + result;
        carry = sum / 2;
    }
    if (result.length() > bitA.length())
        result = result.substr(1);
    return result;
}

string TwoFromOne(string bit)
{
    string bit1 = "00000001";
    for (int i = 0; i < bit.size(); i++)
    {
        bit[i] = (bit[i] == '0') ? '1' : '0';
    }
    string result = addBits(bit, bit1);
    return result;
}


string subtractBits(string bitA, string bitB)
{
    bitB = TwoFromOne(bitB);//Bu B
    return addBits(bitA, bitB);
}


string mulBits(string bitA, string bitB)
{
    int numA = binaryToDecimal(bitA);
    int numB = binaryToDecimal(bitB);

    if (numA * numB > 0)
    {
        return decimalToBinary(abs(numA) * abs(numB));
    }
    else if (numA * numB < 0)
    {
        string res = decimalToBinary(abs(numA) * abs(numB));
        return TwoFromOne(res);
    }
}

bool Sign(int a)
{
    if (a > 0)
        return true;
    return false;
}



int binaryToDecimal1(string n) {
    int decimal = 0;
    int base = 1;
    for (int i = n.size() - 1; i >= 0; i--) {
        if (n[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

string divBits(string bitA, string bitB)
{

    string Q = bitA;
    string M = bitB;
    string A = "00000000";
    if (Q[0] == '1')
    {
       TwoFromOne(Q);
    }
    if (M[0] == '1')
    {
        TwoFromOne(M);
    }

    int k = bitA.length();
    while (k > 0)
    {

    }
}

int main()
{
    string bitA, bitB;
    cout << "Bits A: ";
    getline(cin, bitA);
    cout << "Bits B: ";
    getline(cin, bitB);

    /*string result = "";
    cout << "Bits A + B: ";
    cout << addBits(bitA, bitB) << endl;

    cout << "Bits A - B: ";
    cout << subtractBits(bitA, bitB) << endl;

    cout << "Bits A * B: ";
    cout << mulBits(bitA, bitB) << endl;*/

    cout << "Bist A/B: ";
    pair<string, string> result = divBits(bitA, bitB);
    cout << "Integer part: " << result.first << endl;
    cout << "Remainder: " << result.second << endl;
}

/*
  
10000000 
00001000 
  (-128)
  (8)
  KQ:
  11111000 (-16)
  00000000 (0)


*/