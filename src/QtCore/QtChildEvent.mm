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

#import "QtChildEvent.h"
#import "QtObject.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtChildEvent
- initWithQEvent: (QEvent *)event
{
	OF_INVALID_INIT_METHOD
}

- initWithQChildEvent: (QChildEvent *)event
{
	return [super initWithQEvent: event];
}

- initWithType: (QChildEvent::Type)type
	 child: (QtObject *)child
{
	try {
		self = [self initWithQChildEvent:
		    new QChildEvent(type, toQt(child))];

		[self takeOwnership];

		return self;
	} catch (const std::bad_alloc &e) {
		self = [super initWithQEvent: NULL];
		[self release];
		throw;
	}
}

- (QChildEvent *)qChildEvent
{
	return dynamic_cast<QChildEvent *>(_qEvent);
}

- (bool)isAdded
{
	return toQt(self)->added();
}

- (QtObject *)child
{
	return toOF(toQt(self)->child());
}

- (bool)isPolished
{
	return toQt(self)->polished();
}

- (bool)isRemoved
{
	return toQt(self)->removed();
}
@end
