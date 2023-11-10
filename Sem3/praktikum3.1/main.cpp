#include <QGuiApplication>
#include <QtQuick>
#include"powersupply.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    QPointer p1 = new PowerSupply;
    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);

    engine->addImportPath(":/");
    engine->rootContext()->setContextProperty("powersupply",p1);
    engine->load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
