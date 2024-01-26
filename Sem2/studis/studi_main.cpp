#include"studi.h"
#include<vector>
using namespace std;


int main(int argc, char **argv) {
	int i = 0;
	ifstream datei ("studis.txt");
	string daten;
	vector <Studi> s;
	Studi h;
	while(datei >> h){
		s.push_back(h);
		cout<<s[i]<<endl;
		++i;
	}

}





