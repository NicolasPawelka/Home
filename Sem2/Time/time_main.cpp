#include"time.h"
using namespace std;



int main(int argc, char **argv) {
	Time T1(18,26,39);
	Time T2(17,40,26);
	T1.add(T2);
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	T1.add_minutes(1810);
	T1.add_seconds(-3240);
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	T2.add_minutes(-378);
	T2.add_seconds(5000);
	T1.add_minutes(5267);
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	T1.add_minutes(-794);
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	T1.add_seconds(-3401);
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	T1.add(T2);
	cout<<T2.hour()<<"h."<<T2.minute()<<"m."<<T2.second()<<"s."<<endl;
	cout<<T1.hour()<<"h."<<T1.minute()<<"m."<<T1.second()<<"s."<<endl;
	cout<<T1.just_seconds()<<endl;
	cout<<T2.just_seconds()<<endl;
	cout<<T1.diff(T2, T1)<<endl;
}


