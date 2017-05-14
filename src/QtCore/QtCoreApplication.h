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

#include <QCoreApplication>

@interface QtCoreApplication: QtObject
@property (readonly, nonatomic) QCoreApplication *qCoreApplication;
@property (nonatomic, copy) OFString *applicationName, *applicationVersion;
@property (nonatomic, copy) OFString *organizationDomain, *organizationName;
@property (nonatomic, getter=isQuitLockEnabled) bool quitLockEnabled;

- initWithQObject: (QObject *)qObject OF_UNAVAILABLE;
- initWithQCoreApplication: (QCoreApplication *)qCoreApplication;
- (void)installNativeEventFilter: (QAbstractNativeEventFilter *)filterObject;
- (void)quit;
- (void)removeNativeEventFilter: (QAbstractNativeEventFilter *)filterObject;
- (bool)sendEvent: (QtEvent *)event
	 receiver: (QtObject *)receiver;
@end

namespace ObjQt {

static OF_INLINE QtCoreApplication *
toOF(QCoreApplication *qCoreApplication)
{
	return [[[QtCoreApplication alloc]
	    initWithQCoreApplication: qCoreApplication] autorelease];
}

static OF_INLINE QCoreApplication *
toQt(QtCoreApplication *coreApplication)
{
	return [coreApplication qCoreApplication];
}

}
