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

#import "QtCoreApplication.h"
#import "QtEvent.h"
#import "OFString+QString.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtCoreApplication
- initWithQObject: (QObject*)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQCoreApplication: (QCoreApplication*)qCoreApplication
{
	return [super initWithQObject: qCoreApplication];
}

- (QCoreApplication*)qCoreApplication
{
	return qobject_cast<QCoreApplication*>(_qObject);
}

- (OFString*)applicationName
{
	return toOF(toQt(self)->applicationName());
}

- (void)setApplicationName: (OFString*)applicationName
{
	toQt(self)->setApplicationName(toQt(applicationName));
}

- (OFString*)applicationVersion
{
	return toOF(toQt(self)->applicationVersion());
}

- (void)installNativeEventFilter: (QAbstractNativeEventFilter*)filterObject
{
	toQt(self)->installNativeEventFilter(filterObject);
}

- (void)setApplicationVersion: (OFString*)applicationVersion
{
	toQt(self)->setApplicationVersion(toQt(applicationVersion));
}

- (OFString*)organizationDomain
{
	return toOF(toQt(self)->organizationDomain());
}

- (void)setOrganizationDomain: (OFString*)organizationDomain
{
	toQt(self)->setOrganizationDomain(toQt(organizationDomain));
}

- (OFString*)organizationName
{
	return toOF(toQt(self)->organizationName());
}

- (void)setOrganizationName: (OFString*)organizationName
{
	toQt(self)->setOrganizationName(toQt(organizationName));
}

- (void)quit
{
	toQt(self)->quit();
}

- (bool)isQuitLockEnabled
{
	return toQt(self)->isQuitLockEnabled();
}

- (void)setQuitLockEnabled: (bool)quitLockEnabled
{
	toQt(self)->setQuitLockEnabled(quitLockEnabled);
}

- (void)removeNativeEventFilter: (QAbstractNativeEventFilter*)filterObject
{
	toQt(self)->removeNativeEventFilter(filterObject);
}

- (bool)sendEvent: (QtEvent*)event
	 receiver: (QtObject*)receiver
{
	return toQt(self)->notify(toQt(receiver), toQt(event));
}
@end
