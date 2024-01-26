#include"lib.h"
using namespace std;
int main(int argc, char **argv) {
	K k1(3,2,3);
	K k2(5,6,7);
	K k3(8,9,10);
	cout<<k1.getX()<<endl;
	k1.getX() = k2.getX()=k3.getX();
	cout<<k1.getX()<<endl;


}





