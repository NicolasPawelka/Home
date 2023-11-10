#ifndef USER_H
#define USER_H

#include<QString>
#include <QObject>
#include<QtCore>

class User : public QObject{

    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged);
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged);
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(float credit READ credit WRITE setCredit NOTIFY creditChanged);
    Q_PROPERTY(float to_pay READ to_pay WRITE setTo_pay NOTIFY to_payChanged);
    Q_PROPERTY(int kaffee READ kaffee WRITE setKaffee NOTIFY kaffeeChanged);
    Q_PROPERTY(bool isAdmin READ isAdmin WRITE setIsAdmin NOTIFY isAdminChanged);

    QString m_name;
    QString m_email;
    QString m_password;
    float m_credit;
    float m_to_pay;
    int m_kaffee;
    bool m_isAdmin;
public:
    User(QObject *parent = nullptr);
    QString name()const{return m_name;}
    QString email()const{return m_email;}
    QString password()const{return m_password;}
    float credit()const{return m_credit;}
    float to_pay()const{return m_to_pay;}
    int kaffee()const{return m_kaffee;}
    bool isAdmin()const{return m_isAdmin;}

public slots:
     void setName(QString name);
     void setEmail(QString email);
     void setPassword(QString password);
     void setCredit(float credit);
     void setTo_pay(float to_pay);
     void setKaffee(int kaffee);
     void setIsAdmin(bool isAdmin);
signals:
    void nameChanged(QString name);
    void emailChanged(QString email);
    void passwordChanged(QString password);
    void creditChanged(float credit);
    void to_payChanged(float to_pay);
    void kaffeeChanged(int kaffee);
    void isAdminChanged(bool isAdmin);
};

#endif // USER_H
