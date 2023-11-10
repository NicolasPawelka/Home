
#ifndef LIB_H_
#define LIB_H_
#include<iostream>
#include<istream>
#include"ooptool.h"
template<typename K,typename V,typename H=std::hash<K>>
class HashTabelle{
private:
	struct Node{
		K _key;
		V _value;
		Node* _next;
	}**table;
	std::size_t _cap;
	std::size_t _size;
	H hash_function;
public:
	HashTabelle(std::size_t cap = 6151);
	~HashTabelle();
	V* get(const K& key);
	void put(const K& key,const V& value);
	bool remove(const K& key);
};





#endif /* LIB_H_ */
