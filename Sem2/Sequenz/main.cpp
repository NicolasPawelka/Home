#include"Sequence.h"
using namespace std;

int main(int argc, char **argv) {
	Sequence <int> s(1);
	while(s.cap() < 100){
		size_t i = s.cap();
		s.push_back(17);
		if(s.cap() > i){
			cout<<s.cap()<<endl;
		}
	}
	s.show(s);
}





