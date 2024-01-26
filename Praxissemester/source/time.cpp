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
int Time::just_seconds(){
	return _std*3600 + _min*60 + _sec;
}

int Time::just_minutes(){
	return _std*60 + _min;
}