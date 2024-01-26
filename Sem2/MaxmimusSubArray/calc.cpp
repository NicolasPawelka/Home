#include"lib.h"
using namespace std;
int maximum(std::vector<int> vec) {
	int sum = 0, max = 0;
	for (size_t i = 0; i < vec.size(); ++i) {
		sum += vec[i];
		if (sum > max) {
			max = sum;
		}
		if (sum < 0) {
			sum = 0;
		}
	}
	return max;
}
int maxrekur(std::vector<int> vec, size_t li, size_t re) {
	if (li == re) {
		return vec[li];
	}
	size_t mi = li+(re - li)/2;
	return max(maxrekur(vec,mi+1,re),maxrekur(vec,li,mi),maxkreuz(vec,li,mi,re));
//	int links = maxrekur(vec,li,mi);
//	int rechts = maxrekur(vec,mi+1,re);
//	int kreuz = maxkreuz(vec,li,mi,re);
}
int maxkreuz(std::vector<int>vec,size_t li, size_t mi,size_t re){
	int links = 0,sum = 0;
	for(size_t i = mi; i >= li -1; --i){
		sum += vec[i];
		if(sum > links){
			links = sum;
		}
	}
	int rechts = 0, sum2 = 0;
	for(size_t i = mi+1; i <= re; ++i){
		sum2 += vec[i];
		if(sum2 > rechts){
			rechts = sum2;
		}
	}
	return links + rechts;


}
int max(int a,int b,int c){
	if(a > b && a > c){
		return a;
	}
	if(b > a && b > c){
		return b;
	}
	return c;

}


