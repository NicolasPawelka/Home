#include"Point.h"
#include"Line.h"
using namespace std;


int calc(int argc, char **argv) {
	Point P1 (8,9);
	Point P2 (3.5,8.9);
	Point P3;
	Point P4 (4.8);
	Point P5 (12.5,-17.5);
	Point P6 (6.5,89.9);
	Line L1(P1,P2);
	Line L2(P5,P6);
	if(P1==P2){
		cout<<"cool"<<endl;
	}else
		cout<<"Uncool"<<endl;
	P2 += P3;
	P2 += P5;
	cout<<P2.get_x()<<"."<<P2.get_y()<<endl;
	if(L1==L2){
		cout<<"Uncool"<<endl;
	}else
		cout<<"cool"<<endl;
	L1 += P6;
	cout<<L1.get_start().get_x()<<"."<<L1.get_start().get_y()<<"/"<<L1.get_end().get_x()<<"."<<L1.get_end().get_y()<<endl;




return 0;
}





