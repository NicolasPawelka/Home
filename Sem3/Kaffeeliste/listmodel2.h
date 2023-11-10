#ifndef LISTMODEL2_H
#define LISTMODEL2_H

#include <QObject>
#include<QQmlListProperty>
#include<QList>
#include"user.h"
#include"database.h"

typedef QList<User*> UserList;

class listmodel2 : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<User> userlist READ userlist NOTIFY userlistChanged);

    UserList m_UserList;
public:
    listmodel2(QObject* parent = nullptr);
    QQmlListProperty<User> userlist();
public slots:
    void add(QString name,QString email,QString password,bool isAdmin);
    bool isEmpty();
    bool deletUser(QString name);
    int findUser(QString name);
    bool checkUser(QString name);
    bool password(QString name,QString password);
    bool passwordVerify(int,QString);
    void change2(int i,double pay);
    void addCash(int i,double cash);
    void update();

signals:
    void userlistChanged();
};

#endif // LISTMODEL2_H
