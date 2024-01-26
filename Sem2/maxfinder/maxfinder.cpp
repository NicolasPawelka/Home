#include"maxfinder.h"
using namespace std;
String::String(const char* str){
	_size = strlen(str);
	_str = new char(_size);
	for (int i = 0; i < _size; ++i){
		_str[i] = str[i];
	}
}
String::String(const String& other){
	_size = other.size();
	_str = new char[_size];
	for(int i = 0; i < _size; ++i){
		_str[i] = other._str[i];
	}
}
String& String::operator=(const String& other){
	String tmp {other};
	std::swap(_size,tmp._size);
	std::swap(_str,tmp._str);
	return *this;
}
bool operator>(const String& a,const String& b){
	int len1 = strlen(a._str);
	int len2 = strlen(b._str);
	if(len1 > len2){
		return true;
	}
	else
		return false;

}


String::~String(){
	delete []_str;
}



