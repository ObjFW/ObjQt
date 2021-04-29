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
#import "OFString+QString.h"

#import "helpers.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtApplication
- (instancetype)initWithQGuiApplication: (QGuiApplication *)qGuiApplication
{
	OF_INVALID_INIT_METHOD
}

- (instancetype)initWithQApplication: (QApplication *)qApplication
{
	return [super initWithQGuiApplication: qApplication];
}

- (QApplication *)qApplication
{
	return qobject_cast<QApplication *>(_qObject);
}

- (bool)autoSIPEnabled
{
	return toQt(self)->autoSipEnabled();
}

- (void)setAutoSIPEnabled: (bool)autoSIPEnabled
{
	toQt(self)->setAutoSipEnabled(autoSIPEnabled);
}

- (int)cursorFlashTime
{
	return toQt(self)->cursorFlashTime();
}

- (void)setCursorFlashTime: (int)cursorFlashTime
{
	toQt(self)->setCursorFlashTime(cursorFlashTime);
}

- (int)doubleClickInterval
{
	return toQt(self)->doubleClickInterval();
}

- (void)setDoubleClickInterval: (int)doubleClickInterval
{
	toQt(self)->setDoubleClickInterval(doubleClickInterval);
}

- (OFSize)globalStrut
{
	return toOF(toQt(self)->globalStrut());
}

- (void)setGlobalStrut: (OFSize)globalStrut
{
	toQt(self)->setGlobalStrut(toQt(globalStrut).toSize());
}

- (int)keyboardInputInterval
{
	return toQt(self)->keyboardInputInterval();
}

- (void)setKeyboardInputInterval: (int)keyboardInputInterval
{
	toQt(self)->setKeyboardInputInterval(keyboardInputInterval);
}

- (int)startDragDistance
{
	return toQt(self)->startDragDistance();
}

- (void)setStartDragDistance: (int)startDragDistance
{
	toQt(self)->setStartDragDistance(startDragDistance);
}

- (int)startDragTime
{
	return toQt(self)->startDragTime();
}

- (void)setStartDragTime: (int)startDragTime
{
	toQt(self)->setStartDragTime(startDragTime);
}

- (OFString *)styleSheet
{
	return toOF(toQt(self)->styleSheet());
}

- (void)setStyleSheet: (OFString *)styleSheet
{
	toQt(self)->setStyleSheet(toQt(styleSheet));
}

- (int)wheelScrollLines
{
	return toQt(self)->wheelScrollLines();
}

- (void)setWheelScrollLines: (int)wheelScrollLines
{
	toQt(self)->setWheelScrollLines(wheelScrollLines);
}

- (void)aboutQt
{
	toQt(self)->aboutQt();
}

- (void)closeAllWindows
{
	toQt(self)->closeAllWindows();
}
@end
