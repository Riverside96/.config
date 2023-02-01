#include <iostream>
#include <crtdbg.h>

int main()
{
#ifdef _DEBUG
    //  _CrtSetBreakAlloc(87);
  _onexit(_CrtDumpMemoryLeaks);
#endif

    // start coding here

    return 0;
}
