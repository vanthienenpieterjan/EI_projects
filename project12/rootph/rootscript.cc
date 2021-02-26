#include <string>
#include <ctype.h>
//#include <sstream>

#include "iostream"
#include "fstream"
using namespace std;

//using std::string;
#include "ProjectionData.hh"


int main(int argc,char** argv)
{ 
 ProjectionData* lim = new ProjectionData();
 lim->Plot();
 delete lim;

 return 0;
}
