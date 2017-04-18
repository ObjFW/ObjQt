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

#import "QtAbstractButton.h"
#import "OFString+QString.h"

#import "helpers.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtAbstractButton
- initWithQWidget: (QWidget*)qWidget
{
	OF_INVALID_INIT_METHOD
}

- initWithQAbstractButton: (QAbstractButton*)qAbstractButton
{
	return [super initWithQWidget: qAbstractButton];
}

- (QAbstractButton*)qAbstractButton
{
	return qobject_cast<QAbstractButton*>(_qObject);
}

- (bool)autoExclusive
{
	return toQt(self)->autoExclusive();
}

- (void)setAutoExclusive: (bool)autoExclusive
{
	toQt(self)->setAutoExclusive(autoExclusive);
}

- (bool)autoRepeat
{
	return toQt(self)->autoRepeat();
}

- (void)setAutoRepeat: (bool)autoRepeat
{
	toQt(self)->setAutoRepeat(autoRepeat);
}

- (int)autoRepeatDelay
{
	return toQt(self)->autoRepeatDelay();
}

- (void)setAutoRepeatDelay: (int)autoRepeatDelay
{
	toQt(self)->setAutoRepeatDelay(autoRepeatDelay);
}

- (int)autoRepeatInterval
{
	return toQt(self)->autoRepeatInterval();
}

- (void)setAutoRepeatInterval: (int)autoRepeatInterval
{
	toQt(self)->setAutoRepeatInterval(autoRepeatInterval);
}

- (bool)isCheckable
{
	return toQt(self)->isCheckable();
}

- (void)setCheckable: (bool)checkable
{
	toQt(self)->setCheckable(checkable);
}

- (bool)isChecked
{
	return toQt(self)->isChecked();
}

- (void)setChecked: (bool)checked
{
	toQt(self)->setChecked(checked);
}

- (bool)isDown
{
	return toQt(self)->isDown();
}

- (void)setDown: (bool)down
{
	toQt(self)->setDown(down);
}

- (QIcon)icon
{
	return toQt(self)->icon();
}

- (void)setIcon: (QIcon)icon
{
	toQt(self)->setIcon(icon);
}

- (of_dimension_t)iconSize
{
	return toOF(toQt(self)->iconSize());
}

- (void)setIconSize: (of_dimension_t)iconSize
{
	toQt(self)->setIconSize(toQt(iconSize));
}

- (QKeySequence)shortcut
{
	return toQt(self)->shortcut();
}

- (void)setShortcut: (QKeySequence)shortcut
{
	toQt(self)->setShortcut(shortcut);
}

- (OFString*)text
{
	return toOF(toQt(self)->text());
}

- (void)setText: (OFString*)text
{
	toQt(self)->setText(toQt(text));
}

- (QButtonGroup*)group
{
	return toQt(self)->group();
}
@end
