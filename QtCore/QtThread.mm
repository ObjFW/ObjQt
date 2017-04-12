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

#import "QtThread.h"

@implementation QtThread: QtObject
- initWithQObject: (QObject*)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQThread: (QThread*)qThread
{
	return [super initWithQObject: qThread];
}

- (QThread*)qThread
{
	return qobject_cast<QThread*>(_qObject);
}

- (QAbstractEventDispatcher*)eventDispatcher
{
	return [self qThread]->eventDispatcher();
}

- (void)setEventDispatcher: (QAbstractEventDispatcher*)eventDispatcher
{
	[self qThread]->setEventDispatcher(eventDispatcher);
}

- (void)exitWithReturnCode: (int)returnCode
{
	[self qThread]->exit(returnCode);
}

- (bool)isFinished
{
	return [self qThread]->isFinished();
}

- (bool)isInterruptionRequested
{
	return [self qThread]->isInterruptionRequested();
}

- (bool)isRunning
{
	return [self qThread]->isRunning();
}

- (int)loopLevel
{
	return [self qThread]->loopLevel();
}

- (QThread::Priority)priority
{
	return [self qThread]->priority();
}

- (void)setPriority: (QThread::Priority)priority
{
	[self qThread]->setPriority(priority);
}

- (void)requestInterruption
{
	[self qThread]->requestInterruption();
}

- (unsigned int)stackSize
{
	return [self qThread]->stackSize();
}

- (void)setStackSize: (unsigned int)stackSize
{
	[self qThread]->setStackSize(stackSize);
}

- (bool)waitForMilliseconds: (unsigned long)time
{
	return [self qThread]->wait(time);
}

- (void)quit
{
	[self qThread]->quit();
}

- (void)startWithPriority: (QThread::Priority)priority
{
	[self qThread]->start(priority);
}

- (void)terminate
{
	[self qThread]->terminate();
}
@end
