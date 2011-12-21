#include "leoqdb.h"
#include <QSqlQuery>
#include <QVariant>
#include "roleitemmodel.h"
#include <QDebug>
#include <QSqlError>
#include "leonode.h"
/*

treefrag_schema = """
drop table if exists blobs;

CREATE TABLE blobs (
 id INTEGER PRIMARY KEY,
 format INTEGER,
 data BLOB
);

drop table if exists nodes;

CREATE TABLE nodes (
 id INTEGER PRIMARY KEY,
 gnx VARCHAR(20) NOT NULL,

 h TEXT,
 bodyid INTEGER REFERENCES blobs(id)
);

drop table if exists edges;

CREATE TABLE edges (
 a INTEGER NOT NULL REFERENCES nodes(id),
 b INTEGER NOT NULL REFERENCES nodes(id),
 pos INTEGER NOT NULL,
 PRIMARY KEY (a, b, pos)
);

CREATE INDEX a_idx ON edges (a);
CREATE INDEX b_idx ON edges (b);
"""

*/

namespace
{
    void doexec(QSqlQuery& q) {
        bool r = q.exec();
        if (!r)
            qDebug() << "Db error :" << q.lastError();
        else
            qDebug() << "ok exec";
    }
}

LeoqDb::LeoqDb(QObject *parent) :
    QObject(parent)
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");

}


void LeoqDb::openDb(const QString &fname)
{
    m_db.setDatabaseName(fname);
    bool r = m_db.open();

}



QVariantList LeoqDb::searchHeaders(const QString &pat)
{

    QSqlQuery q("select id, h from NODES"); // where h like ?");
    //q.bindValue(0,QVariant(pat));
    doexec(q);
    QVariantList res;
    while (q.next()) {
        QVariantMap ent;
        ent["id"] = q.value(0);
        ent["h"] = q.value(1);
        qDebug() << ent;

        res.append(ent);
    }
    return res;
}

QVariantList LeoqDb::childNodes(int parentid)
{
    QSqlQuery q("select EDGES.b, EDGES.pos, NODES.id, NODES.h from EDGES, NODES where EDGES.a = ? and NODES.id = EDGES.b order by EDGES.pos");
    q.bindValue(0, QVariant(parentid));

    doexec(q);
    QVariantList res;
    while (q.next()) {
        QVariantMap ent;
        ent["id"] = q.value(2);
        ent["h"] = q.value(3);
        qDebug() << ent;

        res.append(ent);
    }
    return res;
}

QVariantMap LeoqDb::fetchNodeFull(int nodeid)
{
    QVariantMap res;
    QSqlQuery q("select BLOBS.format, BLOBS.data, NODES.h, NODES.id, BLOBS.id from blobs, nodes where NODES.id = ? and BLOBS.id = NODES.bodyid");
    q.bindValue(0, nodeid);
    doexec(q);
    q.next();
    QString format = q.value(0).toString();
    QVariant v = q.value(1);
    qDebug() << "blob: " << v;
    res["b"] = v.toString();
    res["h"] = q.value(2).toString();
    res["id"] = q.value(3).toInt();
    res["bodyid"] = q.value(4).toInt();

    return res;
}

void LeoqDb::updateNode(const QVariantMap &nodeInfo)
{
    qDebug() << "update " << nodeInfo;
    QSqlQuery q("update BLOBS set data=:body where id=:bodyid");
    q.bindValue(":body", nodeInfo["b"]);
    q.bindValue(":bodyid", nodeInfo["bodyid"]);
    doexec(q);
    QSqlQuery q2("update NODES set h = :h where id=:nodeid");
    q2.bindValue(":h", nodeInfo["h"]);
    q2.bindValue(":nodeid", nodeInfo["id"]);
    doexec(q2);


}

void LeoqDb::commit()
{
    m_db.commit();

}


