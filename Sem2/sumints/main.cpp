#include"IntVector.h"
using namespace std;

int main(int argc, char **argv) {
	argsp_t argsp (argc,argv);
	int start = argsp.int_pos(0, 0);
	int end = argsp.int_pos(1, 10000);
	int sum = 0;
	IntVector vec(start,end);
	for(auto it = vec.begin(); it != vec.end(); ++it){
		sum += *it;
	}
	cout<<"von: "<<start<<" bis: "<<end<<" sum= "<<sum<<endl;
}


