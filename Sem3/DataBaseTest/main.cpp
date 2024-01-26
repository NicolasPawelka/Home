#include <QGuiApplication>
#include <QtQuick>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
QSqlDatabase db;
void addValues(QString name, QString email, QString password);
void readUser( QString name);
void changeValues(QString name, QString password);
void readUser2(QString passwort);

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    qDebug()<<"start";
    db = QSqlDatabase::addDatabase("QSQLITE");
    QString dbPath = QCoreApplication::applicationDirPath() + "/mydb.db";
    db.setDatabaseName(dbPath);

    if(!db.open()){
        qDebug()<<"problem opening database";
    }

    if(!db.tables().contains("user")){

    QString s = "create table user (name varchar(100) primary key, email varchar(100), password varchar(100))";

    QSqlQuery query(db);

    if(!query.exec(s)){

        qDebug()<<"Error creating table";
    }
}
    addValues("Nicolas Pawelka","pawelka12@gmail.com","hallo");
    addValues("Till Merdian","merdian@gmail.com","servus");
    addValues("Cosima Giesel","C.giesselgmx.net","Moin");
    readUser("Cosima Giesel");
    changeValues("Nicolas Pawelka","1234");
    readUser2("NeuesPasswort");
    db.close();
    qDebug()<<"end";
    return app.exec();
}
void addValues(QString name, QString email, QString password){
    QSqlQuery query;

    query.prepare("INSERT INTO user(name, email,password)  VALUES (:name, :email, :password)");
    query.bindValue(":name",name);
    query.bindValue(":email",email);
    query.bindValue(":password",password);
   // query.bindValue(":birthdate",QDateTime::fromString(birthdate,"dd-mm-yyyy"));

    if(!query.exec()){

        qDebug()<<"adding Values failed";
    }


}
void readUser( QString name) {
    QSqlQuery query;
    query.prepare("SELECT * FROM user WHERE name = :name");
    query.bindValue( ":name", name );
    if (query.exec()) {
        if (query.next()) {
            // ID exists
            qDebug() << "name exists";
        } else {
            // ID doesn't exist
            qDebug() << "name does not exitst";
        }
    } else {
        // Query execution failed
        qDebug() << "Query execution failed: ";
    }
}
void readUser2(QString passwort){
    QSqlQuery query;
    query.prepare("SELECT * FROM user WHERE password = :passwort");
    query.bindValue(":passwort",passwort);
    if (query.exec()) {
        if (query.next()) {
            // ID exists
            qDebug() << "passwort exists";
        } else {
            // ID doesn't exist
            qDebug() << "passwort does not exitst";
        }
    } else {
        // Query execution failed
        qDebug() << "Query execution failed: ";
    };

}
void changeValues(QString name, QString newPasswort){
    QSqlQuery query;
    query.prepare("UPDATE user SET password = :newPasswort WHERE name = :name");
    query.bindValue(":newPasswort",newPasswort);
    query.bindValue(":name", name);
    if(!query.exec())
        qDebug()<<"Update failed";


}
