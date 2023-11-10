#include"sort.h"
void bucketSort (std::vector<int> &vec){
	int max = 0,min = 0;
		size_t t = 0;
		for(size_t i = 0; i < vec.size(); ++i){
			if(vec[i] < min){
				min = vec[i];
			}else if(vec[i] > max){
			max =vec[i];
			}
		}
		std::vector<int>counter(max - min + 1);
		for(size_t i = 0; i < vec.size(); ++i){
			counter[vec[i] - min] += 1;
		}
		for(size_t j = 0; j < counter.size(); ++j){
			while(counter[j] > 0){
				vec[t] = min + j;
				counter[j] -= 1;
				t +=1;
			}
		}
}



