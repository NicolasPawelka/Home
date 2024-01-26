#ifndef KAFFEEAUTOMAT_H
#define KAFFEEAUTOMAT_H

#include <QObject>
#include<QDebug>
#include<QThread>

class Kaffeeautomat:public QObject
{
    Q_OBJECT
public:
    Kaffeeautomat(QObject* parent = nullptr);
    Q_INVOKABLE bool makeKaffee(int heat,int grindTime,int waterTime,int waitingTime,int milkTime);

};

#endif // KAFFEEAUTOMAT_H
