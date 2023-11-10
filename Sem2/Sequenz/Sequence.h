#include<iostream>
#include<stdexcept>
#ifndef SEQUENCE_H_
#define SEQUENCE_H_

template<typename T> class Sequence {
public:
	Sequence(size_t cap);
	Sequence(const Sequence&);
	Sequence& operator=(const Sequence&);
	~Sequence();
	size_t size() const {
		return _size;
	}
	size_t cap() const {
		return _cap;
	}
	bool is_empty() const;
	bool is_full() const;
	const T& operator[](size_t idx) const;
	void insert(size_t idx, const T &ele);
	void push_back(const T &ele);
	void remove(size_t idx);
	bool remove_ele(const T &ele);
	void show(const Sequence &sec);
	void resize(size_t n);
private:
	T *_feld;
	size_t _cap;
	size_t _size;

};
#include"Sequence.cpp"
#endif /* SEQUENCE_H_ */

