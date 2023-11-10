#include "at.h"

int& at(int* vec, int len, int i){
	if(i<len || i>len){
	throw std::runtime_error("index overflow");
	}
	return vec[i];
}


void calc(int argc, char **argv) {
	const int len {5};
	int i {3};
	int* vec=new int [5] {1,2,3,4,5};
	at(vec,len,i);
	delete[]vec;
}
