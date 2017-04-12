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
