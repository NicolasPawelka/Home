#include<iostream>
#include<cstdlib>
#include<pthread.h>
#include<thread>
#include"sort_merge.h"
#define LEN 1000000
using namespace std;

void out(int* vec,int size){
    for(int i = 0; i < size; ++i) {
        cout<<vec[i]<< " "; 
    }
    cout<<endl;
}


int main(){
    int* vec_unsortiert = new int[LEN];
    int* vec_sortiert = new int[LEN]{0}; 
    for(size_t i = 0; i < LEN; ++i){
        vec_unsortiert[i] = rand()%LEN;
    }
    thread t1(quickSort,vec_unsortiert,0,LEN/2-1);
    thread t2(quickSort,vec_unsortiert,LEN/2,LEN-1);
    t1.join();
    t2.join();
    merge(vec_unsortiert,vec_sortiert,LEN);
}