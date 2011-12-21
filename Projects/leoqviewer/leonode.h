#ifndef LEONODE_H
#define LEONODE_H

#include <QString>
#include <QObject>

class RoleItemModel;

class LeoNode : public QObject {
    Q_OBJECT

public:
    LeoNode();
    QString m_headstring;

    Q_PROPERTY(QString headstring READ getHeadstring WRITE getHeadstring)
    int bodyid;

    QString body;

#if 0
    enum NodeRoles {
        RoleH = Qt::UserRole + 1,
        RoleBody,
        RoleGnx

    };
#endif
    //static RoleItemModel* createModel();

    QString getHeadstring() const
    {
        return m_headstring;
    }
public slots:
    void getHeadstring(QString arg)
    {
        m_headstring = arg;
    }
};

#endif // LEONODE_H
