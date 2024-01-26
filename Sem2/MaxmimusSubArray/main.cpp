#include"lib.h"
using namespace std;
int main(int argc, char **argv) {
	vector<int>vec = read_ints("maxsubsimple.dat");
	cout<<maximum(vec)<<endl;
	vector<int>vec1 = read_ints("maxsub.dat");
	cout<<maximum(vec1)<<endl;
	vector<int>vec2 = read_ints("maxsublarge.dat");
	cout<<maximum(vec2)<<endl;
	vector<int>vec3 = read_ints("maxsubverylarge.dat");
	cout<<maximum(vec3)<<endl;
	vector<int>vec4 {-1,4,5,-2,-3,-1,2,-4,4,-2};
	cout<<maximum(vec4)<<endl;
	cout<<maxrekur(vec4,0,9)<<endl;
//	cout<<maximum(vec4)<<endl;


}





