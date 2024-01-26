#include<iostream>
#include<fstream>
#include<string>
#include"ooptool.h"
using namespace std;

int main(int argc, char **argv) {
	argsp_t argsp (argc,argv);
	ifstream datei(argsp.pos(0));
	vector <int> zahl;
	int a,i=0,max=0;
	while(datei >> a){
		zahl.push_back(a);
		if(zahl[i] > max){
			max = zahl[i];
		}
		++i;
	}
	cout<<"Anzahl der Zahlen betrug: "<<i<<endl;
	cout<<"Das Maximum betrug: "<<max<<endl;
}
