using namespace std;
#include"lib.h"
#include"ooptool.h"
//selection sort wow
void sorta(vector<int> &a) {
	size_t len = a.size();
	for (size_t i = 0; i < len - 1; ++i) {
		size_t min = i;
		for (size_t j = i + 1; j < len; ++j) {
			if (a[min] > a[j]) {
				min = j;
			}
		}
		if (min != i) {
			swap(a, min, i);
		}
	}

}
void sortb (vector <int>& a){
	size_t len = a.size();
	for(size_t i = 1; i < len; ++i){
		size_t j =i;
		while((j > 0) && (a[j-1] > a[j])){
			swap(a,j-1,j);
			j -=1;
		}
	}


}
void out(vector<int> a) {
	size_t len = a.size();
	for (size_t i = 0; i < len; ++i) {
		cout << a[i] << endl;
	}
}

