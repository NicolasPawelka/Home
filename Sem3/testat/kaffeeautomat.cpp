#include "kaffeeautomat.h"

Kaffeeautomat::Kaffeeautomat(QObject* parent):QObject(parent)
{

}
bool Kaffeeautomat::makeKaffee(int heat,int grindTime,int waterTime,int waitingTime,int milkTime){
    qDebug()<<"Heat: "<<heat;
    qDebug()<<"grindTime: "<<grindTime;
    QThread::sleep(grindTime);
    qDebug()<<"waterTime: "<<waterTime;
    QThread::sleep(waterTime);
    qDebug()<<"waitingTime: " <<waitingTime;
    QThread::sleep(waitingTime);
    qDebug()<<"milkTime: "<<milkTime;
    QThread::sleep(milkTime);
    qDebug()<<"Bitte schön";
	qDebug()<<"Kaffe fertig";
    return true;


}
