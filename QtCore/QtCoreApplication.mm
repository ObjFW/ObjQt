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
	return QToOFString([self qCoreApplication]->applicationName());
}

- (void)setApplicationName: (OFString*)applicationName
{
	[self qCoreApplication]->setApplicationName(
	    OFToQString(applicationName));
}

- (OFString*)applicationVersion
{
	return QToOFString([self qCoreApplication]->applicationVersion());
}

- (void)installNativeEventFilter: (QAbstractNativeEventFilter*)filterObject
{
	[self qCoreApplication]->installNativeEventFilter(filterObject);
}

- (void)setApplicationVersion: (OFString*)applicationVersion
{
	[self qCoreApplication]->setApplicationVersion(
	    OFToQString(applicationVersion));
}

- (OFString*)organizationDomain
{
	return QToOFString([self qCoreApplication]->organizationDomain());
}

- (void)setOrganizationDomain: (OFString*)organizationDomain
{
	[self qCoreApplication]->setOrganizationDomain(
	    OFToQString(organizationDomain));
}

- (OFString*)organizationName
{
	return QToOFString([self qCoreApplication]->organizationName());
}

- (void)setOrganizationName: (OFString*)organizationName
{
	[self qCoreApplication]->setOrganizationName(
	    OFToQString(organizationName));
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
