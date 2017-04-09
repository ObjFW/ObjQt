#import <ObjFW/ObjFW.h>

#include <QString>

@interface OFString (QString)
+ (instancetype)stringWithQString: (const QString&)qString;
- initWithQString: (const QString&)qString;
- (QString)qString;
@end
