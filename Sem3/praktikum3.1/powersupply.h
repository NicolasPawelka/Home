#ifndef POWERSUPPLY_H
#define POWERSUPPLY_H

#include<QObject>

class PowerSupply : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float voltage READ voltage WRITE setVoltage NOTIFY voltageChanged)
    Q_PROPERTY(float current READ current WRITE setCurrent NOTIFY currentChanged)
    Q_PROPERTY(float power READ power  NOTIFY powerChanged)
    Q_PROPERTY(float maxpower READ maxpower WRITE setMaxpower NOTIFY maxpowerChanged)
    float m_voltage;
    float m_current;
    float m_maxpower;


public:
    PowerSupply(QObject *parent = nullptr);
    float voltage()const{return m_voltage;}
    float current()const{return m_current;}
    float power()const{return voltage() * current();}
    float maxpower()const{return m_maxpower;}


public slots:
    void setVoltage(float voltage);
    void setCurrent(float current);
    void setMaxpower(float maxPower);
signals:
    void voltageChanged (float voltage);
    void currentChanged(float current);
    void powerChanged ();
    void maxpowerChanged();
};
#endif // POWERSUPPLY_H
