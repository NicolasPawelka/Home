#include"tausche.h"


void tausche  (int*&  x,int*& y){
		int* tmp=y;
		y=x;
		x=tmp;

}
