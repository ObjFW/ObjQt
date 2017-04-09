#import "QtChildEvent.h"
#import "QtObject.h"

@implementation QtChildEvent
- initWithQEvent: (QEvent*)event
{
	OF_INVALID_INIT_METHOD
}

- initWithQChildEvent: (QChildEvent*)event
{
	return [super initWithQEvent: event];
}

- initWithType: (QChildEvent::Type)type
	 child: (QtObject*)child
{
	try {
		self = [self initWithQChildEvent:
		    new QChildEvent(type, [child qObject])];

		[self takeOwnership];

		return self;
	} catch (const std::bad_alloc &e) {
		self = [super initWithQEvent: NULL];
		[self release];
		throw;
	}
}

- (QChildEvent*)qChildEvent
{
	return dynamic_cast<QChildEvent*>(_qEvent);
}

- (bool)isAdded
{
	return [self qChildEvent]->added();
}

- (QtObject*)child
{
	return [[[QtObject alloc]
	    initWithQObject: [self qChildEvent]->child()] autorelease];
}

- (bool)isPolished
{
	return [self qChildEvent]->polished();
}

- (bool)isRemoved
{
	return [self qChildEvent]->removed();
}
@end
