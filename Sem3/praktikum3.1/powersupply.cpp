#include "powersupply.h"
#include<QDebug>

PowerSupply::PowerSupply(QObject *parent): QObject(parent),m_voltage(0.0f),m_current(0.0f),m_maxpower(1.0f){}


void PowerSupply::setVoltage(float voltage){

    if(qFuzzyCompare(m_voltage,voltage))
        return;
    if(m_voltage == 0 && m_maxpower == 0)
        return;
    m_voltage = voltage;
    while(m_voltage * m_current > m_maxpower){
        m_voltage -= 0.1;
    }
    emit voltageChanged(m_voltage);
    emit powerChanged();
}
void PowerSupply::setCurrent(float current){
    if(qFuzzyCompare(m_current,current))
        return;
    if(m_current == 0 && m_maxpower == 0)
        return;
    m_current = current;
    while(m_current * m_voltage > m_maxpower){
        m_current -= 0.1;
    }
    emit currentChanged(m_current);
    emit powerChanged();
}
void PowerSupply::setMaxpower(float maxpower){
    if(qFuzzyCompare(m_maxpower,maxpower))
        return;
    if(maxpower == 0){
        m_voltage = 0;
        m_current = 0;
    }
    m_maxpower = maxpower;
    emit maxpowerChanged();
    emit currentChanged(m_current);
    emit voltageChanged(m_voltage);
}


