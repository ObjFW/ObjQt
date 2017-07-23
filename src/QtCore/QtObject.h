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

@property (readonly, nonatomic) QObject *qObject;
@property (readonly, nonatomic) const QMetaObject *metaObject;
@property (nonatomic, retain) QtObject *parent;
@property (nonatomic, copy) OFString *objectName;

- init OF_UNAVAILABLE;
- initWithQObject: (QObject *)qObject OF_DESIGNATED_INITIALIZER;
- (bool)setBlockSignals: (bool)block;
- (OFArray OF_GENERIC(QtObject *) *)children;
- (QMetaObject::Connection)connectSignal: (OFString *)signal
				  sender: (QtObject *)sender
				  method: (OFString *)method
				    type: (Qt::ConnectionType)type;
- (bool)disconnectSignal: (OFString *)signal
		receiver: (QtObject *)receiver
		  method: (OFString *)method;
- (bool)disconnectAllSignalsForReceiver: (QtObject *)receiver
				 method: (OFString *)method;
- (void)dumpObjectInfo;
- (void)dumpObjectTree;
- (OFArray OF_GENERIC(OFData *) *)dynamicPropertyNames;
- (bool)handleEvent: (QtEvent *)event;
- (bool)filterEvent: (QtEvent *)event
	  forObject: (QtObject *)watched;
// MISSING: T findChild(const QString &name = QString(),
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
// MISSING QList<T> findChildren(const QString &name = QString(),
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
// MISSING: QList<T> findChildren(const QRegExp &regExp,
//     Qt::FindChildOptions options = Qt::FindChildrenRecursively) const;
- (bool)inheritsClassWithName: (OFString *)className;
- (void)installEventFilter: (QtObject *)filterObj;
- (bool)isWidgetType;
- (bool)isWindowType;
- (void)killTimerWithID: (int)ID;
- (void)moveToThread: (QtThread *)targetThread;
- (QVariant)propertyForName: (OFString *)name;
- (void)removeEventFilter: (QtObject *)obj;
- (bool)setProperty: (QVariant&)value
	    forName: (OFString *)name;
- (bool)signalsBlocked;
- (int)startTimerWithInterval: (int)interval
			 type: (Qt::TimerType)type;
- (QtThread *)thread;
- (void)deleteLater;
@end

namespace ObjQt {

static OF_INLINE QtObject *
toOF(QObject *qObject)
{
	if (qObject == NULL)
		return nil;

	return [[[QtObject alloc] initWithQObject: qObject] autorelease];
}

static OF_INLINE QObject *
toQt(QtObject *object)
{
	return [object qObject];
}

}
