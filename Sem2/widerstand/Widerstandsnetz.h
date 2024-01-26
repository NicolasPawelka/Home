
#ifndef WIDERSTAND_H_
#define WIDERSTAND_H_
#include<iostream>
#include"ooptoolg.h"
#include"ooptool.h"
class Netzwerk{
public:
	virtual ~Netzwerk(){}
	virtual double ohm() = 0;
};
class Resistor: public Netzwerk{
public:
	Resistor(double wert):_wert{wert}{};
	double ohm() override {return _wert;}
protected:
	double _wert;
};
class Parallel: public Netzwerk{
public:
	Parallel(Netzwerk* r1,Netzwerk* r2):_r1{r1},_r2{r2}{}
	double ohm()override {return (_r1->ohm() * _r2->ohm())/(_r1->ohm() + _r2->ohm());}
protected:
	Netzwerk* _r1;
	Netzwerk* _r2;
};
class Serial: public Netzwerk{
public:
	Serial(Netzwerk* r1,Netzwerk* r2):_r1{r1},_r2{r2}{}
	double ohm()override {return _r1->ohm() + _r2->ohm();}
protected:
	Netzwerk* _r1;
	Netzwerk* _r2;
};
class Poti : public Resistor{
public:
	Poti(double ohm):Resistor{ohm}{}
	void set_ohm (double ohm){_wert = ohm;}
};
#endif





