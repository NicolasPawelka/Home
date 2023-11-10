#ifndef Point_H_
#define Point_H_
#include<iostream>
#include"ooptool.h"
class Point {
public:
	Point(float x=0, float y=0) :
			_x {x}, _y {y} {
	}
	friend class Line;
	float get_x()const{return _x;}
	float get_y()const{return _y;}
	Point& operator+= (const Point& p);
private:
	float _x;
	float _y;
};
inline float operator== (const Point& a,const Point& b){
	if(a.get_x()==b.get_x()){
		if(a.get_y()==b.get_y()){
			return true;
		}else
			return false;
	}else
		return false;
}

#endif /* Point_H_ */
