#import "QtCoreApplication.h"
#import "QtEvent.h"

#import "helpers.h"

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
	return toOF([self qCoreApplication]->applicationName());
}

- (void)setApplicationName: (OFString*)applicationName
{
	[self qCoreApplication]->setApplicationName(toQt(applicationName));
}

- (OFString*)applicationVersion
{
	return toOF([self qCoreApplication]->applicationVersion());
}

- (void)installNativeEventFilter: (QAbstractNativeEventFilter*)filterObject
{
	[self qCoreApplication]->installNativeEventFilter(filterObject);
}

- (void)setApplicationVersion: (OFString*)applicationVersion
{
	[self qCoreApplication]->setApplicationVersion(
	    toQt(applicationVersion));
}

- (OFString*)organizationDomain
{
	return toOF([self qCoreApplication]->organizationDomain());
}

- (void)setOrganizationDomain: (OFString*)organizationDomain
{
	[self qCoreApplication]->setOrganizationDomain(
	    toQt(organizationDomain));
}

- (OFString*)organizationName
{
	return toOF([self qCoreApplication]->organizationName());
}

- (void)setOrganizationName: (OFString*)organizationName
{
	[self qCoreApplication]->setOrganizationName(toQt(organizationName));
}

- (void)quit
{
	[self qCoreApplication]->quit();
}

- (bool)isQuitLockEnabled
{
	return [self qCoreApplication]->isQuitLockEnabled();
}

- (void)setQuitLockEnabled: (bool)quitLockEnabled
{
	[self qCoreApplication]->setQuitLockEnabled(quitLockEnabled);
}

- (void)removeNativeEventFilter: (QAbstractNativeEventFilter*)filterObject
{
	[self qCoreApplication]->removeNativeEventFilter(filterObject);
}

- (bool)sendEvent: (QtEvent*)event
	 receiver: (QtObject*)receiver
{
	return [self qCoreApplication]->notify(
	    [receiver qObject], [event qEvent]);
}
@end
