#ifndef MYTHREAD_H
#define MYTHREAD_H
#include<QThread>

class MyThread:public QThread{
    Q_OBJECT
    Q_PROPERTY(QString result READ result WRITE setResult NOTIFY resultChanged)
    QString m_result;
public:
    QString result()const{return m_result;}
    void setResult(QString result);
    void run()
    {
        double e = 0.0;

        for(int i = 170; i >= 0; --i){
            e += 1/fak(i);
        }
        QString result = QString::number(e,'g',70);
        m_result = result;
        emit resultChanged(m_result);
    }
    double fak ( int n )
    {
        if (n<2)
            return 1;

        return n * fak (n-1);
    }
signals:
    void ergebnis(QString result);
    void resultChanged(QString result);


};

#endif // MYTHREAD_H
