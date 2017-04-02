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
	return QToOFString([self qGuiApplication]->applicationDisplayName());
}

- (void)setApplicationDisplayName: (OFString*)applicationDisplayName
{
	[self qGuiApplication]->setApplicationDisplayName(
	    OFToQString(applicationDisplayName));
}

- (OFString*)desktopFileName
{
	return QToOFString([self qGuiApplication]->desktopFileName());
}

- (void)setDesktopFileName: (OFString*)desktopFileName
{
	[self qGuiApplication]->setDesktopFileName(
	    OFToQString(desktopFileName));
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
	return QToOFString([self qGuiApplication]->platformName());
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
	return QToOFString([self qGuiApplication]->sessionId());
}

- (OFString*)sessionKey
{
	return QToOFString([self qGuiApplication]->sessionKey());
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
