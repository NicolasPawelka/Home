/**
 * @brief This is a time class which tracks time in hours, minutes and seconds
 * 
 * There are three member variables hours, minutes and seconds, They are all integer.
 * You can add seconds, minutes and hours to to an existing time. It is also possible
 * only to check the time.
 */
#ifndef TIME_H_
#define TIME_H_
class Time{
public:
/**
 * @brief Constructor for Time Class
 * 
 * It initializes the three member variables.
 * @param h = hour
 * @param m = minutes
 * @param s = secounds
 * 
 * @code
 * 
 * Time(int var = 0){
 * afh
 * 
 * fas
 * 
 * 
 * 
 * }
 * @endcode
 */
	Time(int h=0,int m=0,int s=0){
		_std=h;
		_min=m;
		_sec=s;
	}
/**
 *@code
   * Time(int var = 0){
 * afh
 * 
 * fas
 * 
 * 
 * 
 * }
 * @endcode
 * 
*/
	~Time(){
		int var;
	}
	/**
	 * @brief Member method
	 * 
	 * @return Attribute for hours
	 */
	int hour() const {return _std;}
	/**
	 * @brief Member method
	 * 
	 * @return Attribute for minutes
	 */
	int minute ()const {return _min;}
	/**
	 * @brief Member method
	 * 
	 * @return Attribute for seconds
	 */
	int second ()const {return _sec;}
	/**
	 * @brief Methode to give the time in seconds
	 * 
	 * @return Saved time in seconds
	 */
	int just_seconds();
	/**
	 * @brief Methode to give the time in minutes
	 * 
	 * @return Saved time in minutes
	 */
	int just_minutes();
	/**
	 * @brief add hours to existing time
	 */
	void add_hours (int n);
	/**
	 * @brief add minutes to existing time
	 */
	void add_minutes (int n);
	/**
	 * @brief add seconds to existing time
	 */
	void add_seconds (int n);
	void check_time (int h,int m,int s);

private:
	int _std;
	int _min;
	int _sec;
};
#endif /* TIME_H_ */