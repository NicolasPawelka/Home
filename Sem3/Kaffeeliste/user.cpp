#include "user.h"


User::User(QObject *parent):QObject (parent),m_name("Max Mustermann"),m_email("maxmustermann@mail.de"),m_credit(0.0f),m_to_pay(0.0f),m_kaffee(0){}

void User::setName(QString name){
    if(name == m_name)
        return;
    m_name = name;
    emit nameChanged(m_name);

}

void User::setEmail(QString email){
    if(email == m_email)
        return;
    m_email = email;
    emit emailChanged(m_email);
}
void User::setCredit(float credit){
    if(qFuzzyCompare(m_credit,credit))
        return;
    m_credit = credit;
    emit creditChanged(m_credit);
}
void User::setTo_pay(float to_pay){
    if(qFuzzyCompare(m_to_pay,to_pay))
        return;
    m_to_pay = to_pay;
    emit to_payChanged(m_to_pay);
}
void User::setPassword(QString password){
    if(m_password == password)
        return;
    m_password = password;
    emit passwordChanged(m_password);
}
void User::setKaffee(int kaffee){
    if(m_kaffee == kaffee)
        return;
    m_kaffee = kaffee;
    emit kaffeeChanged(m_kaffee);
}
void User::setIsAdmin(bool isAdmin){
   if(m_isAdmin == isAdmin)
       return;
   m_isAdmin = isAdmin;
   emit isAdminChanged(m_isAdmin);

}










