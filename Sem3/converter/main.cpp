#include <QGuiApplication>
#include <QtQuick>
#include"numberconverter.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    Converter* c = new Converter;

    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);
    engine->addImportPath(":/");
    engine->rootContext()->setContextProperty("converter",c);
    engine->load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
