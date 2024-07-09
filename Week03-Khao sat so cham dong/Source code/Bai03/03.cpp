#include <iostream>
#include <cstring> 
#include <bitset>
using namespace std;

void dumpFloat(float* p)
{
    unsigned char* ptr = reinterpret_cast<unsigned char*>(p);
    unsigned int floatBits = 0;

    for (int i = sizeof(float) - 1; i >= 0; i--)
    {
        floatBits = (floatBits << 8) | *(ptr + i);
    }

    int sign = (floatBits >> 31) & 1;
    int exponent = (floatBits >> 23) & ((1 << 8) - 1);
    unsigned int significand = floatBits & ((1 << 23) - 1);

    cout << sign << " ";
    cout << bitset<8>(exponent) << " ";
    cout << bitset<23>(significand) << endl;
}
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
    //1. Bieu dien nhi phan cua so 1.3E+20
    cout << "1.3E+20: ";
    float number1 = 1.3E+20;
    dumpFloat(&number1);

    //2. So float nho nhat > 0 la so nao, bieu dien nhi phan
    cout << "So float nho nhat > 0: ";
    float temp = numeric_limits<float>::min();
    printFloat(temp);
    cout << "Bieu dien nhi phan cua no: ";
    dumpFloat(&temp);


    //3. Cac truong hop dac biet
    cout << "Cac truong hop dac biet:\n";

    //So bao loi NaN
    float nan = numeric_limits<float>::quiet_NaN();
    cout << "So bao loi NaN: ";
    printFloat(nan);


    //So vo cung
    float inf = numeric_limits<float>::infinity();
    cout << "So vo cung: ";
    printFloat(inf);

    //Mot so phep toan tao ra so dac biet
    float x = 0.0;
    float y = 1.0;
    float z = -1.0;
    float result;

    //sqrt(X) với X < 0
    float negative = -1.0;
    result = sqrt(negative);
    cout << "sqrt(X) voi X < 0: ";
    printFloat(result);


    // X - (+∞)
    result = x - inf;
    cout << "X - (+ vo cung): ";
    printFloat(result);

    // (+∞) - (+∞)
    result = inf - inf;
    cout << "(+ vo cung) - (+ vo cung): ";
    printFloat(result);

    //// X/0
    //result = x / 0;
    //cout << "X/0: ";
    //printFloat(result);

    // 0/0
    result = 0 / 0;
    cout << "0/0: ";
    printFloat(result);

}