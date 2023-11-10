#include "database.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include "user.h"
#include <QDebug>

QSqlDatabase DataBase::_dB;

/**
 * @brief DataBase::DataBase
 */
bool DataBase::open(QString dbPath) {
    _dB = QSqlDatabase::addDatabase("QSQLITE");
    _dB.setHostName("localhost");
    _dB.setDatabaseName(dbPath);
    _dB.setUserName("root");
    _dB.setPassword("");
    if(!_dB.open()){
        qDebug()<<"Error opening database";
    }
    return _dB.open();
}

void DataBase::close() {
    _dB.close();
}

bool DataBase::createTableUser() {
    QSqlQuery query(_dB);
    return query.exec("create table user (name varchar(100) primary key, email varchar(100), password varchar(100), credit float, to_pay float, kaffee int,isAdmin bool)");
}

void DataBase::addUser(User* u) {
    QSqlQuery query;
    query.prepare("INSERT INTO user (name, email, password, credit, to_pay, kaffee, isAdmin) VALUES (:name, :email, :password, :credit, :to_pay, :kaffee, :isAdmin)");
    query.bindValue( ":name", u->name());
    query.bindValue( ":email", u->email());
    query.bindValue( ":password", u->password());
    query.bindValue(":credit", u->credit());
    query.bindValue(":to_pay", u->to_pay());
    query.bindValue(":kaffee", u->kaffee());
    query.bindValue(":isAdmin", u->isAdmin() ? 1 : 0);
    qDebug()<<u->isAdmin();
    if(!query.exec()){
         qDebug()<<"Adding User failed";
    }
}


void DataBase::changeUser(User* u) {
    qDebug()<<"Start Update";
    QString name = u->name();
    int newKaffee = u->kaffee();
    float newCredit = u->credit();
    float NewTo_pay = u->to_pay();
    QSqlQuery query;
    query.prepare("UPDATE user SET credit = :newCredit, to_pay = :newTo_pay,kaffee = :newKaffee,isAdmin = :isAdmin WHERE name = :name");
    query.bindValue(":newCredit",newCredit);
    query.bindValue(":newTo_pay",NewTo_pay);
    query.bindValue(":newKaffee",newKaffee);
    query.bindValue(":name",name);
    query.bindValue(":isAdmin", u->isAdmin() ? 1 : 0);
    qDebug()<<u->isAdmin();
    if(!query.exec())
        qDebug()<<"User update failed";
    qDebug()<<"End Update";
}

bool DataBase::readUser( QString name, User& u ) {
    QSqlQuery query(_dB);
    query.prepare("SELECT name, email, password, credit, to_pay, kaffee FROM user WHERE name = :name");
    query.bindValue( ":name", name );
    bool ok = query.exec();
    ok = ok && query.first();
    readUser( query, u );
    return ok;
}

void DataBase::readUser( QSqlQuery& q, User& u ) {
    u.setName(q.value( 0 ).toString());
    u.setEmail(q.value( 1 ).toString() );
    u.setPassword(q.value( 2 ).toString() );
    u.setCredit(q.value(3).toFloat());
    u.setTo_pay(q.value(4).toFloat());
    u.setKaffee(q.value(5).toInt());
}

bool DataBase::readAllUser(QList<User*> &list ) {
    QSqlQuery query;
    query.prepare("SELECT * FROM user;");

    bool result = query.exec();
    result = result && query.first();

    if ( result == false )
        return false;
    do {
        User* u = new User();
        readUser( query, *u );
        list.push_back( u );
    } while( query.next() );

    return result;
}
bool DataBase::deleteUser(QString name){
     QSqlQuery query(_dB);
     query.bindValue(":name",name);
     query.prepare("DELETE FROM user WHERE name = :name");
    return query.exec();
}
