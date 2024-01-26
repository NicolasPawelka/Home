
#ifndef IntVector_H_
#define IntVector_H_
#include<iostream>
#include<vector>
#include<stdexcept>
#include"ooptool.h"
#define N 17


class IntVector{
public:
	IntVector(size_t len )
	: _vec{NULL},_len {len}{
		this->klappt(len);
	}
	int& at(size_t idx);
	void out();
	size_t size()const {return _len;}
	void klappt(size_t n);
	IntVector& operator= (const IntVector&);//Zuweisungsoperator
	IntVector(const IntVector& vec);//Kopierkonstruktor
	~IntVector();//Dekonstruktor
private:
	int* _vec;
	size_t _len;
};




#endif /* IntVector_H_ */
