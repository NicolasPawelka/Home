#include"semops.h"
using namespace std;

my_sem::my_sem(int value){
    count = value;
}

void my_sem::wait(){
    std::unique_lock<std::mutex>lk (mtx);
    cond.wait(lk, [this] {return count > 0;});
    count--;
    lk.unlock();
}

void my_sem::post(){
    mtx.lock();
    count++;
    mtx.unlock();
    cond.notify_all();
}

my_sem::~my_sem()
{
   ; 
}