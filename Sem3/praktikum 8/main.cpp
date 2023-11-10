#include <QGuiApplication>
#include <QtQuick>
#include"MyThread.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);
    engine->addImportPath(":/");

    MyThread myThread ;

    engine->rootContext()->setContextProperty("myThread",&myThread);
    QObject::connect(&myThread,&MyThread::resultChanged,[&](QString ergebnis){qDebug()<<ergebnis;});
    engine->load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
