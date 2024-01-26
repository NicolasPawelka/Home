
#ifndef CommonVector_H_
#define CommonVector_H_
#include<iostream>
#include<vector>
#include<stdexcept>
#include<string.h>
#include"ooptool.h"
template<typename T, std::size_t len>
class CommonVector{
public:
	CommonVector();
	~CommonVector();
	size_t size()const{return len;}
	T& operator[](size_t idx);
	void out(void) const ;
private:
	T* _vec;
};
template<typename T, std::size_t len>
T& CommonVector <T,len>::operator [](size_t idx){
	if(idx >= len){
		throw std::runtime_error("Idx not available");
	}else
		return _vec[idx];

}
template <typename T, std::size_t len>
CommonVector<T,len>::CommonVector(){
	_vec = new T [len];
}
template <typename T, std::size_t len>
CommonVector<T,len>::~CommonVector(){
	delete []_vec;
}
template<typename T, std::size_t len>
void CommonVector<T, len>::out(void) const {
std::cout << "[ ";
for (std::size_t i=0; i < len; i+=1) {
if (i > 0 && i%10 ==0) { std::cout << std::endl << " "; }
std::cout << _vec[i] << " ";
}
std::cout << "]";
}



#endif /* COMMON_VECTOR_H_ */
