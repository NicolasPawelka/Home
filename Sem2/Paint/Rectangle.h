
#ifndef RECTANGLE_H_
#define RECTANGLE_H_
#include<iostream>
#include<vector>
#include<cmath>
#include"ooptool.h"
#include"ooptoolg.h"
#include"GraphicObject.h"
class Rectangle : public GraphicObject{
public:
	Rectangle(int left,int top,int xwidth,int ywidth):_left{left},_top{top},_xwidth{xwidth},_ywidth{ywidth}{}
	void paint()override{
		;
	}
	bool is_in (int x, int y)override{
		return(_top  < y && y < _top + _ywidth &&
				_left < x && x < _left + _xwidth);
	}
protected:
	int _left,_top,_xwidth,_ywidth;
};
#endif /* RECTANGLE_H_ */
