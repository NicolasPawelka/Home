#include"Qeue.h"
#ifndef QEUE_CPP
#define QEUE_CPP
template<typename T>
Qeue<T>::Qeue(){
	_head = nullptr;
}
template<typename T>
Qeue<T>::~Qeue(){
	while(_head != nullptr){
		node* to_del = _head;
		_head = _head->_next;
		delete to_del;
	}

}
template<typename T>
size_t Qeue<T>:: size()const{
	node *h = _head;
	size_t size = 0;
	while(h != nullptr){
		h = h->_next;
		size++;
	}
	return size;
}
template<typename T>
bool Qeue<T>::is_empty()const{
	return _head == nullptr;
}
template<typename T>
T& Qeue<T>::operator[](size_t pos){
	node* h = _head;
	while(pos != 0 && h != nullptr){
		h = h->_next;
		pos -= 1;
	}
	if(h==nullptr){
		throw std::runtime_error("Pos out of bounds");
	}
	return h->_val;

}
template<typename T>
const T& Qeue<T>::operator[](size_t pos)const{
	node* h = _head;
	while(pos != 0 && h != nullptr){
		h = h->_next;
		--pos;
	}
	if (h == nullptr){
		throw std::runtime_error("Pos out of bounds");
	}
	return h->_val;

}
	template<typename T>
	void Qeue<T>::insert(size_t pos, const T& ele){
	if(pos == 0){
		node* n = new node;
		n->_next = _head;
		n->_val = ele;
		_head = n;
		return;
	}
	node* h = _head;
	while(pos != 0 && h != nullptr){
		h = h->_next;
		--pos;
	}
	if(h == nullptr){
		throw std::runtime_error("Pos out of bound");
	}
	node* n = new node;
	n->_next = _head;
	n->_val = ele;
	h->_next = n;
}
template<typename T>
void Qeue<T>::push_back(const T& ele){
	node* n = new node;
	n->_next = nullptr;
	n->_val = ele;
	if(_head == nullptr){
		_head = n;
		return;
	}
	node* h = _head;
	while(h->_next != nullptr){
		h = h->_next;
	}
	h->_next = n;
}
template<typename T>
void Qeue<T>::remove(size_t pos){
	if(_head == nullptr){
		throw std::runtime_error("remove::Pos out of bounds");
	}
	if(pos==0){
		node *n = _head;
		_head = n->_next;
		delete n;
		return;
	}
	node *h = _head;
	while(pos != 1 && h->_next != nullptr){
		h = h->_next;
		--pos;
	}
	if(h->_next == nullptr){
		throw std::runtime_error("remove: Pos out of bounds");
	}
	node* to_del = h->_next;
	h->_next = h->_next->_next;
	delete to_del;

}
template<typename T>
bool Qeue<T>::remove_ele(const T& ele){
	if(_head == nullptr){return false;}
	if(_head->_val == ele){
		node* todel = _head;
		_head = _head->_next;
		delete todel;
		return true;
	}
	node* h = _head;
	while(h->_next != nullptr){
		if(h->_next->_val == ele){
			node* todel = _head;
			_head = _head->_next->_next;
			delete todel;
			return true;
		}
		h = h->_next;
	}
	return false;

}
template<typename T>
void Qeue<T>::show(const Qeue<T>& lis) {
size_t size = lis.size();
std::cout << "[" << size << "] ";
for (size_t pos=0; pos < size; pos+=1) {
std::cout << lis[pos] << " ";
}
std::cout << std::endl;
}
template<typename T>
void Qeue<T>::enter(const T& t){
	node* n = new node;
	n->_next = nullptr;
	n->_val = t;
	if(_head == nullptr){
		_head = n;
		return;
	}
	node* h = _head;
	while(h->_next != nullptr){
		h = h->_next;
	}
	h->_next = n;

}
template<typename T>
void Qeue<T>::leave(){
	node* todel = _head;
	_head = _head->_next;
	delete todel;
}
template<typename T>
T& Qeue<T>::Iterator::operator*(){
	if(_val == nullptr){
		throw std::runtime_error("Iterator* :end");
	}
	return _val->_val;
}
template<typename T>
typename Qeue<T>::Iterator& Qeue<T>::Iterator::operator++(){
	if(_val == nullptr){
			throw std::runtime_error("Iterator++ :end");
		}
	_val = _val->_next;
	return *this;

}
template<typename T>
bool Qeue<T>::Iterator::operator==(const Iterator& other)const{
	return _val == other._val;
}
template<typename T>
bool Qeue<T>::Iterator::operator!=(const Iterator& other)const{
	return _val != other._val;
}
template<typename T>
typename Qeue<T>::Iterator Qeue<T>::begin()const{
	return Iterator(_head->_next);
}
template<typename T>
typename Qeue<T>::Iterator Qeue<T>::end()const{
	return Iterator(nullptr);

}

#endif

