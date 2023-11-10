#include"sort.h"
#include"ooptool.h"
using namespace std;
void std_sort(vector<int>& a) {
std::sort(a.begin(), a.end());
}
int main(int argc, char **argv) {
//	vector<int> test{4,5,-9,5,-10,9,8,-9,7,-6};
//	bucketSort(test);
	cout<<"std_sort"<<endl;
	check_sort(std_sort,true,true);
	cout<<"clever ? sort"<<endl;
	check_sort(bucketSort,true,true);
//	for(size_t z = 0; z < test.size(); ++z){
//		cout<<test[z]<<endl;
//	}
}





