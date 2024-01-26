#include<sys/resource.h>
#include<sys/time.h>
#include<cstdlib>
#include<string>
#include<cstring>
#include<iostream>
#include<stdlib.h>
using namespace std;

struct timeval start;
struct timeval ende;
struct rusage usage;
struct rusage usage_ende;

double diffUserTime(struct rusage start , struct rusage end){
    return end.ru_utime.tv_usec - start.ru_utime.tv_usec;
}

double diffSystemTime(struct rusage start, struct rusage end){
    return end.ru_stime.tv_usec - start.ru_stime.tv_usec;
}

double runtime(struct timeval start , struct timeval end){
    return end.tv_sec - start.tv_sec;
}


int main(int argc, char* argv[]){
    string input = "";
    for(int i = 1; i < argc; ++i){ 
        input = input +" "+ argv[i];
    }
    char* command = new char[input.length()+1];
    strcpy(command, input.c_str());

    gettimeofday(&start, nullptr);
    getrusage(RUSAGE_CHILDREN,&usage);
    system(command);
    getrusage(RUSAGE_CHILDREN,&usage_ende);
    gettimeofday(&ende, nullptr);

    cout << "Command:" << input << endl;
    cout << "Laufzeit:" << " " << runtime(start,ende)<<endl;
    cout << "User- Zeit:" << " "<< diffUserTime(usage,usage_ende)/1000000<<endl;
    cout << "System- Zeit: " << " " << diffSystemTime(usage,usage_ende)/1000000<<endl;

    delete[] command;
    return 0;
}