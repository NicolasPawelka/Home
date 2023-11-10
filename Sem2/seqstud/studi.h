#include<iostream>
#include<fstream>
#include<string>
#include<cstring>
class Studi;
inline std::istream& operator>>(std::istream& in,Studi& s);
class Studi{
public:
	Studi();
	Studi(long matnr,std::string vorname="Max",std::string nachname="Mustermann");
	long get_matnr()const{return _matnr;}
	std::string get_vorname()const{return _vorname;}
	std::string get_nachname()const{return _nachname;}
	friend std::istream& operator>>(std::istream& in,Studi& s);


private:
	long _matnr;
	std::string _vorname;
	std::string _nachname;

};
inline std::ostream& operator<<(std::ostream& out,Studi s){
	out << s.get_matnr() << " " <<s.get_vorname()<<" "<<s.get_nachname();
	return out;

}
std::istream& operator>>(std::istream& in,Studi& s){
	in >> s._matnr;
	in >> s._vorname;
	in >> s._nachname;
	return in;
}
#ifndef STUDI_H_
#define STUDI_H_





#endif /* STUDI_H_ */
