#include"Sequence.h"
#include"studi.h"
#include"ooptool.h"
Studi search(Sequence<Studi>& s,long matnr);
using namespace std;


int main(int argc, char **argv) {
	argsp_t argsp(argc,argv);
	ifstream datei(argsp.pos(0));
	Studi h;
	Sequence<Studi>s;
	while(datei >> h){
		s.push_back(h);
		s.show(s);
	}
	cout<<h<<endl;
	if(argc > 1){
		cout<<search(s,argsp.int_pos(1))<<endl;
	}
	else
		cout<<"Keine Matrikelnummer gegeben"<<endl;
}





