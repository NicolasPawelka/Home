#include"lib.h"
template<typename K,typename V,typename H>
HashTabelle<K,V,H>::HashTabelle(std::size_t cap): _cap{cap},_size{0}{
	table = new Node*[_cap]{nullptr};
}
template<typename K,typename V,typename H>
HashTabelle<K,V,H>::~HashTabelle(){
	for(std::size_t i = 0; i < _cap; ++i){
		Node* begin = table[i];
		while(begin != nullptr){
			Node* todel = begin;
			begin = begin->_next;
			delete todel;
		}
	}
	delete table;
}
template<typename K,typename V,typename H>
V* HashTabelle<K,V,H>::get(const K& key){
	size_t value = hash_function(key)%_cap;
	Node* begin = table[value];
	while(begin != nullptr){
		if(begin->_key == key){
			return &begin->_key;
		}
		begin = begin->_next;
	}
	return nullptr;
}
template<typename K,typename V,typename H>
void HashTabelle<K,V,H>::put(const K& key,const V& value){
	size_t wert = hash_function(key)%_cap;
	Node* pred = nullptr;
	Node* begin = table[wert];
	while(begin != nullptr && begin->_key != key){
		pred = begin;
		begin = begin->_next;
	}
	if(begin == nullptr){
		begin = new Node {key,value};
		++_size;
	if(pred == nullptr){
		table[wert] = begin;
	}else{
		pred->_next = begin;
	}
	}else{
		begin->_value = value;
	}
}
template<typename K,typename V,typename H>
bool HashTabelle<K,V,H>::remove(const K& key){
	size_t value = hash_function(key)%_cap;
	Node* pred = nullptr;
	Node* begin = table[value];
	while(begin != nullptr && begin->_key != key){
		pred = begin;
		begin = begin->_next;
	}
	if(begin == nullptr){
		return false;
	}else{
		if(pred == nullptr){
			table[value] = begin->_next;
		}else{
			pred->_next = begin->_next;
		}
		delete begin;
		--_size;
		return true;
	}

}




