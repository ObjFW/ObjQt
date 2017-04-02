#import "QtObject.h"
#import "QtEvent.h"
#import "QtThread.h"

#import "helpers.h"

#include <QVariant>

@implementation QtObject
@synthesize qObject = _qObject;

- init
{
	OF_INVALID_INIT_METHOD
}

- initWithQObject: (QObject*)qObject
{
	self = [super init];

	_qObject = qObject;

	return self;
}

- (void)dealloc
{
	if (_ownsObject)
		delete _qObject;

	[super dealloc];
}

- (void)takeOwnership
{
	OF_ENSURE(!_ownsObject);
	_ownsObject = true;
}

- (void)giveUpOwnership
{
	OF_ENSURE(_ownsObject);
	_ownsObject = false;
}

- (OFString*)objectName
{
	return QToOFString(_qObject->objectName());
}

- (void)setObjectName: (OFString*)objectName
{
	_qObject->setObjectName(OFToQString(objectName));
}

- (bool)setBlockSignals: (bool)block
{
	return _qObject->blockSignals(block);
}

- (OFArray OF_GENERIC(QtObject*)*)children
{
	const QObjectList &qChildren = _qObject->children();
	OFMutableArray *children = [OFMutableArray arrayWithCapacity:
	    qChildren.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QObject *qChild: qChildren)
		[children addObject:
		    [[[QtObject alloc] initWithQObject: qChild] autorelease]];

	objc_autoreleasePoolPop(pool);

	return children;
}

- (QMetaObject::Connection)connectSignal: (OFString*)signal
				  sender: (QtObject*)sender
				  method: (OFString*)method
				    type: (Qt::ConnectionType)type
{
	return _qObject->connect([sender qObject],
	    [signal UTF8String], [method UTF8String], type);
}

- (bool)disconnectSignal: (OFString*)signal
		receiver: (QtObject*)receiver
		  method: (OFString*)method
{
	return _qObject->disconnect([signal UTF8String], [receiver qObject],
	    [method UTF8String]);
}

- (bool)disconnectAllSignalsForReceiver: (QtObject*)receiver
				 method: (OFString*)method
{
	return _qObject->disconnect([receiver qObject], [method UTF8String]);
}

- (void)dumpObjectInfo
{
	_qObject->dumpObjectInfo();
}

- (void)dumpObjectTree
{
	_qObject->dumpObjectTree();
}

- (OFArray OF_GENERIC(OFDataArray*)*)dynamicPropertyNames
{
	const QList<QByteArray> &qDynamicPropertyNames =
	    _qObject->dynamicPropertyNames();
	OFMutableArray *dynamicPropertyNames =
	    [OFMutableArray arrayWithCapacity: qDynamicPropertyNames.count()];
	void *pool = objc_autoreleasePoolPush();

	for (const QByteArray &qDynamicPropertyName: qDynamicPropertyNames) {
		OFDataArray *dynamicPropertyName = [OFDataArray dataArray];
		[dynamicPropertyName addItems: qDynamicPropertyName.data()
					count: qDynamicPropertyName.count()];
		[dynamicPropertyNames addObject: dynamicPropertyName];
	}

	objc_autoreleasePoolPop(pool);

	return dynamicPropertyNames;
}

- (bool)handleEvent: (QtEvent*)event
{
	return _qObject->event([event qEvent]);
}

- (bool)filterEvent: (QtEvent*)event
	  forObject: (QtObject*)watched
{
	return _qObject->eventFilter([watched qObject], [event qEvent]);
}

- (bool)inheritsClassWithName: (OFString*)className
{
	return _qObject->inherits([className UTF8String]);
}

- (void)installEventFilter: (QtObject*)filterObj
{
	_qObject->installEventFilter([filterObj qObject]);
}

- (bool)isWidgetType
{
	return _qObject->isWidgetType();
}

- (bool)isWindowType
{
	return _qObject->isWindowType();
}

- (void)killTimerWithID: (int)ID
{
	_qObject->killTimer(ID);
}

- (const QMetaObject*)metaObject
{
	return _qObject->metaObject();
}

- (void)moveToThread: (QtThread*)targetThread
{
	_qObject->moveToThread([targetThread qThread]);
}

- (QtObject*)parent
{
	return [[[QtObject alloc]
	    initWithQObject: _qObject->parent()] autorelease];
}

- (void)setParent: (QtObject*)parent
{
	_qObject->setParent([parent qObject]);
}

- (QVariant)propertyForName: (OFString*)name
{
	return _qObject->property([name UTF8String]);
}

- (void)removeEventFilter: (QtObject*)obj
{
	_qObject->removeEventFilter([obj qObject]);
}

- (bool)setProperty: (QVariant&)value
	    forName: (OFString*)name
{
	return _qObject->setProperty([name UTF8String], value);
}

- (bool)signalsBlocked
{
	return _qObject->signalsBlocked();
}

- (int)startTimerWithInterval: (int)interval
			 type: (Qt::TimerType)type
{
	return _qObject->startTimer(interval, type);
}

- (QtThread*)thread
{
	return [[[QtThread alloc]
	    initWithQThread: _qObject->thread()] autorelease];
}

- (void)deleteLater
{
	OF_ENSURE(!_ownsObject);
	_qObject->deleteLater();
}
@end
