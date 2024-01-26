
#ifndef LIB_H_
#define LIB_H_
#include<iostream>
#include<cstring>
#include<map>
#include<list>
#include<memory>
using std::cout;
using std::endl;
class Fahrzeug{
public:
	virtual ~Fahrzeug(){}
	virtual void fahren()=0;
};
class Rennwagen : public Fahrzeug {
 public:
 void fahren() override {
 cout << "Vroooooom." << endl;
 }
 };

 class Traktor : public Fahrzeug {
 public:
 void fahren() override {
 cout << "tuktuktuktuktuk." << endl;
 }
 };





#endif /* LIB_H_ */
