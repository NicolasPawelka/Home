
#ifndef IntVector_H_
#define IntVector_H_
#include<iostream>
#include<vector>
#include<stdexcept>
#include"ooptool.h"
#define N 17


class IntVector{
public:
	IntVector(size_t start, size_t end)
	:_vec{NULL}, _len {end}{
		this->klappt(start,_len);
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
	void klappt(size_t n,size_t z);
	void crash(size_t n);
	void change (size_t n);
	IntVector& operator= (const IntVector&);//Zuweisungsoperator
	IntVector(const IntVector& vec);//Kopierkonstruktor
	~IntVector();//Dekonstruktor
private:
	int* _vec;
	size_t _len;
};
#endif /* IntVector_H_ */
