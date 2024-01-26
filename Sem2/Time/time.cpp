#include"time.h"
using namespace std;

void Time::add_hours(int n){
	_std += n;
	Time::check_time(_std,_min,_sec);
}
void Time::add_minutes(int n){
	int mGes = this->just_minutes();
		mGes += n;
		_std = mGes/60;
		_min = mGes%60;
	Time::check_time(_std, _min, _sec);


}
void Time::add_seconds(int n){
	int sGes = this->just_seconds();
	sGes += n;
	_std = sGes/3600;
	_min = (sGes/60)%60;
	_sec = sGes%60;
	Time::check_time(_std, _min, _sec);
}
void Time::add(Time& t2){
	int i = t2.just_seconds();
	this->add_hours(i/3600);
	this->add_minutes((i/60)%60);
	this->add_seconds(i%60);
	Time::check_time(_std, _min, _sec);
}
int Time::just_seconds(){
	return _std*3600 + _min*60 + _sec;
}
int Time::just_minutes(){
	return _std*60 + _min;
}
int Time::diff(Time& t1,Time& t2){
	return abs(t1.just_seconds() - t2.just_seconds());
}

void Time::check_time(int h, int m,int s){
	if (h < 0){
		_std=0;
		_min=0;
		_sec=0;
		throw std::runtime_error("Zeit negativ");
	}else;
	if (m < 0){
			_std=0;
			_min=0;
			_sec=0;
			throw std::runtime_error("Zeit negativ");
	}else;
	if (s < 0){
			_std=0;
			_min=0;
			_sec=0;
			throw std::runtime_error("Zeit negativ");
	}else;

}
