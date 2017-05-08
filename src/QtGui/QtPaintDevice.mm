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

#import "QtPaintDevice.h"

#include <QObject>

using ObjQt::toQt;

@implementation QtPaintDevice
@dynamic qObject;

- (QPaintDevice *)qPaintDevice
{
	return dynamic_cast<QPaintDevice *>([self qObject]);
}

- (int)colorCount
{
	return toQt(self)->colorCount();
}

- (int)depth
{
	return toQt(self)->depth();
}

- (int)devicePixelRatio
{
	return toQt(self)->devicePixelRatio();
}

#if QT_VERSION >= QT_VERSION_CHECK(5, 7, 0)
- (double)devicePixelRatioF
{
	return toQt(self)->devicePixelRatioF();
}
#endif

- (int)height
{
	return toQt(self)->height();
}

- (int)heightMM
{
	return toQt(self)->heightMM();
}

- (int)logicalDPIX
{
	return toQt(self)->logicalDpiX();
}

- (int)logicalDPIY
{
	return toQt(self)->logicalDpiY();
}

- (QPaintEngine *)paintEngine
{
	return toQt(self)->paintEngine();
}

- (bool)paintingActive
{
	return toQt(self)->paintingActive();
}

- (int)physicalDPIX
{
	return toQt(self)->physicalDpiX();
}

- (int)physicalDPIY
{
	return toQt(self)->physicalDpiY();
}

- (int)width
{
	return toQt(self)->width();
}

- (int)widthMM
{
	return toQt(self)->widthMM();
}
@end
