#include"lib.h"
int main(int argc, char **argv) {
std::vector<int>vec{1,2,3,4,5,6,7,7,7,10};
std::list<int>lis(vec.size());
std::vector<double>vec1{1.2,2.4,3.4,5.6,4.1};
std::cout<<my::count(vec.begin(),vec.end(),7)<<std::endl;
std::cout<<my::count_if(vec.begin(), vec.end(),my::fun)<<std::endl;
copy(vec.begin(),vec.end(),lis.begin());
std::cout<<my::count(lis.begin(),lis.end(),7)<<std::endl;
std::cout<<my::count_if(lis.begin(), lis.end(),my::fun)<<std::endl;
std::cout<<my::count(vec1.begin(),vec1.end(),1.2)<<std::endl;
}




