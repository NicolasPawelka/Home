#include"lib.h"
using namespace std;


int main(int arg , char **argv) {
	clock_t start,ende;
	vector<int>vec(10);
	fill(begin(vec),end(vec));
	start = clock();
	sort(begin(vec),end(vec),[](int a, int b){return a > b;});
	ende = clock();
	cout<<ende - start <<" was"<<endl;
	cout<<"SORTIERT"<<endl;
	out(begin(vec),end(vec));
}





