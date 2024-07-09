#include <iostream>
using namespace std;

int main() 
{
    //Khai bao cac gia tri
    float f = 3.14159;
    int i = 10;
    float x = 1.0, y = 2.0, z = 3.0;

    // 1. Chuyen doi float -> int -> float
    int temp = static_cast<int>(f);
    float result1 = static_cast<float>(temp);
    cout << "1. Chuyen doi float -> int -> float: ";
    if (result1 == f) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 2. Chuyen doi int -> float -> int. ket qua nhu nao?
    float temp2 = static_cast<float>(i);
    int result2 = static_cast<int>(temp2);
    cout << "2. Chuyen doi int -> float -> int: ";
    if (result2 == i) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 3. Phep cong so cham dong co tinh ket hop?
    float result3a = (x + y) + z;
    float result3b = x + (y + z);
    cout << "3. Phep cong so cham dong co tinh ket hop: ";
    if (result3a == result3b) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 4. i = (int) (3.14159 * f);
    i = static_cast<int>(3.14159f * f);
    cout << "4. i = (int) (3.14159 * f): " << i << endl;

    // 5. f = f + (float) i;
    f = f + static_cast<float>(i);
    cout << "5. f = f + (float) i: " << f << endl;

    // 6. if (i == (int)((float) i))
    cout << "6. if (i == (int)((float) i)): ";
    if (i == static_cast<int>(static_cast<float>(i))) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 7. if (i == (int)((double) i))
    cout << "7. if (i == (int)((double) i)): ";
    if (i == static_cast<int>(static_cast<double>(i))) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 8. if (f == (float)((int) f))
    cout << "8. if (f == (float)((int) f)): ";
    if (f == static_cast<float>(static_cast<int>(f))) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    // 9. if (f == (double)((int) f))
    cout << "9. if (f == (double)((int) f)): ";
    if (f == static_cast<double>(static_cast<int>(f))) {
        cout << "true" << endl;
    }
    else {
        cout << "false" << endl;
    }

    return 0;
}
