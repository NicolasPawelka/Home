#include "Sequence.h"
#ifndef SEQUENCE_CPP
#define SEQUENCE_CPP
template<typename T>
Sequence<T>::Sequence(size_t cap):_cap{cap} {
	 _feld = new T [_cap];
	 _size = 0;
}
template<typename T>
Sequence<T>::~Sequence() {
	delete [] _feld;
}
template<typename T>
Sequence<T>::Sequence(const Sequence& other){
	_cap = other._cap;
	_size = other._size;
	_feld = new T [_cap];
	for(int i = 0; i < _cap; ++i){
		_feld[i] = other._feld[i];
	}
}
template<typename T>
Sequence<T>& Sequence<T>:: operator=(const Sequence& other){
	Sequence tmp = other;
	std::swap(_cap,tmp._cap);
	std::swap(_size,tmp._size);
	std::swap(_feld,tmp._feld);
}
template<typename T>
bool Sequence<T>:: is_empty()const{
	return _size == 0;
}
template<typename T>
bool Sequence<T>:: is_full()const{
	return _size == _cap;
}
template<typename T>
const T& Sequence<T>::operator[](size_t idx)const{
	if(idx >= _size){
		std::string msg("idx too far");
		throw std::runtime_error(msg);
	}
	return _feld[idx];
}
template<typename T>
void Sequence<T>::insert(size_t idx,const T& ele){
	if(is_full()){
		if(_cap==1){
			_cap = 2;
		}
		size_t tmp = (_cap*1.5) - _cap;
		resize(tmp);
	}
	if(idx > _size){
		throw std::runtime_error("insert::idx too far");
	}
	for(size_t i = _size; i > idx; --i){
		_feld[i] = _feld[i-1];
	}
	_size += 1;
	_feld[idx] = ele;

}
template<typename T>
void Sequence<T>::push_back(const T& ele){
	insert(_size,ele);
}
template<typename T>
void Sequence<T>::remove(size_t idx){
	if(idx >= _size){
		throw std::runtime_error("idx too far");
	}
	_size -= 1;
	for(size_t i = idx; i < _size; ++i){
		_feld[i] = _feld[i+1];
	}


}
template<typename T>
bool Sequence<T>::remove_ele(const T& ele){
	size_t pos = 0;
	while(pos < _size && !(_feld[pos] == ele)){
		pos+=1;
	}
	if(pos < _size){
		remove (pos);
		return true;
	}
	return false;


}
template<typename T>
void Sequence<T>:: show(const Sequence& seq){
	std::cout << "[" << seq.size() << "/" << seq.cap() << "] ";
	for (size_t pos=0; pos < seq.size(); pos+=1) {
	std::cout << seq[pos] << " ";
	}
	std::cout<<std::endl;
}
template<typename T>
void Sequence<T>::resize(size_t n){
	_cap +=n;
	T* tmp = new T[_cap];
	for(size_t i=0; i < _size; ++i){
		tmp[i] = _feld[i];
	}
	delete[]_feld;
	_feld = new T[_cap];
	for(size_t i =0; i < _cap;++i){
		_feld[i] = tmp[i];
	}
	delete[]tmp;
}

#endif







