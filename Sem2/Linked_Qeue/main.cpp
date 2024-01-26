#include"Qeue.h"
using namespace std;


int main(int argc, char **argv) {
	Qeue<int> Q1;
	int sum = 0;
	for(int i = 0; i < 100; ++i){
		Q1.enter(i);
		Q1.leave();
	}
	Q1.show(Q1);
	for(int i = 0; i <= 100; ++i){
		Q1.enter(i);
	}
	Q1.show(Q1);
	for(auto it = Q1.begin(); it != Q1.end(); ++it){
		sum += *it;
	}
	cout<<sum<<endl;



}





