#include <iostream>
//#include <crtdbg.h>
using namespace std;

int main()
{
#ifdef _DEBUG
    _CrtSetBreakAlloc(87);
  _onexit(_CrtDumpMemoryLeaks);
#endif

  // start coding here

    // seed rand
    srand(time(nullptr));

    // allocate number of balls to drop
    int numofBalls =0;
    cout << "Enter the number of balls you would to drop" << endl;
    cin >> numofBalls;
    int* ballNoPointer = (int*) malloc(sizeof(int)*numofBalls);

   // allocate number of levels
   int numofLevels = 0;
   cout << "Enter number of levels" << endl;
   cin >> numofLevels;
   int* levelNoPointer = (int*) malloc(sizeof(int)*numofLevels);




   //create bucket array
    int* bucket_pointer = (int*) calloc(numofLevels+1, sizeof (int));

    int rightNum = 0;
    for(int i = 0; i < *levelNoPointer; i++) {

        if (rand() > (RAND_MAX/2) {
            rightNum += rightNum;
        }


        }





  return 0;
}
