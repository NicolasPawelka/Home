#include"Bruch.h"
using namespace std;
Bruch& Bruch::operator*= (const Bruch& b){
	this->_zaehler *= b._zaehler;
	this->_nenner *= b._nenner;
	int a = ggt(_zaehler, _nenner);
	this->_zaehler = this->_zaehler/a;
	this->_nenner = this->_nenner/a;
	return *this;
}




