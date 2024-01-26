#include"CommonVector.h"
using namespace std;


int main(int argc, char **argv) {
CommonVector<int,10>a;
for(size_t i = 0; i < a.size(); ++i){
	a[i] = (i + 1) * (i + 1);
}
a.out();
CommonVector<char,25>b;
string c  = "Hallo tolle C++ Welt";

for(size_t i = 0; i < b.size(); ++i){
	if(c[i] > 0 && c[i] < 127){
		b[i] = c[i];
	}else
		b[i] = '0';

}
b.out();
CommonVector<const char*,4>d;
d[0] = "Hallo";
d[1] = "tolle";
d[2] = "C++";
d[3] = "Welt";
d.out();



}




