#include"ooptool.h"
#include"Sequence.h"
#include"studi.h"
Studi search(Sequence<Studi>& s,long matnr){
	for(size_t i = 0; i < s.cap();++i){
		if(s[i].get_matnr() == matnr){
			return s[i];
		}
	}
	return 0;

}



