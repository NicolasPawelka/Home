/**
 * @brief This is a test class to show what doxygen does
 * 
 * It contains four attributes which are one int, one float, one char and
 * one int array
 */



class Test{
    /**
     * @brief This is an integer
     */
    int test1;
    /**
     * @brief This is a float
     */
    float test2;
    /**
     * @brief This is a char
     */
    char test3;
    /**
     * @brief This is a integer pointer
     */
    int* test4;
public:
    /**
     * @brief This is the constructor of the class
     * 
     * It initializes all member attributes and creates an int array
     * @param a is for test1
     * @param b is for test2
     * @param c is for test3
     * @param d is the size of the int array
     */
    Test(int a, float b, char c,int d): test1(a) , test2(b), test3(c){
        test4 = new int [d];
        for(int i = 0; i < d; ++i){
            test4[i] = 0;
        }
    }
    /**
    * @brief Destructor for Test class
    * Deletes test4 array
    */
    ~Test(){};
    /**
     * @brief returns the value of test1
     */
    int test1()const {return test1;}
    /**
     * @brief returns the value of test2
     */
    float test2()const{return test2;}
    /**
     * @brief returns the value of test3
     */
    char test3()const{return test3;}
};