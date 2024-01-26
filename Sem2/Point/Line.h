
#ifndef LINE_H_
#define LINE_H_
#include"Point.h"
class Line{
public:
	Line(Point a,Point b):
		_start{a},_end{b}{}
	Point get_start()const{return _start;}
	Point get_end()const{return _end;}
	Line& operator+= (const Point& p);



private:
	Point _start;
	Point _end;
};
inline float operator== (const Line& a,const Line& b){
	if(a.get_start()==b.get_start()){
		if(a.get_end()==b.get_end()){
			return true;
		}else
			return false;
	}else
		return false;


}




#endif /* LINE_H_ */
