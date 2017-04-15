TEMPLATE = lib
TARGET = ObjQt
DESTDIR = build
OBJECTS_DIR = build
QT += core gui widgets

INCLUDEPATH += common	\
	       QtCore	\
	       QtGui	\
	       QtWidgets

HEADERS += common/helpers.h		\
	   common/OFString+QString.h	\
	   common/QtOwnershipManaging.h	\
	   QtCore/QtChildEvent.h	\
	   QtCore/QtCoreApplication.h	\
	   QtCore/QtEvent.h		\
	   QtCore/QtObject.h		\
	   QtCore/QtThread.h		\
	   QtGui/QtGuiApplication.h	\
	   QtGui/QtPaintDevice.h	\
	   QtWidgets/QtAction.h		\
	   QtWidgets/QtApplication.h	\
	   QtWidgets/QtWidget.h

SOURCES += common/OFString+QString.mm	\
	   QtCore/QtChildEvent.mm	\
	   QtCore/QtCoreApplication.mm	\
	   QtCore/QtEvent.mm  		\
	   QtCore/QtObject.mm		\
	   QtCore/QtThread.mm		\
	   QtGui/QtGuiApplication.mm	\
	   QtGui/QtPaintDevice.mm	\
	   QtWidgets/QtAction.mm	\
	   QtWidgets/QtApplication.mm	\
	   QtWidgets/QtWidget.mm

OBJCFLAGS += $$system("objfw-config --cppflags --objcflags --cxxflags")
OBJCFLAGS_WARN_ON = -Wall				\
		    -Werror				\
		    -Wsemicolon-before-method-body	\
		    -Wobjc-missing-property-synthesis

# qmake treats .mm files as C++ on Mac, but as C on everything else
macx:QMAKE_CXXFLAGS += $$OBJCFLAGS
macx:QMAKE_CXXFLAGS_WARN_ON = $$OBJCFLAGS_WARN_ON
!macx:QMAKE_CC = clang++
!macx:QMAKE_CFLAGS += -std=c++11 $$OBJCFLAGS
!macx:QMAKE_CFLAGS_WARN_ON = $$OBJCFLAGS_WARN_ON

LIBS += $$system("objfw-config --ldflags --libs")
