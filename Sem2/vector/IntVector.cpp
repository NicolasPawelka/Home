#include"IntVector.h"
int& IntVector::operator[](size_t idx) {
	if(idx > this->_len){
		throw IndexOverflowException(idx);
	}
	return _vec[idx];
}
void IntVector::out() {
	for (size_t i = 0; i < this->_len; ++i) {
		std::cout << "Position" << i << ":" << _vec[i] << std::endl;
	}
}
void IntVector::klappt(size_t n) {
	delete[]_vec;
	this->_vec = new int[n];
	for (size_t i = 0; i < n; ++i) {
		this->_vec[i] = rand()%16;
	}
}
void IntVector::change(size_t n) {
	for (size_t i = 0; i < n; ++++i) {
		this->_vec[i] += 42;
	}
}
IntVector& IntVector::operator= (const IntVector& vec){
	if(this != &vec){
		delete [] _vec;
		_len = vec.size();
		_vec = new int [_len+1];
		for(size_t i = 0;i < _len;++i){
			_vec[i] = vec._vec[i];
		}
	}
	return *this;
}
IntVector::IntVector(const IntVector& vec){
	_len = vec.size();
	_vec = new int [_len+1];
	for(size_t i=0; i < _len;++i){
		_vec[i] = vec._vec[i];
	}
}
void copyassign(IntVector& V1){
	IntVector V2 (V1);
	IntVector V3 (N);
	V3.klappt(10);
	V3 = V2;
	std::cout<<"V1:"<<std::endl;
	V1.out();
	std::cout<<"V3:"<<std::endl;
	V3.out();
}

IntVector::~IntVector() {
	delete[]_vec;
}
void IntVector::crash(size_t n) {
	this->_vec = new int[n];
	std::vector<int> vec2 = create_randints(n, 0, 16);
	for (size_t i = 0; i < n; ++i) {
		this->_vec[i] = vec2[i];
	}
	this->out();

}
IntVector::Iterator IntVector::begin()const{
	return Iterator(&_vec[0]);
}
IntVector::Iterator IntVector::end()const{
	return Iterator(&_vec[_len+1]);
}
int& IntVector::Iterator::operator *(){
	return *_val;
}
IntVector::Iterator& IntVector::Iterator::operator++(){
	_val++;
	return *this;
}
bool IntVector::Iterator::operator ==(const Iterator& other)const{
	return _val == other._val;
}
bool IntVector::Iterator::operator!=(const Iterator& other)const{
	return _val != other._val;
}
