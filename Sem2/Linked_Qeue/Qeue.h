#include<iostream>
#include<stdexcept>
#ifndef QEUE_H
#define QEUE_H

template<typename T>
class Qeue{
public:
	Qeue();
	~Qeue();
	friend class Iterator;
	size_t size()const;
	bool is_empty()const;
	T& operator[](size_t pos);
	const T& operator[](size_t pos)const;
	void insert(size_t pos, const T& ele);
	void push_back(const T& ele);
	void remove(size_t pos);
	bool remove_ele(const T& ele);
	void show(const Qeue<T>& lis);
	void enter(const T& t);
	void leave();
private:
	struct node{
		T _val;
		node* _next;
	};
	node* _head;
	Qeue(const Qeue& other);
	Qeue& operator=(const Qeue& other);
	class Iterator{
		friend class Qeue;
	public:
		T& operator*();
		Iterator& operator++();
		bool operator==(const Iterator& other)const;
		bool operator!= (const Iterator& other)const;
	private:
		Iterator(node* val): _val{val}{};
		node* _val;
	};
public:
	Iterator begin()const;
	Iterator end()const;

};
#include"Qeue.cpp"
#endif



