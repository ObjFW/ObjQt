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

#include "QtGraphicsWidget.h"
#import "OFString+QString.h"

#import "helpers.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtGraphicsObject
@end

@implementation QtGraphicsWidget

- initWithQObject: (QObject *)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQGraphicsWidget: (QGraphicsWidget *)qGraphicsWidget
{
	return [super initWithQObject: qGraphicsWidget];
}

- (QGraphicsWidget *)qGraphicsWidget
{
	return dynamic_cast<QGraphicsWidget *>([self qObject]);
}

- (bool)autoFillBackground
{
	return toQt(self)->autoFillBackground();
}

- (void)setAutoFillBackground: (bool)autoFillBackground
{
	toQt(self)->setAutoFillBackground(autoFillBackground);
}

- (Qt::FocusPolicy)focusPolicy
{
	return toQt(self)->focusPolicy();
}

- (void)setFocusPolicy: (Qt::FocusPolicy)focusPolicy
{
	toQt(self)->setFocusPolicy(focusPolicy);
}

- (of_rectangle_t)geometry
{
	return toOF(toQt(self)->geometry());
}

- (void)setGeometry: (of_rectangle_t)geometry
{
	toQt(self)->setGeometry(toQt(geometry));
}

- (QGraphicsLayout *)layout
{
	return toQt(self)->layout();
}

- (void)setLayout: (QGraphicsLayout *)layout
{
	toQt(self)->setLayout(layout);
}

- (Qt::LayoutDirection)layoutDirection
{
	return toQt(self)->layoutDirection();
}

- (void)setLayoutDirection: (Qt::LayoutDirection)layoutDirection
{
	toQt(self)->setLayoutDirection(layoutDirection);
}

- (of_dimension_t)maximumSize
{
	return toOF(toQt(self)->maximumSize());
}

- (void)setMaximumSize: (of_dimension_t)maximumSize
{
	toQt(self)->setMaximumSize(toQt(maximumSize));
}

- (of_dimension_t)minimumSize
{
	return toOF(toQt(self)->minimumSize());
}

- (void)setMinimumSize: (of_dimension_t)minimumSize
{
	toQt(self)->setMinimumSize(toQt(minimumSize));
}

- (QPalette)palette
{
	return toQt(self)->palette();
}

- (void)setPalette: (QPalette)palette
{
	toQt(self)->setPalette(palette);
}

- (of_dimension_t)preferredSize
{
	return toOF(toQt(self)->preferredSize());
}

- (void)setPreferredSize: (of_dimension_t)preferredSize
{
	toQt(self)->setPreferredSize(toQt(preferredSize));
}

- (of_dimension_t)size
{
	return toOF(toQt(self)->size());
}

- (QSizePolicy)sizePolicy
{
	return toQt(self)->sizePolicy();
}

- (void)setSizePolicy: (QSizePolicy)sizePolicy
{
	toQt(self)->setSizePolicy(sizePolicy);
}

- (Qt::WindowFlags)windowFlags
{
	return toQt(self)->windowFlags();
}

- (void)setWindowFlags: (Qt::WindowFlags)windowFlags
{
	toQt(self)->setWindowFlags(windowFlags);
}

- (OFString *)windowTitle
{
	return toOF(toQt(self)->windowTitle());
}

- (void)setWindowTitle: (OFString *)windowTitle
{
	toQt(self)->setWindowTitle(toQt(windowTitle));
}

- (OFArray OF_GENERIC(QtAction *) *)actions
{
	const QList<QAction *> &actions = toQt(self)->actions();
	OFMutableArray *ret =
	    [OFMutableArray arrayWithCapacity: actions.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QAction *action: actions)
		[ret addObject: toOF(action)];

	[ret makeImmutable];

	objc_autoreleasePoolPop(pool);

	return ret;
}

- (bool)isActiveWindow
{
	return toQt(self)->isActiveWindow();
}

- (QStyle *)style
{
	return toQt(self)->style();
}

- (void)setStyle: (QStyle *)style
{
	toQt(self)->setStyle(style);
}

- (of_rectangle_t)windowFrameGeometry
{
	return toOF(toQt(self)->windowFrameGeometry());
}

- (of_rectangle_t)windowFrameRect
{
	return toOF(toQt(self)->windowFrameRect());
}

- (void)addAction: (QtAction *)action
{
	toQt(self)->addAction(toQt(action));
}

- (void)addActions: (OFArray OF_GENERIC(QtAction *) *)actions
{
	QList<QAction *> list;

	for (QtAction *action in actions)
		list.append(toQt(action));

	toQt(self)->addActions(list);
}

- (void)adjustSize
{
	toQt(self)->adjustSize();
}

- (QtGraphicsWidget *)focusWidget
{
	return toOF(toQt(self)->focusWidget());
}

- (void)getWindowFrameMarginsWithLeft: (qreal *)left
				  top: (qreal *)top
				right: (qreal *)right
			       bottom: (qreal *)bottom
{
	toQt(self)->getWindowFrameMargins(left, top, right, bottom);
}

- (void)setWindowFrameMarginsWithLeft: (qreal)left
				  top: (qreal)top
				right: (qreal)right
			       bottom: (qreal)bottom
{
	toQt(self)->setWindowFrameMargins(left, top, right, bottom);
}

- (void)insertAction: (QtAction *)action
	      before: (QtAction *)before
{
	toQt(self)->insertAction(toQt(before), toQt(action));
}

- (void)insertActions: (OFArray OF_GENERIC(QtAction *) *)actions
	       before: (QtAction *)before
{
	QList<QAction *> list;

	for (QtAction *action in actions)
		list.append(toQt(action));

	toQt(self)->insertActions(toQt(before), list);
}

- (void)paintWindowFrameWithPainter: (QPainter *)painter
			     option: (const QStyleOptionGraphicsItem *)option
			     widget: (QtWidget *)widget
{
	toQt(self)->paintWindowFrame(painter, option, toQt(widget));
}

- (void)releaseShortcut: (int)ID
{
	toQt(self)->releaseShortcut(ID);
}

- (void)removeAction: (QtAction *)action
{
	toQt(self)->removeAction(toQt(action));
}

- (void)resizeTo: (of_dimension_t)size
{
	toQt(self)->resize(toQt(size));
}

- (void)setAttribute: (Qt::WidgetAttribute)attribute
		  to: (bool)on
{
	toQt(self)->setAttribute(attribute, on);
}

- (void)setContentsMarginsWithLeft: (qreal)left
			       top: (qreal)top
			     right: (qreal)right
			    bottom: (qreal)bottom
{
	toQt(self)->setContentsMargins(left, top, right, bottom);
}

- (void)setAutoRepeat: (bool)enabled
	  forShortcut: (int)ID
{
	toQt(self)->setShortcutAutoRepeat(ID, enabled);
}

- (void)setEnabled: (bool)enabled
       forShortcut: (int)ID
{
	toQt(self)->setShortcutEnabled(ID, enabled);
}

- (bool)testAttribute: (Qt::WidgetAttribute)attribute
{
	return toQt(self)->testAttribute(attribute);
}

- (void)unsetLayoutDirection
{
	toQt(self)->unsetLayoutDirection();
}

- (void)unsetWindowFrameMargins
{
	toQt(self)->unsetWindowFrameMargins();
}
@end
