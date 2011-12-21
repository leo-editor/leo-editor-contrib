#ifndef LEOQDB_H
#define LEOQDB_H

#include <QObject>
#include <QSqlDatabase>
#include <QList>
#include "leonode.h"
#include <QVariantList>

class RoleItemModel;

class LeoqDb : public QObject
{
    Q_OBJECT
public:
    explicit LeoqDb(QObject *parent = 0);

signals:

public slots:
    void openDb(const QString& fname);
    QVariantList searchHeaders(const QString &pat);
    QVariantList childNodes(int parentid);
    QVariantMap fetchNodeFull(int nodeid);
    void updateNode(const QVariantMap& nodeInfo);
    void commit();


private:
    QSqlDatabase m_db;

};

#endif // LEOQDB_H
