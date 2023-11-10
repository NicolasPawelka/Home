#include"lib.h"
#include"ooptool.h"
using namespace std;

int main(int argc, char **argv) {
	vector<int> a = create_randints(10, 0, 100);
	sorta(a);
	int first_error;
	if ( !is_sorted(a, first_error)) {
	cout << "NOT SORTED: " << first_error << endl;
	}else{
		cout<<"sorted"<<endl;
	}

}





