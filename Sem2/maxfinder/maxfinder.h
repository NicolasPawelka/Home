
#ifndef MAXFINDER_H_
#define MAXFINDER_H_
#include<iostream>
#include<cstring>
#include<string>
template <typename T>
T max(T* vec,int size){
	T max = vec[0];
	for(int i = 1; i < size; ++i){
		if(vec[i] > max){
			max = vec[i];
		}
	}
	return max;
	delete [] vec;
}
class String {
public:
String(const char* str);
String(const String&);
String& operator=(const String&);
//String operator>(const String&);
friend bool operator>(const String&,const String&);
int size() const {return _size;}
char *str()const {return _str;}
~String();
private:
int _size;
char* _str;
};





#endif /* MAXFINDER_H_ */
