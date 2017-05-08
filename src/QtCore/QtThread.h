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

#import "QtObject.h"

#include <QThread>

@interface QtThread: QtObject
@property (readonly) QThread *qThread;
@property QAbstractEventDispatcher *eventDispatcher;
@property (readonly, getter=isFinished) bool finished;
@property (readonly, getter=isInterruptionRequested) bool interruptionRequested;
@property (readonly, getter=isRunning) bool running;
@property (readonly) int loopLevel;
@property QThread::Priority priority;
@property unsigned int stackSize;

- initWithQObject: (QObject *)qObject OF_UNAVAILABLE;
- initWithQThread: (QThread *)qThread;
- (void)exitWithReturnCode: (int)returnCode;
- (void)requestInterruption;
- (bool)waitForMilliseconds: (unsigned long)time;
- (void)quit;
- (void)startWithPriority: (QThread::Priority)priority;
- (void)terminate;
@end

namespace ObjQt {

static OF_INLINE QtThread *
toOF(QThread *qThread)
{
	return [[[QtThread alloc] initWithQThread: qThread] autorelease];
}

static OF_INLINE QThread *
toQt(QtThread *thread)
{
	return [thread qThread];
}

}
