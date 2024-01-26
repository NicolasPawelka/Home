#include"Point.h"
#include"Line.h"
using namespace std;
Point& Point::operator+= (const Point& p){
	this->_x += p._x;
	this->_y += p._y;
	return *this;
}
Line& Line::operator+= (const Point& p){
	this->_start._x += p.get_x();
	this->_start._y += p.get_y();
	this->_end._x += p.get_x();
	this->_end._y += p.get_y();
	return *this;
}






