#ifndef PAINT_H_
#define PAINT_H_
#include<iostream>
#include<vector>
#include<cmath>
#include"ooptool.h"
#include"ooptoolg.h"
class GraphicObject {
public:
	virtual ~GraphicObject(){}
	virtual void paint()=0;
	virtual bool is_in(int x, int y) = 0;
};

#endif /* PAINT_H_ */
