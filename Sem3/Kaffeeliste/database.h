#ifndef DATA_BASE_H
#define DATA_BASE_H

#include <qobject.h>
#include <qstring.h>
#include <QDate>

class QSqlDatabase;
class QSqlQuery;
class User;

class DataBase : public QObject {

    Q_OBJECT

    static QSqlDatabase _dB;

    static void readUser( QSqlQuery& q, User& u );

    DataBase();
public:
    static bool open(QString dbPath);
    static void close();

    static bool createTableUser();
    static bool createTableCoffee();
    static bool createTableOrder();
    static void addUser(User* u);
    static void changeUser(User* u);
    static bool readUser( QString name, User& u );
    static bool readAllUser( QList<User*>& list );
    static bool deleteUser(QString name);
};

#endif // DATA_BASE_H
