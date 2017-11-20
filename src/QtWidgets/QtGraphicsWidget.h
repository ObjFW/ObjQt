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

#include <QGraphicsWidget>

#import "QtAction.h"
#import "QtObject.h"   // TODO: Remove

// TODO: Remove once QtGraphicsObject is bound
@interface QtGraphicsObject: QtObject
@end

@interface QtGraphicsWidget: QtGraphicsObject
@property (readonly, nonatomic) QGraphicsWidget *qGraphicsWidget;
@property (nonatomic) bool autoFillBackground;
@property (nonatomic) Qt::FocusPolicy focusPolicy;
@property (nonatomic) of_rectangle_t geometry;
@property (nonatomic) QGraphicsLayout *layout;
@property (nonatomic) Qt::LayoutDirection layoutDirection;
@property (nonatomic) of_dimension_t maximumSize;
@property (nonatomic) of_dimension_t minimumSize;
@property (nonatomic) QPalette palette;
@property (nonatomic) of_dimension_t preferredSize;
@property (readonly, nonatomic) of_dimension_t size;
@property (nonatomic) QSizePolicy sizePolicy;
@property (nonatomic) Qt::WindowFlags windowFlags;
@property (copy, nonatomic) OFString *windowTitle;
@property (readonly, nonatomic) OFArray OF_GENERIC(QtAction *) *actions;
@property (readonly, nonatomic) bool isActiveWindow;
@property (nonatomic) QStyle *style;
@property (readonly, nonatomic) of_rectangle_t windowFrameGeometry;
@property (readonly, nonatomic) of_rectangle_t windowFrameRect;

- initWithQObject: (QObject *)qObject OF_UNAVAILABLE;
- initWithQGraphicsWidget: (QGraphicsWidget *)qGraphicsWidget
    OF_DESIGNATED_INITIALIZER;
- (void)addAction: (QtAction *)action;
- (void)addActions: (OFArray OF_GENERIC(QtAction *) *)actions;
- (void)adjustSize;
- (QtGraphicsWidget *)focusWidget;
- (void)getWindowFrameMarginsWithLeft: (qreal *)left
				  top: (qreal *)top
				right: (qreal *)right
			       bottom: (qreal *)bottom;
- (void)setWindowFrameMarginsWithLeft: (qreal)left
				  top: (qreal)top
				right: (qreal)right
			       bottom: (qreal)bottom;
- (void)insertAction: (QtAction *)action
	      before: (QtAction *)before;
- (void)insertActions: (OFArray OF_GENERIC(QtAction *) *)actions
	       before: (QtAction *)before;
- (void)paintWindowFrameWithPainter: (QPainter *)painter
			     option: (const QStyleOptionGraphicsItem *)option
			     widget: (QtWidget *)widget;
- (void)releaseShortcut: (int)ID;
- (void)removeAction: (QtAction *)action;
- (void)resizeTo: (of_dimension_t)size;
- (void)setAttribute: (Qt::WidgetAttribute)attribute
		  to: (bool)on;
- (void)setContentsMarginsWithLeft: (qreal)left
			       top: (qreal)top
			     right: (qreal)right
			    bottom: (qreal)bottom;
- (void)setAutoRepeat: (bool)enabled
	  forShortcut: (int)ID;
- (void)setEnabled: (bool)enabled
       forShortcut: (int)ID;
- (bool)testAttribute: (Qt::WidgetAttribute)attribute;
- (void)unsetLayoutDirection;
- (void)unsetWindowFrameMargins;
@end

namespace ObjQt {

static OF_INLINE QtGraphicsWidget *
toOF(QGraphicsWidget *qGraphicsWidget)
{
	if (qGraphicsWidget == NULL)
		return nil;

	return [[[QtGraphicsWidget alloc]
	    initWithQGraphicsWidget: qGraphicsWidget] autorelease];
}

static OF_INLINE QGraphicsWidget *
toQt(QtGraphicsWidget *graphicsWidget)
{
	return [graphicsWidget qGraphicsWidget];
}

}
