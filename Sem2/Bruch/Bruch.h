#ifndef Bruch_H_
#define Bruch_H_
#include<iostream>
inline int ggt(int a, int b) {
	while (a != 0) {
		std::swap(a, b);
		a %= b;
	}
	return b;
}
class Bruch {
public:
	Bruch(int z = 0,int n = 1) :_nenner { n / ggt(z, n) }, _zaehler { z / ggt(z, n) } {}
	int nenner() const {
		return _nenner;
	}
	int zahler() const {
		return _zaehler;
	}
	Bruch& operator*=(const Bruch &b);
private:
	int _nenner;
	int _zaehler;
};
inline Bruch operator*(const Bruch &b, const Bruch &c) {
	Bruch ret(b.zahler() * c.zahler(), b.nenner() * c.nenner());
	return ret;

}
inline int operator==(const Bruch &b, const Bruch &c) {
	float b1 = b.zahler() / b.nenner();
	float b2 = c.zahler()/c.nenner();
	if (b1 == b2) {
		return true;
	} else
		return false;

}
inline int operator!=(const Bruch &b,const Bruch& c){
		float b1 = b.zahler()/b.nenner();
		float b2 = c.zahler()/c.nenner();
		if (b1 != b2){
			return true;
		}else
			return false;
}
class Nennernevernull: public std::runtime_error{
public:
	Nennernevernull(Bruch& val):std::runtime_error("Nenner = 0"),_val{val}{}
	Bruch val()const{return _val;}
private:
	Bruch& _val;
};


#endif /* Bruch_H_ */
