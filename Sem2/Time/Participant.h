
#ifndef PARTICIPANT_H_
#define PARTICIPANT_H_
#include<iostream>
#include<vector>
#include<stdexcept>
#include<string>
#include"time.h"
class Participant{
public:
	Participant(const string name = "nobody",int std=0,int min=0,int sec=0){
		_name = name;
		a.add_hours(std/3600);
		a.add_minutes((min/60)%60);
		a.add_seconds(sec%60);
//		static int a =+ 1;
	}
	string name(){return _name;}
	Time geta() const {return a;}
	~Participant();
private:
	string _name;
	Time a;
};




#endif /* PARTICIPANT_H_ */
