#ifndef Bruch_H_
#define Bruch_H_
#include<iostream>
#include"alltest.h"
inline int ggt(int a, int b) {
	while (a != 0) {
		std::swap(a, b);
		a %= b;
	}
	return b;
}
class Bruch {
public:
	Bruch(int z = 0, int n = 1) :
			_nenner { n / ggt(z, n) }, _zaehler { z / ggt(z, n) } {
		if (_nenner == 0) {
			_nenner = 1;
		}
		if (_nenner < 0) {
			_nenner *= -1;
			_zaehler *= -1;
		} else
			;

	}
	int nenner() const {
		return _nenner;
	}
	int zaehler() const {
		return _zaehler;
	}
	Bruch& operator*= (const Bruch& b){
		this->_zaehler *= b._zaehler;
		this->_nenner *= b._nenner;
		int a = ggt(_zaehler, _nenner);
		this->_zaehler = this->_zaehler/a;
		this->_nenner = this->_nenner/a;
		return *this;
	}
private:
	int _nenner;
	int _zaehler;
};
inline Bruch operator*(const Bruch &b, const Bruch &c) {
	Bruch ret(b.zaehler() * c.zaehler(), b.nenner() * c.nenner());
	return ret;

}
inline int operator==(const Bruch &b, const Bruch &c) {
	float b1 = b.zaehler() / b.nenner();
	float b2 = c.zaehler()/c.nenner();
	if (b1 == b2) {
		return true;
	} else
		return false;

}
inline int operator!=(const Bruch &b,const Bruch& c){
		float b1 = b.zaehler()/b.nenner();
		float b2 = c.zaehler()/c.nenner();
		if (b1 != b2){
			return true;
		}else
			return false;
}


#endif /* Bruch_H_ */
