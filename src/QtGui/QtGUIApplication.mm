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

#import "QtGUIApplication.h"
#import "OFString+QString.h"

#include <QIcon>

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtGUIApplication
- (instancetype)initWithQCoreApplication: (QCoreApplication *)qCoreApplication
{
	OF_INVALID_INIT_METHOD
}

- (instancetype)initWithQGuiApplication: (QGuiApplication *)qGuiApplication
{
	return [super initWithQCoreApplication: qGuiApplication];
}

- (QGuiApplication *)qGuiApplication
{
	return qobject_cast<QGuiApplication *>(_qObject);
}

- (OFString *)applicationDisplayName
{
	return toOF(toQt(self)->applicationDisplayName());
}

- (void)setApplicationDisplayName: (OFString *)applicationDisplayName
{
	toQt(self)->setApplicationDisplayName(toQt(applicationDisplayName));
}

#if QT_VERSION >= QT_VERSION_CHECK(5, 7, 0)
- (OFString *)desktopFileName
{
	return toOF(toQt(self)->desktopFileName());
}

- (void)setDesktopFileName: (OFString *)desktopFileName
{
	toQt(self)->setDesktopFileName(toQt(desktopFileName));
}
#endif

- (double)devicePixelRatio
{
	return toQt(self)->devicePixelRatio();
}

- (bool)isSavingSession
{
	return toQt(self)->isSavingSession();
}

- (bool)isSessionRestored
{
	return toQt(self)->isSessionRestored();
}

- (Qt::LayoutDirection)layoutDirection
{
	return toQt(self)->layoutDirection();
}

- (void)setLayoutDirection: (Qt::LayoutDirection)layoutDirection
{
	toQt(self)->setLayoutDirection(layoutDirection);
}

- (OFString *)platformName
{
	return toOF(toQt(self)->platformName());
}

- (QScreen *)primaryScreen
{
	return toQt(self)->primaryScreen();
}

- (bool)quitsOnLastWindowClosed
{
	return toQt(self)->quitOnLastWindowClosed();
}

- (void)setQuitsOnLastWindowClosed: (bool)quitsOnLastWindowClosed
{
	toQt(self)->setQuitOnLastWindowClosed(quitsOnLastWindowClosed);
}

- (OFString *)sessionID
{
	return toOF(toQt(self)->sessionId());
}

- (OFString *)sessionKey
{
	return toOF(toQt(self)->sessionKey());
}

- (QIcon)windowIcon
{
	return toQt(self)->windowIcon();
}

- (void)setWindowIcon: (QIcon)windowIcon
{
	toQt(self)->setWindowIcon(windowIcon);
}
@end
