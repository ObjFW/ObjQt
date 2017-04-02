#import <ObjFW/ObjFW.h>

#import "QtOwnershipManaging.h"

#include <QEvent>

@interface QtEvent: OFObject <QtOwnershipManaging>
{
	QEvent *_qEvent;
	bool _ownsEvent;
}

@property (readonly) QEvent *qEvent;
@property (getter=isAccepted) bool accepted;
@property (readonly, getter=isSpontaneous) bool spontaneous;
@property (readonly) QEvent::Type type;

+ (int)registerEventType: (int)hint;
- initWithQEvent: (QEvent*)qEvent;
- (void)accept;
- (void)ignore;
@end
