
#ifndef CIRCLE_H_
#define CIRCLE_H_
#include<iostream>
#include<vector>
#include<cmath>
#include"ooptool.h"
#include"ooptoolg.h"
#include"GraphicObject.h"
class Circle: public GraphicObject {
public:
	Circle(int x, int y, int r):center_x{x},center_y{y},radius{r}{}
	void paint() override{}
	bool is_in(int x, int y)override{
		int diffx = center_x - x;
		int diffy = center_y - y;
		int d = sqrt(pow(diffx,2)+ pow(diffy,2));
		return (d > radius);
	}
protected:
	int center_x, center_y, radius;
};




#endif /* CIRCLE_H_ */
