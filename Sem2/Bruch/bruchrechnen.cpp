#include"Bruch.h"
using namespace std;


int main(int argc, char **argv) {
	try{
	Bruch b1(5,4);
	Bruch b2(8,3);
	if(b1==b2){
		cout<<"Brüche sind gleich"<<endl;
	}else;
	if(b1 != b2){
		cout<<"Brüche sind verschieden"<<endl;
	}else;
	b1 *= b2;
	cout<<b1.zahler()<<"/"<<b1.nenner()<<endl;
	Bruch b3 = b2*2;
	cout<<b3.zahler()<<"/"<<b3.nenner()<<endl;
	Bruch b4(22,84);
	cout<<b4.zahler()<<"/"<<b4.nenner()<<endl;
	Bruch b5(15,3);
	if(5==b5){
		cout<<b5.zahler()<<"/"<<b5.nenner()<<endl;
	}else;
	}
	catch(Nennernevernull& e){


	}




}





