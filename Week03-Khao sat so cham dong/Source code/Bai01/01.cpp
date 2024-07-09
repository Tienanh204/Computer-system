#include <iostream>
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



int main() {
    float x;

    while (true)
    {
        cout << "Nhap so cham dong (32-bit): ";
        cin >> x;

        if (cin.fail()) {
            cout << "Khong hop le" << std::endl;
            break;
        }

        cout << "Bieu dien nhi phan: ";
        dumpFloat(&x);
    }

    return 0;
}
