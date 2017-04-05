#import "QtGuiApplication.h"

#import "helpers.h"

#include <QIcon>

@implementation QtGuiApplication
- initWithQCoreApplication: (QCoreApplication*)qCoreApplication
{
	OF_INVALID_INIT_METHOD
}

- initWithQGuiApplication: (QGuiApplication*)qGuiApplication
{
	return [super initWithQCoreApplication: qGuiApplication];
}

- (QGuiApplication*)qGuiApplication
{
	return qobject_cast<QGuiApplication*>(_qObject);
}

- (OFString*)applicationDisplayName
{
	return toOF([self qGuiApplication]->applicationDisplayName());
}

- (void)setApplicationDisplayName: (OFString*)applicationDisplayName
{
	[self qGuiApplication]->setApplicationDisplayName(
	    toQt(applicationDisplayName));
}

- (OFString*)desktopFileName
{
	return toOF([self qGuiApplication]->desktopFileName());
}

- (void)setDesktopFileName: (OFString*)desktopFileName
{
	[self qGuiApplication]->setDesktopFileName(toQt(desktopFileName));
}

- (double)devicePixelRatio
{
	return [self qGuiApplication]->devicePixelRatio();
}

- (bool)isSavingSession
{
	return [self qGuiApplication]->isSavingSession();
}

- (bool)isSessionRestored
{
	return [self qGuiApplication]->isSessionRestored();
}

- (Qt::LayoutDirection)layoutDirection
{
	return [self qGuiApplication]->layoutDirection();
}

- (void)setLayoutDirection: (Qt::LayoutDirection)layoutDirection
{
	[self qGuiApplication]->setLayoutDirection(layoutDirection);
}

- (OFString*)platformName
{
	return toOF([self qGuiApplication]->platformName());
}

- (QScreen*)primaryScreen
{
	return [self qGuiApplication]->primaryScreen();
}

- (bool)quitOnLastWindowClosed
{
	return [self qGuiApplication]->quitOnLastWindowClosed();
}

- (void)setQuitOnLastWindowClosed: (bool)quitOnLastWindowClosed
{
	[self qGuiApplication]->setQuitOnLastWindowClosed(
	    quitOnLastWindowClosed);
}

- (OFString*)sessionID
{
	return toOF([self qGuiApplication]->sessionId());
}

- (OFString*)sessionKey
{
	return toOF([self qGuiApplication]->sessionKey());
}

- (QIcon)windowIcon
{
	return [self qGuiApplication]->windowIcon();
}

- (void)setWindowIcon: (QIcon)windowIcon
{
	[self qGuiApplication]->setWindowIcon(windowIcon);
}
@end
