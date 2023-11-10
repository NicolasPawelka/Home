#include"IntVector.h"
using namespace std;


int main(int argc, char **argv) {
	try{
		IntVector V1(10);
		V1.klappt(10);
		cout<<V1[9]<<endl;
	}
	catch(IndexOverflowException& e){
		cout<<e.what()<<endl;
	}

}




