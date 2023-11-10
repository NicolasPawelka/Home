
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
	:_vec{NULL}, _len {len}{
		this->klappt(_len);
	}
private:
	class Iterator{
		friend class IntVector;
	public:
		int& operator*();
		Iterator& operator++();
		bool operator==(const Iterator& other)const;
		bool operator!= (const Iterator& other)const;
	private:
		Iterator(int* val):_val{val}{}
		int* _val;
	};
public:
	friend class Iterator;
	Iterator begin()const;
	Iterator end()const;
	int& operator[](size_t idx);
	void out();
	size_t size()const {return _len;}
	void klappt(size_t n);
	void crash(size_t n);
	void change (size_t n);
	IntVector& operator= (const IntVector&);//Zuweisungsoperator
	IntVector(const IntVector& vec);//Kopierkonstruktor
	~IntVector();//Dekonstruktor
private:
	int* _vec;
	size_t _len;
};
void copyassign(IntVector& vec);
class IndexOverflowException: public std::runtime_error{
public:
	IndexOverflowException(size_t len):std::runtime_error("Index out of range"),_len{len}{}
	size_t len()const{return _len;}
private:
	size_t _len;

};
#endif /* IntVector_H_ */
