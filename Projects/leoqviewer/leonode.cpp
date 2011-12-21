#include "leonode.h"

#include <QString>
#include <QHash>
#include "roleitemmodel.h"

LeoNode::LeoNode()
{
}

#if 0
RoleItemModel* LeoNode::createModel() {
    QHash<int, QByteArray> roleNames;
    roleNames[LeoNode::RoleH] =  "h";
    roleNames[LeoNode::RoleBody] = "body";
    roleNames[LeoNode::RoleGnx] = "gnx";
    return new RoleItemModel(roleNames);
}
#endif
