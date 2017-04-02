#import "QtCoreApplication.h"

#include <QGuiApplication>

@interface QtGuiApplication: QtCoreApplication
@property (readonly) QGuiApplication *qGuiApplication;
@property (copy) OFString *applicationDisplayName;
@property (copy) OFString *desktopFileName;
@property Qt::LayoutDirection layoutDirection;
@property (readonly, copy) OFString *platformName;
@property (readonly) QScreen *primaryScreen;
@property bool quitOnLastWindowClosed;
@property QIcon windowIcon;

- initWithQGuiApplication: (QGuiApplication*)qGuiApplication;
- (double)devicePixelRatio;
- (bool)isSavingSession;
- (bool)isSessionRestored;
- (OFString*)sessionID;
- (OFString*)sessionKey;
@end
