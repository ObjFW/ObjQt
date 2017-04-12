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

#import "QtApplication.h"

#import "helpers.h"

@implementation QtApplication
- initWithQGuiApplication: (QGuiApplication*)qGuiApplication
{
	OF_INVALID_INIT_METHOD
}

- initWithQApplication: (QApplication*)qApplication
{
	return [super initWithQGuiApplication: qApplication];
}

- (QApplication*)qApplication
{
	return qobject_cast<QApplication*>(_qObject);
}

- (bool)autoSipEnabled
{
	return [self qApplication]->autoSipEnabled();
}

- (void)setAutoSipEnabled: (bool)autoSipEnabled
{
	[self qApplication]->setAutoSipEnabled(autoSipEnabled);
}

- (int)cursorFlashTime
{
	return [self qApplication]->cursorFlashTime();
}

- (void)setCursorFlashTime: (int)cursorFlashTime
{
	[self qApplication]->setCursorFlashTime(cursorFlashTime);
}

- (int)doubleClickInterval
{
	return [self qApplication]->doubleClickInterval();
}

- (void)setDoubleClickInterval: (int)doubleClickInterval
{
	[self qApplication]->setDoubleClickInterval(doubleClickInterval);
}

- (of_dimension_t)globalStrut
{
	return toOF([self qApplication]->globalStrut());
}

- (void)setGlobalStrut: (of_dimension_t)globalStrut
{
	[self qApplication]->setGlobalStrut(toQt(globalStrut));
}

- (int)keyboardInputInterval
{
	return [self qApplication]->keyboardInputInterval();
}

- (void)setKeyboardInputInterval: (int)keyboardInputInterval
{
	[self qApplication]->setKeyboardInputInterval(keyboardInputInterval);
}

- (int)startDragDistance
{
	return [self qApplication]->startDragDistance();
}

- (void)setStartDragDistance: (int)startDragDistance
{
	[self qApplication]->setStartDragDistance(startDragDistance);
}

- (int)startDragTime
{
	return [self qApplication]->startDragTime();
}

- (void)setStartDragTime: (int)startDragTime
{
	[self qApplication]->setStartDragTime(startDragTime);
}

- (OFString*)styleSheet
{
	return toOF([self qApplication]->styleSheet());
}

- (void)setStyleSheet: (OFString*)styleSheet
{
	[self qApplication]->setStyleSheet(toQt(styleSheet));
}

- (int)wheelScrollLines
{
	return [self qApplication]->wheelScrollLines();
}

- (void)setWheelScrollLines: (int)wheelScrollLines
{
	[self qApplication]->setWheelScrollLines(wheelScrollLines);
}

- (void)aboutQt
{
	[self qApplication]->aboutQt();
}

- (void)closeAllWindows
{
	[self qApplication]->closeAllWindows();
}
@end
