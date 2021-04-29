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

#import "QtWidget.h"

#include <QAbstractButton>

@interface QtAbstractButton: QtWidget
@property (readonly, nonatomic) QAbstractButton *qAbstractButton;
@property (nonatomic) bool autoExclusive;
@property (nonatomic) bool autoRepeat;
@property (nonatomic) int autoRepeatDelay;
@property (nonatomic) int autoRepeatInterval;
@property (nonatomic, getter=isCheckable) bool checkable;
@property (nonatomic, getter=isChecked) bool checked;
@property (nonatomic, getter=isDown) bool down;
@property (nonatomic) QIcon icon;
@property (nonatomic) OFSize iconSize;
@property (nonatomic) QKeySequence shortcut;
@property (nonatomic, copy) OFString *text;
@property (readonly, nonatomic) QButtonGroup *group;

- (instancetype)initWithQWidget: (QWidget *)qWidget OF_UNAVAILABLE;
- (instancetype)initWithQAbstractButton: (QAbstractButton *)qAbstractButton
    OF_DESIGNATED_INITIALIZER;
@end

namespace ObjQt {

static OF_INLINE QtAbstractButton *
toOF(QAbstractButton *qAbstractButton)
{
	if (qAbstractButton == NULL)
		return nil;

	return [[[QtAbstractButton alloc]
	    initWithQAbstractButton: qAbstractButton] autorelease];
}

static OF_INLINE QAbstractButton *
toQt(QtAbstractButton *abstractButton)
{
	return abstractButton.qAbstractButton;
}

}
