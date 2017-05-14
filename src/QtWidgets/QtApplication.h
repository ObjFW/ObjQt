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

#include <QApplication>

@interface QtApplication: QtGUIApplication
@property (readonly, nonatomic) QApplication *qApplication;
@property (nonatomic) bool autoSIPEnabled;
@property (nonatomic) int cursorFlashTime;
@property (nonatomic) int doubleClickInterval;
@property (nonatomic) of_dimension_t globalStrut;
@property (nonatomic) int keyboardInputInterval;
@property (nonatomic) int startDragDistance;
@property (nonatomic) int startDragTime;
@property (nonatomic, copy) OFString *styleSheet;
@property (nonatomic) int wheelScrollLines;

- initWithQGuiApplication: (QGuiApplication *)qGuiApplication OF_UNAVAILABLE;
- initWithQApplication: (QApplication *)qApplication;
- (void)aboutQt;
- (void)closeAllWindows;
@end

namespace ObjQt {

static OF_INLINE QtApplication *
toOF(QApplication *qApplication)
{
	return [[[QtApplication alloc]
	    initWithQApplication: qApplication] autorelease];
}

static OF_INLINE QApplication *
toQt(QtApplication *application)
{
	return [application qApplication];
}

}
