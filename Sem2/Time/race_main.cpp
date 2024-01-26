//using namespace std;
//#include"time.h"
//#include"Participant.h"
//#include"ooptool.h"
//
//
//
//int main(int argc, char **argv) {
//	argsp_t argsp(argc, argv);
//	vector <Participant> teilnehmer;
//	string gewinner;
//	vector <string> namen  = argsp.positionals();
//	vector<int> vec = create_randints(namen.size(), 0, 1000);
//	int z = namen.size();
//	int max = 1001;
//	int std,min,sec;
//	for (int i=0;i < z; ++i) {
//		string name = namen[i];
//		Participant P1 (name, vec[i],vec[i],vec[i]);
//		teilnehmer.push_back(P1);
//		cout<<P1.name()<<":"<<P1.geta().hour()<<"h."<<P1.geta().minute()<<"m."<<P1.geta().second()<<"s."<<endl;
//		if(P1.geta().just_seconds() < max){
//			max = P1.geta().just_seconds();
//			gewinner = P1.name();
//			std = P1.geta().hour();
//			min = P1.geta().minute();
//			sec = P1.geta().second();
//
//		}
//
//	}
//	cout<<"Die Anzahl der Teilnehmer betrug:"<<argc-1<<endl;
//	cout<<"Der Gewinner ist: "<<gewinner<<" mit einer Zeit von: "<<std<<"h."<<min<<"m."<<sec<<"s."<<endl;
//
//
//}




