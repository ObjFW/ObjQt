#import <ObjFW/ObjFW.h>

#import "QtOwnershipManaging.h"

#include <QObject>

@class QtEvent;
@class QtThread;

@interface QtObject: OFObject <QtOwnershipManaging>
{
	QObject *_qObject;
	bool _ownsObject;
}

@property (readonly) QObject *qObject;
@property (readonly) const QMetaObject *metaObject;
@property (retain) QtObject *parent;
@property (copy) OFString *objectName;

- initWithQObject: (QObject*)qObject;
- (bool)setBlockSignals: (bool)block;
- (OFArray OF_GENERIC(QtObject*)*)children;
- (QMetaObject::Connection)connectSignal: (OFString*)signal
				  sender: (QtObject*)sender
				  method: (OFString*)method
				    type: (Qt::ConnectionType)type;
- (bool)disconnectSignal: (OFString*)signal
		receiver: (QtObject*)receiver
		  method: (OFString*)method;
- (bool)disconnectAllSignalsForReceiver: (QtObject*)receiver
				 method: (OFString*)method;
- (void)dumpObjectInfo;
- (void)dumpObjectTree;
- (OFArray OF_GENERIC(OFDataArray*)*)dynamicPropertyNames;
- (bool)handleEvent: (QtEvent*)event;
- (bool)filterEvent: (QtEvent*)event
	  forObject: (QtObject*)watched;
// MISSING: T findChild(const QString &name = QString(),
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
// MISSING QList<T> findChildren(const QString &name = QString(),
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
// MISSING: QList<T> findChildren(const QRegExp &regExp,
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
- (bool)inheritsClassWithName: (OFString*)className;
- (void)installEventFilter: (QtObject*)filterObj;
- (bool)isWidgetType;
- (bool)isWindowType;
- (void)killTimerWithID: (int)ID;
- (void)moveToThread: (QtThread*)targetThread;
- (QVariant)propertyForName: (OFString*)name;
- (void)removeEventFilter: (QtObject*)obj;
- (bool)setProperty: (QVariant&)value
	    forName: (OFString*)name;
- (bool)signalsBlocked;
- (int)startTimerWithInterval: (int)interval
			 type: (Qt::TimerType)type;
- (QtThread*)thread;
- (void)deleteLater;
@end
