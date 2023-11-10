#include"lib.h"
#include<vector>
#include<string>
#include<cstring>
using namespace std;
//typedef struct{
//	char baf[8];
//	char* str;
//	int bol[10];
//
//}rec;
//class tmp {
//	char *_s;
//public:
//	tmp(const char *s) {
//		_s = new char[strlen(s)];
//		strcpy(_s, s);
//	}
//	~tmp() {
//		delete[] _s;
//	}
//	const char* gs() const {
//		return _s;
//	}
//	const char& gc(size_t i) const {
//		return _s[i];
//	}
//};
//class DieKlasse {
//private:
//	int _x;
//	const int _y;
//	char *_s;
//public:
//	DieKlasse(int x, int y, const char *s) :
//			_x { x }, _y { y } {
//		_s = new char(strlen(s));
//		strcpy(_s, s);
//	}
//	virtual void show() {
//		cout << _x << " " << _y << " " << _s << endl;
//	}
//};
//class EineUnterklasse: public DieKlasse {
//private:
//	char das_zeichen;
//public:
//	EineUnterklasse(char zeichen) :
//			DieKlasse(21, 22, "mega heger"), das_zeichen { zeichen } {
//	}
//	void show() {
//		cout << das_zeichen << " ";
//		DieKlasse::show();
//		cout << endl;
//	}
//};
//int main(int argc, char **argv) {
//	rec arr[6];
//	tmp a("Hallo");
//	cout << a.gs() << endl;
//	cout << a.gc(1) << endl;
//	EineUnterklasse b('c');
//	EineUnterklasse c('a');
//	EineUnterklasse d('b');
//	b.show();
//	c.show();
//	d.show();
//	int i = 0%2;
//	cout<<i<<endl;
//	char buf[8];
//	cout<<sizeof(buf)<<endl;
//	int lol[10];
//	cout<<sizeof(int*)<<endl;
//	cout<<sizeof(lol)<<endl;
//	cout<<sizeof(rec)<<endl;
//	auto p1 = &arr[3];
//	auto p2 = &p1->baf[5];
//	cout<<p1-&arr[0]<<endl;
//	cout<<(&arr[5].baf[2] - p2)<<endl;
//}
//
int main(int argc, char **argv) {
	char s[] = "Das ist ein Text";
	char* p = s + 6;
	*p = 's';
	char& ch = s[4];
	ch = 'e';
	cout<<s<<endl;
}
