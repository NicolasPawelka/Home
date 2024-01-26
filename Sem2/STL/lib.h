#include<iostream>
#include<list>
#include<vector>
#ifndef LIB_H_
#define LIB_H_
namespace my{
bool fun (int val){return val%2==0;}
template <typename Iter,typename T>
int count(Iter begin,Iter end,const T& val){
	int sum = 0;
	auto it = begin;
	while(it != end){
		if(*it == val){
			++sum;
		}
		++it;
	}
	return sum;
}
template<typename Iter,typename Pr>
int count_if(Iter begin,Iter end, Pr fun){
	int sum = 0;
	auto it = begin;
	while(it != end){
		if(fun(*it)){
			++sum;
		}
		++it;
	}
	return sum;
}

}




#endif /* LIB_H_ */
