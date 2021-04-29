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

#import <ObjFW/ObjFW.h>

#include <QSize>
#include <QRect>

#import "QtObject.h"
#import "QtAction.h"
#import "QtEvent.h"
#import "QtChildEvent.h"
#import "QtThread.h"
#import "QtWidget.h"

namespace ObjQt {

static OF_INLINE OFPoint
toOF(const QPoint &qPoint)
{
	return OFPointMake(qPoint.x(), qPoint.y());
}

static OF_INLINE QPoint
toQt(const OFPoint &point)
{
	return QPoint(point.x, point.y);
}

static OF_INLINE OFSize
toOF(const QSize &qSize)
{
	return OFSizeMake(qSize.width(), qSize.height());
}

static OF_INLINE OFSize
toOF(const QSizeF &qSizeF)
{
	return OFSizeMake(qSizeF.width(), qSizeF.height());
}

static OF_INLINE QSizeF
toQt(const OFSize &dimension)
{
	return QSizeF(dimension.width, dimension.height);
}

static OF_INLINE OFRect
toOF(const QRect &qRect)
{
	return OFRectMake(qRect.x(), qRect.y(), qRect.width(), qRect.height());
}

static OF_INLINE OFRect
toOF(const QRectF &qRectF)
{
	return OFRectMake(qRectF.x(), qRectF.y(),
	    qRectF.width(), qRectF.height());
}

static OF_INLINE QRectF
toQt(const OFRect &rect)
{
	return QRectF(rect.origin.x, rect.origin.y,
	    rect.size.width, rect.size.height);
}

}
