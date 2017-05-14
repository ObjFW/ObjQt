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

#import "QtEvent.h"

@class QtObject;

@interface QtChildEvent: QtEvent
@property (readonly, nonatomic) QChildEvent *qChildEvent;
@property (readonly, nonatomic, getter=isAdded) bool added;
@property (readonly, nonatomic) QtObject *child;
@property (readonly, nonatomic, getter=isPolished) bool polished;
@property (readonly, nonatomic, getter=isRemoved) bool removed;

- initWithQEvent: (QEvent *)event OF_UNAVAILABLE;
- initWithQChildEvent: (QChildEvent *)qChildEvent OF_DESIGNATED_INITIALIZER;
- initWithType: (QChildEvent::Type)type
	 child: (QtObject *)child;
@end

namespace ObjQt {

static OF_INLINE QtChildEvent *
toOF(QChildEvent *qChildEvent)
{
	return [[[QtChildEvent alloc]
	    initWithQChildEvent: qChildEvent] autorelease];
}

static OF_INLINE QChildEvent *
toQt(QtChildEvent *childEvent)
{
	return [childEvent qChildEvent];
}

}
