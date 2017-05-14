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

#import <ObjFW/ObjFW.h>

#import "QtOwnershipManaging.h"

#include <QEvent>

@interface QtEvent: OFObject <QtOwnershipManaging>
{
	QEvent *_qEvent;
	bool _ownsEvent;
}

@property (readonly, nonatomic) QEvent *qEvent;
@property (nonatomic, getter=isAccepted) bool accepted;
@property (readonly, nonatomic, getter=isSpontaneous) bool spontaneous;
@property (readonly, nonatomic) QEvent::Type type;

+ (int)registerEventType: (int)hint;
- init OF_UNAVAILABLE;
- initWithQEvent: (QEvent *)qEvent;
- (void)accept;
- (void)ignore;
@end

namespace ObjQt {

static OF_INLINE QtEvent *
toOF(QEvent *qEvent)
{
	return [[[QtEvent alloc] initWithQEvent: qEvent] autorelease];
}

static OF_INLINE QEvent *
toQt(QtEvent *event)
{
	return [event qEvent];
}

}
