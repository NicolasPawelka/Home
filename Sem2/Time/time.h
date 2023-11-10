#ifndef TIME_H_
#define TIME_H_
#include<iostream>
#include<vector>
#include<stdexcept>
class Time{
public:
	Time(int h=0,int m=0,int s=0){
		_std=h;
		_min=m;
		_sec=s;
	}
	int hour() const {return _std;}
	int minute ()const {return _min;}
	int second ()const {return _sec;}
	int just_seconds();
	int just_minutes();
	int diff (Time& t1,Time& t2);
	void add_hours (int n);
	void add_minutes (int n);
	void add_seconds (int n);
	void add(Time& t2);
	void check_time (int h,int m,int s);

private:
	int _std;
	int _min;
	int _sec;
};
#endif /* TIME_H_ */
