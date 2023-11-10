#include <iostream>
using namespace std;

int main() {
  volatile long len = 1000000000;

  double sum = 0.0;
  for (long i = 0; i < len; i++) {
    sum = sum + (double)i;
  }
  cout << sum << endl;
  return 0;
}
