#include <QGuiApplication>
#include <QtQuick>
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>
#include <QSqlTableModel>
#include"user.h"
#include"database.h"
#include"listmodel2.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    QString dbPath = QCoreApplication::applicationDirPath() + "/mydb.db";
    DataBase::open(dbPath);
    if(!DataBase::createTableUser())
        qDebug()<<"Error";
    //qputenv("QML_XHR_ALLOW_FILE_READ", "1");
    User user;
    //qmlRegisterType<User>("user",1,0,"User");
    qmlRegisterType<DataBase>("database",1,0,"DataBase");
    qmlRegisterType<User>("user",1,1,"User");
    //qmlRegisterType<ListModel>("listmodel",1,0,"ListModel");
    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);
    listmodel2 lm2 ;
    engine->addImportPath(":/");
    engine->addPluginPath(":/");
    engine->addImportPath("../../plugin");
    engine->addPluginPath("../../plugin");
    engine->rootContext()->setContextProperty("user",&user);
    engine->rootContext()->setContextProperty("listModel2",&lm2);
    //engine->globalObject().setProperty("CppCreator",engine->newObject(&CppCreator::GetInstance()));
    engine->load(QUrl("qrc:/Main.qml"));
    //DataBase::close();


    return app.exec();
}
