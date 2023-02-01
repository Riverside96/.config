#include <iostream>

int main()
{

    void calculateSum() {

        std::cout << "This program will calculate the sum of two given integers\n";
        std::cout << "==========================================================\n";

        std::cout << "Enter the First Number:";
        int x{};
        std::cin >> x;

        std::cout << "Enter the second number:";
        int y{};
        std::cin >> y;

        int z{x + y};

        std::cout << "The sum of the given numbers equals: " << z;

    };
}