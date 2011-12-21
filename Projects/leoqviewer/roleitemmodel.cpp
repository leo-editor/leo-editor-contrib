#include "roleitemmodel.h"


/* Example usage:


Enumerate the role ID's somewhere
---------------------------------

struct RedditEntry {

    enum RedditRoles {
        UrlRole = Qt::UserRole + 1,
        DescRole,
        ...
    };
    ...
}

Instantiate the class
---------------------


    QHash<int, QByteArray> roleNames;
    roleNames[RedditEntry::UrlRole] =  "url";
    roleNames[RedditEntry::ScoreRole] = "score";
    m_linksmodel = new RoleItemModel(roleNames);



Populate with data:
-------------------

    QStandardItem* it = new QStandardItem();
    it->setData(e.desc, RedditEntry::DescRole);
    it->setData(e.score, RedditEntry::ScoreRole);

    m_linksmodel->appendRow(it);

Expose to QML:
-------------

QDeclarativeContext *ctx = ...

ctx->setContextProperty("mdlLinks", m_linksmodel);

Use in QML as a delegate (pruned out irrelevant parts):
-------------------------------------------------------

Component {
    id: mydelegate
    Rectangle {
        Text {
            text: desc
        }

        Text {
            text: score
        }
    }
}



*/


RoleItemModel::RoleItemModel(const QHash<int, QByteArray> &roleNames)
{
    setRoleNames(roleNames);
}

QVariantMap RoleItemModel::getModelData(const QAbstractItemModel* mdl, int row)
{
    QHash<int,QByteArray> names = mdl->roleNames();
    QHashIterator<int, QByteArray> i(names);
    QVariantMap res;
     while (i.hasNext()) {
        i.next();
        QModelIndex idx = mdl->index(row, 0);
        QVariant data = idx.data(i.key());
        res[i.value()] = data;
         //cout << i.key() << ": " << i.value() << endl;
     }
     return res;
}


