#include"IntVector.h"
int& IntVector::at(size_t idx) {
	if (idx > this->_len-1) {
			throw std::runtime_error("index out of range");
		} else
			return _vec[idx];
}
void IntVector::out() {
	for (size_t i = 0; i < this->_len; ++i) {
		std::cout << "Position" << i << ":" << _vec[i] << std::endl;
	}
}
void IntVector::klappt(size_t n) {
	delete[]_vec;
	_vec = new int[n];
	for (size_t i = 0; i < n; ++i) {
		_vec[i] = rand()%16;
	}
	this->out();

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

IntVector::~IntVector() {
	delete[]_vec;
}
