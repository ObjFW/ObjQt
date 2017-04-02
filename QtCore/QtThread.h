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

- initWithQThread: (QThread*)qThread;
- (void)exitWithReturnCode: (int)returnCode;
- (void)requestInterruption;
- (bool)waitForMilliseconds: (unsigned long)time;
- (void)quit;
- (void)startWithPriority: (QThread::Priority)priority;
- (void)terminate;
@end
