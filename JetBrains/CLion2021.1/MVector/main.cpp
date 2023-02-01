#include <iostream>
#include "MVector.h"
using namespace std;

int main() {
    std::cout << "Hello, World!" << std::endl;


    // dont use malloc for instantiating objects
    MVector* firstVec = new MVector(3);
    firstVec->setItem(0, 1.1);
    firstVec->setItem(1, 2.2);
    firstVec->setItem(2, 3.3);



    MVector* secVec = new MVector(3);
    secVec->setItem(0, 5.5);
    secVec->setItem(1, 6.6);
    secVec->setItem(2, 7.7);

    MVector* thirdVec = firstVec->add(secVec);

    cout << "first vec: ";
    firstVec -> display();
    cout << " " << endl;

    cout << "second vec: ";
    secVec   -> display();

    cout <<"\nfirst vec magnitude: ";
    cout << firstVec->getMagnitude() << endl;
    cout << firstVec->getMagnitude() << endl;

    MVector* normalizedVec = firstVec->getNormalized();
    normalizedVec -> display();

    //correct :)
    double dotProduct = firstVec->dot_product(secVec);
    cout << "\ndot product of vec 1 & 2: " << dotProduct << endl;

    //get rid of these to learn about memory leaks
    delete firstVec;
    delete secVec;
    delete thirdVec;
    delete normalizedVec;
    return 0;
}
