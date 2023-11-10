#include"maxfinder.h"
using namespace std;


int main(int argc, char **argv) {
	int* a = new int[5]{1000,2,520,4,-8};
	cout<<max(a,5)<<endl;
	string str = "Hallo schoene welt WZWz";
	const char *cstr = str.c_str();
	String sa (cstr);
	cout<<max(sa.str(),50)<<endl;
	delete[]a;
}




