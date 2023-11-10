
#ifndef LIB_H_
#define LIB_H_
#include<iostream>
#include<string>
#include<cstring>
class K{
private:
	long* c;
public:
	K(long a, long b ,long d){
		c = new long[3]{a,b,d};
	}
	long& getX()const{return c[0];}
	long& getX(){return c[0];}

};




#endif /* LIB_H_ */
