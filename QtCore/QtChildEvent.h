#import "QtEvent.h"

@class QtObject;

@interface QtChildEvent: QtEvent
@property (readonly) QChildEvent *qChildEvent;
@property (readonly, getter=isAdded) bool added;
@property (readonly, retain) QtObject *child;
@property (readonly, getter=isPolished) bool polished;
@property (readonly, getter=isRemoved) bool removed;

- initWithQChildEvent: (QChildEvent*)qChildEvent;
- initWithType: (QChildEvent::Type)type
	 child: (QtObject*)child;
@end
