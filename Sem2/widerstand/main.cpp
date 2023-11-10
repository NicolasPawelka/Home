//#include"Widerstandsnetz.h"
//using namespace std;
//
//int main(int argc, char **argv) {
//	Resistor r1(100),r2(200),r3 (300);
//	Parallel par(r1, r2);
//	Serial ser(par, r3);
//	cout << "Netzwiderstand: " << ser.ohm()<<endl;
//	Resistor r4(100),r5(200),r6(300),r7(400);
//	Serial ser2(r4,r5);
//	Serial ser3(ser2,r6);
//	Parallel par2(ser3,r7);
//	cout<<"Netzwiderstand:"<<par2.ohm()<<endl;
//	for(double i = 0; i <= 600; i += 100){
//		Poti p1 (i);
//		Parallel par3(p1,r2);
//		Serial ser4(par3,r3);
//		cout<<"Netzwiderstand :"<<ser4.ohm()<<endl;
//	}
//
//}




