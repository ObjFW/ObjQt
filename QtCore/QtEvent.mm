#import "QtEvent.h"

@implementation QtEvent
@synthesize qEvent = _eEvent;

+ (int)registerEventType: (int)hint
{
	return QEvent::registerEventType(hint);
}

- init
{
	OF_INVALID_INIT_METHOD
}

- initWithQEvent: (QEvent*)qEvent
{
	self = [super init];

	_qEvent = qEvent;

	return self;
}

- (void)dealloc
{
	if (_ownsEvent)
		delete _qEvent;

	[super dealloc];
}

- (void)takeOwnership
{
	OF_ENSURE(!_ownsEvent);
	_ownsEvent = true;
}

- (void)giveUpOwnership
{
	OF_ENSURE(_ownsEvent);
	_ownsEvent = false;
}

- (void)accept
{
	_qEvent->accept();
}

- (void)ignore
{
	_qEvent->ignore();
}

- (bool)isAccepted
{
	return _qEvent->isAccepted();
}

- (void)setAccepted: (bool)accepted
{
	_qEvent->setAccepted(accepted);
}

- (bool)isSpontaneous
{
	return _qEvent->spontaneous();
}

- (QEvent::Type)type
{
	return _qEvent->type();
}
@end
