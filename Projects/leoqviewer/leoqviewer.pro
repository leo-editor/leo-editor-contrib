# Add more folders to ship with the application, here
folder_01.source = qml/leoqviewer
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE1EA1FCA

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    leoqdb.cpp \
    leomodel.cpp \
    leonode.cpp \
    roleitemmodel.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

QT += sql

HEADERS += \
    leoqdb.h \
    leomodel.h \
    leonode.h \
    roleitemmodel.h
