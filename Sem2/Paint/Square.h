
#ifndef SQUARE_H_
#define SQUARE_H_
#include<iostream>
#include<vector>
#include<cmath>
#include"ooptool.h"
#include"ooptoolg.h"
#include"GraphicObject.h"
class Square: public GraphicObject {
public:
	Square(int left, int top, int width) :
			_left { left }, _top { top }, _width { width } {
	}
	void paint() override{
		;
	}
	bool is_in(int x, int y) override{
		return(_top < y&&y < _top + _width &&
				_left < x&&x < _left + _width);
	}

protected:
	int _left, _top, _width;
};




#endif /* SQUARE_H_ */
