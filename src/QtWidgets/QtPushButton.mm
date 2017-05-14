/*
 * Copyright (c) 2017, Maximilian Schander <max-schander@freenet.de>
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

#import "QtPushButton.h"
#import "OFString+QString.h"

#import "helpers.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtPushButton
- initWithQAbstractButton: (QAbstractButton *)qAbstractButton
{
	OF_INVALID_INIT_METHOD
}

- initWithQPushButton: (QPushButton *)qPushButton
{
	return [super initWithQAbstractButton: qPushButton];
}

- initWithText: (OFString *)text
{
	try {
		self = [self initWithQPushButton:
		    new QPushButton(toQt(text))];

		[self takeOwnership];

		return self;
	} catch (const std::bad_alloc &e) {
		self = [self initWithQPushButton: NULL];
		[self release];
		throw;
	}
}

- initWithIcon: (QIcon)icon
	  text: (OFString *)text
{
	try {
		self = [self initWithQPushButton:
		    new QPushButton(icon, toQt(text))];

		[self takeOwnership];

		return self;
	} catch (const std::bad_alloc &e) {
		self = [self initWithQPushButton: NULL];
		[self release];
		throw;
	}
}

- (QPushButton *)qPushButton
{
	return qobject_cast<QPushButton *>(_qObject);
}

- (QMenu *)menu
{
	return toQt(self)->menu();
}

- (void)setMenu: (QMenu *)menu
{
	toQt(self)->setMenu(menu);
}

- (bool)autoDefault
{
	return toQt(self)->autoDefault();
}

- (void)setAutoDefault: (bool)autodefault
{
	toQt(self)->setAutoDefault(autodefault);
}

- (bool)isDefault
{
	return toQt(self)->isDefault();
}

- (void)setDefault: (bool)def
{
	toQt(self)->setDefault(def);
}

- (bool)isFlat
{
	return toQt(self)->isFlat();
}

- (void)setFlat: (bool)flat
{
	toQt(self)->setFlat(flat);
}
@end
