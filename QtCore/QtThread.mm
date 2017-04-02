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
