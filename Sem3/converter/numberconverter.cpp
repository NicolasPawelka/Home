#include"numberconverter.h"


Converter::Converter(QObject *parent):QObject(parent){}

void Converter::setBin(QString bin){
    bin.remove('.');
    bin.remove(' ');

    bool ok;
    int v = bin.toInt(&ok,2);

    if(ok){
        update(v);
    }
    else
    {
        emit binChanged(bin);
    }
}
void Converter::setDec(QString dec){
    dec.remove('.');
    dec.remove(' ');

    bool ok;
    int v = dec.toInt(&ok,10);

    if(ok)
    {
        update(v);
    }
    else
    {
        emit decChanged(dec);
    }
}
void Converter::setOct(QString oct){
    oct.remove('.');
    oct.remove(' ');

    bool ok;
    int v = oct.toInt(&ok,8);

    if(ok)
    {
        update(v);
    }
    else
    {
        emit octChanged(oct);
    }
}
void Converter::setHex(QString hex){
    hex.remove('.');
    hex.remove(' ');

    bool ok;
    int v = hex.toInt(&ok,16);

    if(ok)
    {
        update(v);
    }
    else
    {
        emit hexChanged(hex);
    }
}
void Converter::update(int wert){
    QString bin = QString::number(wert,2);
    QString dec = QString::number(wert,10);
    QString oct = QString::number(wert,8);
    QString hex = QString::number(wert,16);
    bin = formatBin(bin);
    if(m_bin != bin){
        m_bin = bin;
        emit binChanged(m_bin);
    }
    if(m_dec != dec){
        m_dec = dec;
        emit decChanged(m_dec);
    }
    if(m_oct != oct){
        m_oct = oct;
        emit octChanged(m_oct);
    }
    if(m_hex != hex){
        m_hex = hex;
        emit hexChanged(m_hex);
    }




}
QString Converter::formatBin(QString& s){
    int counter = s.size() - 4;
    int diff = (s.size()%4);
    for(int i = counter; i > 0; i-=4){
        s.insert(i,'.');
    }
    if(diff > 0){
        diff = 4 - diff;
        for(int j = 0; j < diff; ++j){
            s.push_front('0');
        }
    }

    return s;
}


