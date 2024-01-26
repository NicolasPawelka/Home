#include"lib.h"

double heron (double x,double eps){
	double a {(1+x)/2};
	double dif {a};
	double b {0};
	while (dif>=eps){
		b = (a+(x/a))/2;
		dif=a-b;
		a=b;
		}
	return b;



}
