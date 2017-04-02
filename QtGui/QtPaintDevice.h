#import <ObjFW/ObjFW.h>

#include <QPaintDevice>

@protocol QtPaintDevice
- (QPaintDevice*)qPaintDevice;
- (int)colorCount;
- (int)depth;
- (int)devicePixelRatio;
- (double)devicePixelRatioF;
- (int)height;
- (int)heightMM;
- (int)logicalDPIX;
- (int)logicalDPIY;
- (QPaintEngine*)paintEngine;
- (bool)paintingActive;
- (int)physicalDPIX;
- (int)physicalDPIY;
- (int)width;
- (int)widthMM;
@end

@interface QtPaintDevice: OFObject <QtPaintDevice>
@property (readonly) QObject *qObject;
@end
