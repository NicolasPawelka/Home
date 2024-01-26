/**
 * @brief This is a class which represents a fracture.
 * 
 * Class holds internally a counter and a denominator both are integer.
 * 
 * @ingroup GroupName
 */

#ifndef Bruch_H_
#define Bruch_H_
class Bruch {
public:
/**
 * @brief Constructor for class
 * Constructor gets counter and denominator evalutes greatest common divisor and 
 * checks if the denominator is greater then zero.
 * 
 * @param[in] z counter if no value is given it is 0 per default
 * @param[in, out] n denominator if no value is given it is 1 per default
 * 
 * @note Diese Klasse wurde zu Demo Zwecken erstellt.
 * @code 
 * int var = 0;
 * 
 *  @endcode
 * Notizen dienen als Hinweise oder Erklärungen zu den dargestellten Funktionen.
 * 
 * @code
 * 	Bruch(int z = 0, int n = 1) {
 * 		int var = 0;
 * 
 * 		if (cond == false ||
 * 			cond2 == true)
 * 		{
 * 
 * 		}
 * 	}
 * Bruch(int z = 0, int n = 1) {
    int var = 0;
 
    if (cond == false ||
        cond2 == true)
    {
 
    }
}

 * @endcode
 * 
 * @warning Warnings dienen dazu Entwickler auf potentielle Probleme und Fehler hinzuweisen!
 * 
 * @deprecated Dieser Abschnitt weist auf veraltete Funktionen hin.
 * 
 */
	Bruch(int z = 0, int n = 1) :
			_nenner { n / ggt(z, n) }, _zaehler { z / ggt(z, n) } {
		if (_nenner == 0) {
			_nenner = 1;
		}
		if (_nenner < 0) {
			_nenner *= -1;
			_zaehler *= -1;
		} else
			;

	}
	int nenner() const {
		return _nenner;
	}
	int zaehler() const {
		return _zaehler;
	}
	/**
	 * @brief Copy Constructor 
	 * @return Object 
	 * @code
	 * Bruch& operator ==(const Bruch& b){
	 * 		float b = 12;
	 * 		return true;
	 * }
	 * @endcode
	 */
	Bruch& operator*= (const Bruch& b){
		this->_zaehler *= b._zaehler;
		this->_nenner *= b._nenner;
		int a = ggt(_zaehler, _nenner);
		this->_zaehler = this->_zaehler/a;
		this->_nenner = this->_nenner/a;
		return *this;
	}
	/**
 * @brief Inline Function to determine the greatest common divisor.
 * The Function gets the counter and denominator and determines the greatest common 
 * divisor.
 * @param a = counter
 * @param b = denominator
 * @return Greatest common divisor
 * 
 * @bug Dies ist ein Beispiel Bug
 * 
 * @code
 * int var = 0;
 * @endcode
 */
inline int ggt(int a, int b) {
	while (a != 0) {
		a %= b;
	}
	return b;
}
private:
	int _nenner;
	int _zaehler;
};
inline Bruch operator*(const Bruch &b, const Bruch &c) {
	Bruch ret(b.zaehler() * c.zaehler(), b.nenner() * c.nenner());
	return ret;

}
inline int operator==(const Bruch &b, const Bruch &c) {
	float b1 = b.zaehler() / b.nenner();
	float b2 = c.zaehler()/c.nenner();
	if (b1 == b2) {
		return true;
	} else
		return false;

}
inline int operator!=(const Bruch &b,const Bruch& c){
		float b1 = b.zaehler()/b.nenner();
		float b2 = c.zaehler()/c.nenner();
		if (b1 != b2){
			return true;
		}else
			return false;
}


#endif /* Bruch_H_ */
