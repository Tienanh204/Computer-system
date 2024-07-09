#include <iostream>
#include <cstring> 
using namespace std;

void forceFloat(float* p, const char* s)
{
    int len = strlen(s);
    if (len > 32)
    {
        cout << "Do dai chuoi > 32." << endl;
        return;
    }
    for (int i = 0; i < len; ++i)
    {
        if (s[i] != '0' && s[i] != '1')
        {
            cout << "Chuoi khong hop le" << endl;
            return;
        }
    }

    unsigned int value = 0;
    for (int i = 0; i < len; ++i)
    {
        value = (value << 1) | (s[i] - '0');
    }
    memcpy(p, &value, sizeof(float));
}

void printFloat(float value)
{
    if (isinf(value))
    {
        if (value > 0)
            cout << "+ vo cung" << endl;
        else
            cout << "- vo cung" << endl;
        return;
    }
    if (isnan(value))
    {
        cout << "NaN" << endl;
        return;
    }
    cout << value << endl;
}


int main()
{
    float x;
    char binaryString[33];

    while (true)
    {
        cout << "Nhap day nhi phan (32-bit): ";
        cin >> binaryString;
        if (cin.fail())
        {
            cout << "Day khong hop le" << endl;
            break;
        }
        forceFloat(&x, binaryString);
        cout << "So cham dong: ";
        printFloat(x);
    }
    return 0;
}
