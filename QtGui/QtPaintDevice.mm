#import "QtPaintDevice.h"

#include <QObject>

@implementation QtPaintDevice
@dynamic qObject;

- (QPaintDevice*)qPaintDevice
{
	return dynamic_cast<QPaintDevice*>([self qObject]);
}

- (int)colorCount
{
	return [self qPaintDevice]->colorCount();
}

- (int)depth
{
	return [self qPaintDevice]->depth();
}

- (int)devicePixelRatio
{
	return [self qPaintDevice]->devicePixelRatio();
}

- (double)devicePixelRatioF
{
	return [self qPaintDevice]->devicePixelRatioF();
}

- (int)height
{
	return [self qPaintDevice]->height();
}

- (int)heightMM
{
	return [self qPaintDevice]->heightMM();
}

- (int)logicalDPIX
{
	return [self qPaintDevice]->logicalDpiX();
}

- (int)logicalDPIY
{
	return [self qPaintDevice]->logicalDpiY();
}

- (QPaintEngine*)paintEngine
{
	return [self qPaintDevice]->paintEngine();
}

- (bool)paintingActive
{
	return [self qPaintDevice]->paintingActive();
}

- (int)physicalDPIX
{
	return [self qPaintDevice]->physicalDpiX();
}

- (int)physicalDPIY
{
	return [self qPaintDevice]->physicalDpiY();
}

- (int)width
{
	return [self qPaintDevice]->width();
}

- (int)widthMM
{
	return [self qPaintDevice]->widthMM();
}
@end
