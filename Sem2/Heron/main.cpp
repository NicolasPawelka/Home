#include<iostream>
#include"ooptool.h"
#include"lib.h"
using namespace std;


int main(int argc, char **argv) {
	argsp_t argsp(argc,argv);
	double x = argsp.double_pos(0, 10.0);
	double esp = argsp.double_pos(1,1e-6);
	cout <<heron(x,esp)<<endl;


}



