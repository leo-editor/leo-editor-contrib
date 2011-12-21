#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QDeclarativeContext>
#include "leoqdb.h"
#include "leomodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    LeoEngine* mdl = new LeoEngine;
    viewer.rootContext()->setContextProperty("leoEngine", mdl);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/leoqviewer/main.qml"));
    viewer.showExpanded();

    //LeoqDb* db = new LeoqDb();
    //db->openDb("/home/ville/treefrag.db");
    //db->childNodes(0);

    return app.exec();
}
