#include <QGuiApplication>
#include <QtQuick>

int main(int argc, char* argv[])
{
    qputenv("QML_XHR_ALLOW_FILE_READ", "1");
    QGuiApplication app(argc, argv);

    QScopedPointer<QQmlApplicationEngine> engine(new QQmlApplicationEngine);
    engine->addImportPath(":/");
    engine->addPluginPath(":/");
    engine->addImportPath("../../plugin");
    engine->addPluginPath("../../plugin");

    engine->load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
