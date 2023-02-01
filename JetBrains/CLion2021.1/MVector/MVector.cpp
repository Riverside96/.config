#include <cstdlib>
#include "MVector.h"
#include <iostream>
#include <cmath>
using namespace std;


//myArray::myArray(int, ...) {


//=============================================================================================
//=============================================================================================

//=============================================================================================
MVector* MVector::getNormalized() {
  MVector* normalizedVec = new MVector(this->size);
  double magnitude = this->getMagnitude();
  for (int i=0; i<this->size; i++) {
  normalizedVec->data[i] = ((this->data[i]) / magnitude);
  
  }
  return normalizedVec;
}

//=============================================================================================
// get magnitude is changing the vector. This is the normalized problem with geNormalized most likely
double MVector::getMagnitude() {
    double sum;
    MVector* temp = new MVector(this->size);
    for(int i = 0; i < this->size; i++) {
       temp->data[i] = (this->data[i]) * (this->data[i]);
    }
    for(int i = 0; i<this->size; i++) {
        sum += temp->data[i];
    }


    double magnitude = sqrt(sum);
    return magnitude;
}

//=============================================================================================
//=============================================================================================
MVector* MVector::add(MVector* rhs) {

    //the one case where we can access the private
    // the private parameter is the same data types as ourself
    // We can because we in the same class declaration
    if (size == rhs->size) {


    MVector* newVec = new MVector(size);
    for (int i = 0; i < size; i++) {
        newVec->setItem(i, (rhs->data[i] + this->data[i]));

    };
    return newVec;
    }
    //else essentially
    return nullptr;
}

//=============================================================================================
MVector* MVector::add(int toAdd) {

    //the one case where we can access the private
     //the private parameter is the same data types as ourself
     //We can because we in the same class declaration
    
  MVector* newVec = new MVector(this->size);
  int x;

  if (toAdd > 0) 
     for(int i = 0; i<this->size; i++){
       x = data[i];
       if(toAdd >= 0) {
        newVec->setItem(i,  x+(toAdd));
      } else {
        newVec->setItem(i, x-toAdd);
      }

    }
 return newVec;

}




//=============================================================================================
double MVector::dot_product(MVector* secondVec) {
  if(this->size == secondVec->size) {
    double sum = 0;
    for(int i = 0; i<this->size; i++) {
      sum += (this->data[i] * secondVec->data[i]);

     //double[] sum[i] = (this->data[i])
    }
return sum;



  } else return 0;
}





