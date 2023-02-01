
#ifndef MVECTOR_MVECTOR_H
#define MVECTOR_MVECTOR_H

#include <iostream>
#include <cstdlib>
using namespace std;
class MVector {
public:
    //constructor
    MVector(int size);
    //MVector():size(0), data(0){};
    MVector();
    //destructor
    ~MVector();
    void display();
    void setItem(int index, double data);
    double getMagnitude();
    MVector* getNormalized();
    MVector* add(MVector* rhs);
    MVector* add(int toAdd);
    double dot_product(MVector* second);
private:
    int size;
    // pointer to an array of values
    double* data;
};


//class myArray(int, ...);



// ----- Inlines -------- //
//======================================================
inline MVector::MVector(int size) {

    this->size = size;
    data = (double*) malloc(sizeof(double)*size);
}

inline void MVector::setItem(int index, double data) {

    //no need to return an error, it will silently not update
    if (index>=0 && index<=size)
    this->data[index]=data;
}


inline MVector::MVector():size(0), data(0){

}

//destructor
inline MVector::~MVector() {

    free(data);
    //we dont need to add data = nullptr here as it's get destructed
}

inline void MVector::display() {
    for (int i = 0; i<size; i++) {
        cout <<"[";
        cout << data[i];
        cout << "] ";
    }
}






#endif //MVECTOR_MVECTOR_H
