/*
 * Copyright (c) 2017, Jonathan Schleifer <js@heap.zone>
 *
 * https://heap.zone/git/objqt.git
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice is present in all copies.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#import "QtObject.h"
#import "QtEvent.h"
#import "QtThread.h"
#import "OFString+QString.h"
#import "OFDataArray+QByteArray.h"

#include <QVariant>

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtObject
@synthesize qObject = _qObject;

- init
{
	OF_INVALID_INIT_METHOD
}

- initWithQObject: (QObject *)qObject
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

- (OFString *)objectName
{
	return toOF(_qObject->objectName());
}

- (void)setObjectName: (OFString *)objectName
{
	_qObject->setObjectName(toQt(objectName));
}

- (bool)setBlockSignals: (bool)block
{
	return _qObject->blockSignals(block);
}

- (OFArray OF_GENERIC(QtObject *) *)children
{
	const QObjectList &qChildren = _qObject->children();
	OFMutableArray *children = [OFMutableArray arrayWithCapacity:
	    qChildren.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QObject *qChild: qChildren)
		[children addObject: toOF(qChild)];

	[children makeImmutable];

	objc_autoreleasePoolPop(pool);

	return children;
}

- (QMetaObject::Connection)connectSignal: (OFString *)signal
				  sender: (QtObject *)sender
				  method: (OFString *)method
				    type: (Qt::ConnectionType)type
{
	return _qObject->connect(toQt(sender),
	    [signal UTF8String], [method UTF8String], type);
}

- (bool)disconnectSignal: (OFString *)signal
		receiver: (QtObject *)receiver
		  method: (OFString *)method
{
	return _qObject->disconnect([signal UTF8String], toQt(receiver),
	    [method UTF8String]);
}

- (bool)disconnectAllSignalsForReceiver: (QtObject *)receiver
				 method: (OFString *)method
{
	return _qObject->disconnect(toQt(receiver), [method UTF8String]);
}

- (void)dumpObjectInfo
{
	_qObject->dumpObjectInfo();
}

- (void)dumpObjectTree
{
	_qObject->dumpObjectTree();
}

- (OFArray OF_GENERIC(OFDataArray *) *)dynamicPropertyNames
{
	const QList<QByteArray> &dynamicPropertyNames =
	    _qObject->dynamicPropertyNames();
	OFMutableArray *ret =
	    [OFMutableArray arrayWithCapacity: dynamicPropertyNames.count()];
	void *pool = objc_autoreleasePoolPush();

	for (const QByteArray &dynamicPropertyName: dynamicPropertyNames)
		[ret addObject: toOF(dynamicPropertyName)];

	[ret makeImmutable];

	objc_autoreleasePoolPop(pool);

	return ret;
}

- (bool)handleEvent: (QtEvent *)event
{
	return _qObject->event(toQt(event));
}

- (bool)filterEvent: (QtEvent *)event
	  forObject: (QtObject *)watched
{
	return _qObject->eventFilter(toQt(watched), toQt(event));
}

- (bool)inheritsClassWithName: (OFString *)className
{
	return _qObject->inherits([className UTF8String]);
}

- (void)installEventFilter: (QtObject *)filterObj
{
	_qObject->installEventFilter(toQt(filterObj));
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

- (const QMetaObject *)metaObject
{
	return _qObject->metaObject();
}

- (void)moveToThread: (QtThread *)targetThread
{
	_qObject->moveToThread(toQt(targetThread));
}

- (QtObject *)parent
{
	return toOF(_qObject->parent());
}

- (void)setParent: (QtObject *)parent
{
	_qObject->setParent(toQt(parent));
}

- (QVariant)propertyForName: (OFString *)name
{
	return _qObject->property([name UTF8String]);
}

- (void)removeEventFilter: (QtObject *)obj
{
	_qObject->removeEventFilter(toQt(obj));
}

- (bool)setProperty: (QVariant &)value
	    forName: (OFString *)name
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

- (QtThread *)thread
{
	return toOF(_qObject->thread());
}

- (void)deleteLater
{
	OF_ENSURE(!_ownsObject);
	_qObject->deleteLater();
}
@end
