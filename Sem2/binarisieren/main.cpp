#include"lib.h"
#include"ooptool.h"
using namespace std;


int main(int argc, char **argv) {
	vector<int> bild = read_pgm("lena.pgm");
	int breite = bild[0];
	int hoch = bild[1];
	int V = bild[2];
	cout<<bild[20]<<endl;
	for (int i=3;i < breite*hoch;i++){
		int s = V * 0.5;
		if(bild[i] < s){
			bild[i] = 0;
		}else
			bild[i] = V;

	}
	cout<<bild[20]<<endl;




}
