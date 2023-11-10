#include"studi.h"
using namespace std;
Studi::Studi() {
	_matnr = 0;
	_vorname = "Max";
	_nachname = "Mustermann";
}
Studi::Studi(long matnr, std::string vorname, std::string nachname) :
		_matnr { matnr }, _vorname { vorname }, _nachname { nachname } {
};


