using namespace std;
#include"lib.h"
#include"ooptool.h"



int main(int argc, char **argv) {
	argsp_t argsp(argc,argv);
	int n = argsp.int_pos(1, 8);
	int* feld = new int [n];
	setz(0,n,feld);

}



