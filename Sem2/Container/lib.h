
#ifndef LIB_H_
#define LIB_H_
#include<iostream>
#include<vector>
#include<algorithm>
#include<time.h>
template<typename Iter>
void fill(Iter begin, Iter end){
	auto it = begin;
	while(it != end){
		*it = rand()%100;
		++it;
	}
}
template<typename Iter>
void out(Iter begin, Iter end){
	auto it = begin;
		while(it != end){
			std::cout<<*it<<std::endl;
			++it;
		}
}




#endif /* LIB_H_ */
