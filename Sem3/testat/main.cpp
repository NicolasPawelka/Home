#include <QGuiApplication>
#include <QtQuick>
#include"kaffeeautomat.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    Kaffeeautomat k;
    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);
    engine->addImportPath(":/");
    engine->rootContext()->setContextProperty("Automat",&k);
    engine->load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
