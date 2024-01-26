#ifndef NUMBERCONVERTER_H
#define NUMBERCONVERTER_H

#include<QObject>
#include<QString>
#include<QDate>


class Converter: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString bin READ getBin WRITE setBin NOTIFY binChanged )
    Q_PROPERTY(QString oct READ getOct WRITE setOct NOTIFY octChanged )
    Q_PROPERTY(QString dec READ getDec WRITE setDec NOTIFY decChanged )
    Q_PROPERTY(QString hex READ getHex WRITE setHex NOTIFY hexChanged )

    QString m_bin;
    QString m_oct;
    QString m_dec;
    QString m_hex;

  public:

    Converter(QObject* parent = nullptr);
    QString getBin()const{return m_bin;}
    QString getOct()const{return m_oct;}
    QString getDec()const{return m_dec;}
    QString getHex()const{return m_hex;}
    QString formatBin(QString& s);
    void update(int wert);
    void setBin(QString bin);
    void setOct(QString oct);
    void setDec(QString dec);
    void setHex(QString hex);
signals:
    void binChanged(QString bin);
    void octChanged(QString oct);
    void decChanged(QString dec);
    void hexChanged(QString hex);
};
#endif
