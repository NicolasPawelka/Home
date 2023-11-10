#include"lib.h"
#include"ooptool.h"

bool setzen(int dame, int reihe, int *vec) {
	for(int i = 0; i < dame; i++){
		if(vec[i] == reihe){
			return false;
		}
	}

}
void setz(int dame, int n, int *vec) {
	for(int j = 0; j < n; ++j){
		if(setzen(dame,j,vec)){
			vec[dame]=j;
			if(dame==n){
				out(vec,n);
			}else{
				setz(dame+1,n,vec);
			}
		}
	}
}
void out(int *vec, int n) {
	for (int i = 0; i < n; ++i) {
		for(int j = 0; j < n;++j){
			if(j==vec[i]){
				std::cout<<"* "<<std::endl;
			}else
				std::cout<<"  "<<std::endl;
		}
	}
}

