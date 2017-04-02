#import "QtObject.h"

#include <QCoreApplication>

@interface QtCoreApplication: QtObject
@property (readonly) QCoreApplication *qCoreApplication;
@property (copy) OFString *applicationName, *applicationVersion;
@property (copy) OFString *organizationDomain, *organizationName;
@property (getter=isQuitLockEnabled) bool quitLockEnabled;

- initWithQCoreApplication: (QCoreApplication*)qCoreApplication;
- (void)installNativeEventFilter: (QAbstractNativeEventFilter*)filterObject;
- (void)quit;
- (void)removeNativeEventFilter: (QAbstractNativeEventFilter*)filterObject;
- (bool)sendEvent: (QtEvent*)event
	 receiver: (QtObject*)receiver;
@end
