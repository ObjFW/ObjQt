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

#import "QtWidget.h"
#import "QtAction.h"

#import "helpers.h"

#include <QIcon>
#include <QLocale>

@implementation QtWidget
+ (void)initialize
{
	if (self == [QtWidget class])
		[self inheritMethodsFromClass: [QtPaintDevice class]];
}

- initWithQObject: (QObject*)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQWidget: (QWidget*)qWidget
{
	return [super initWithQObject: qWidget];
}

- (QWidget*)qWidget
{
	return qobject_cast<QWidget*>(_qObject);
}

- (bool)acceptDrops
{
	return [self qWidget]->acceptDrops();
}

- (void)setAcceptDrops: (bool)acceptDrops
{
	[self qWidget]->setAcceptDrops(acceptDrops);
}

- (OFString*)accessibleDescription
{
	return toOF([self qWidget]->accessibleDescription());
}

- (void)setAccessibleDescription: (OFString*)accessibleDescription
{
	[self qWidget]->setAccessibleDescription(toQt(accessibleDescription));
}

- (OFString*)accessibleName
{
	return toOF([self qWidget]->accessibleName());
}

- (void)setAccessibleName: (OFString*)accessibleName
{
	[self qWidget]->setAccessibleName(toQt(accessibleName));
}

- (bool)autoFillBackground
{
	return [self qWidget]->autoFillBackground();
}

- (void)setAutoFillBackground: (bool)autoFillBackground
{
	[self qWidget]->setAutoFillBackground(autoFillBackground);
}

- (of_dimension_t)baseSize
{
	return toOF([self qWidget]->baseSize());
}

- (void)setBaseSize: (of_dimension_t)baseSize
{
	[self qWidget]->setBaseSize(toQt(baseSize));
}

- (of_rectangle_t)childrenRect
{
	return toOF([self qWidget]->childrenRect());
}

- (QRegion)childrenRegion
{
	return [self qWidget]->childrenRegion();
}

- (Qt::ContextMenuPolicy)contextMenuPolicy
{
	return [self qWidget]->contextMenuPolicy();
}

- (void)setContextMenuPolicy: (Qt::ContextMenuPolicy)contextMenuPolicy
{
	[self qWidget]->setContextMenuPolicy(contextMenuPolicy);
}

- (QCursor)cursor
{
	return [self qWidget]->cursor();
}

- (void)setCursor: (QCursor)cursor
{
	[self qWidget]->setCursor(cursor);
}

- (void)unsetCursor
{
	[self qWidget]->unsetCursor();
}

- (bool)isEnabled
{
	return [self qWidget]->isEnabled();
}

- (void)setEnabled: (bool)enabled
{
	[self qWidget]->setEnabled(enabled);
}

- (bool)hasFocus
{
	return [self qWidget]->hasFocus();
}

- (Qt::FocusPolicy)focusPolicy
{
	return [self qWidget]->focusPolicy();
}

- (void)setFocusPolicy: (Qt::FocusPolicy)focusPolicy
{
	[self qWidget]->setFocusPolicy(focusPolicy);
}

- (const QFont&)font
{
	return [self qWidget]->font();
}

- (void)setFont: (const QFont&)font
{
	[self qWidget]->setFont(font);
}

- (of_rectangle_t)frameGeometry
{
	return toOF([self qWidget]->frameGeometry());
}

- (of_dimension_t)frameSize
{
	return toOF([self qWidget]->frameSize());
}

- (bool)isFullScreen
{
	return [self qWidget]->isFullScreen();
}

- (of_rectangle_t)geometry
{
	return toOF([self qWidget]->geometry());
}

- (void)setGeometry: (of_rectangle_t)geometry
{
	[self qWidget]->setGeometry(toQt(geometry));
}

- (int)height
{
	return [self qWidget]->height();
}

- (Qt::InputMethodHints)inputMethodHints
{
	return [self qWidget]->inputMethodHints();
}

- (void)setInputMethodHints: (Qt::InputMethodHints)inputMethodHints
{
	[self qWidget]->setInputMethodHints(inputMethodHints);
}

- (bool)isActiveWindow
{
	return [self qWidget]->isActiveWindow();
}

- (Qt::LayoutDirection)layoutDirection
{
	return [self qWidget]->layoutDirection();
}

- (void)setLayoutDirection: (Qt::LayoutDirection)layoutDirection
{
	[self qWidget]->setLayoutDirection(layoutDirection);
}

- (void)unsetLayoutDirection
{
	[self qWidget]->unsetLayoutDirection();
}

- (QLocale)locale
{
	return [self qWidget]->locale();
}

- (void)setLocale: (QLocale)locale
{
	[self qWidget]->setLocale(locale);
}

- (void)unsetLocale
{
	[self qWidget]->unsetLocale();
}

- (bool)isMaximized
{
	return [self qWidget]->isMaximized();
}

- (int)maximumHeight
{
	return [self qWidget]->maximumHeight();
}

- (void)setMaximumHeight: (int)maximumHeight
{
	[self qWidget]->setMaximumHeight(maximumHeight);
}

- (of_dimension_t)maximumSize
{
	return toOF([self qWidget]->maximumSize());
}

- (void)setMaximumSize: (of_dimension_t)maximumSize
{
	[self qWidget]->setMaximumSize(toQt(maximumSize));
}

- (int)maximumWidth
{
	return [self qWidget]->maximumWidth();
}

- (void)setMaximumWidth: (int)maximumWidth
{
	[self qWidget]->setMaximumWidth(maximumWidth);
}

- (bool)isMinimized
{
	return [self qWidget]->isMinimized();
}

- (int)minimumHeight
{
	return [self qWidget]->minimumHeight();
}

- (void)setMinimumHeight: (int)minimumHeight
{
	[self qWidget]->setMinimumHeight(minimumHeight);
}

- (of_dimension_t)minimumSize
{
	return toOF([self qWidget]->minimumSize());
}

- (void)setMinimumSize: (of_dimension_t)minimumSize
{
	[self qWidget]->setMinimumSize(toQt(minimumSize));
}

- (of_dimension_t)minimumSizeHint
{
	return toOF([self qWidget]->minimumSizeHint());
}

- (int)minimumWidth
{
	return [self qWidget]->minimumWidth();
}

- (void)setMinimumWidth: (int)minimumWidth
{
	[self qWidget]->setMinimumWidth(minimumWidth);
}

- (bool)isModal
{
	return [self qWidget]->isModal();
}

- (bool)hasMouseTracking
{
	return [self qWidget]->hasMouseTracking();
}

- (void)setMouseTracking: (bool)mouseTracking
{
	[self qWidget]->setMouseTracking(mouseTracking);
}

- (of_rectangle_t)normalGeometry
{
	return toOF([self qWidget]->normalGeometry());
}

- (const QPalette&)palette
{
	return [self qWidget]->palette();
}

- (void)setPalette: (const QPalette&)palette
{
	[self qWidget]->setPalette(palette);
}

- (of_point_t)pos
{
	return toOF([self qWidget]->pos());
}

- (void)moveToPosition: (of_point_t)pos
{
	[self qWidget]->move(toQt(pos));
}

- (of_rectangle_t)rect
{
	return toOF([self qWidget]->rect());
}

- (of_dimension_t)size
{
	return toOF([self qWidget]->size());
}

- (void)resizeTo: (of_dimension_t)size
{
	[self qWidget]->resize(toQt(size));
}

- (of_dimension_t)sizeHint
{
	return toOF([self qWidget]->sizeHint());
}

- (of_dimension_t)sizeIncrement
{
	return toOF([self qWidget]->sizeIncrement());
}

- (void)setSizeIncrement: (of_dimension_t)sizeIncrement
{
	[self qWidget]->setSizeIncrement(toQt(sizeIncrement));
}

- (QSizePolicy)sizePolicy
{
	return [self qWidget]->sizePolicy();
}

- (void)setSizePolicy: (QSizePolicy)sizePolicy
{
	[self qWidget]->setSizePolicy(sizePolicy);
}

- (OFString*)statusTip
{
	return toOF([self qWidget]->statusTip());
}

- (void)setStatusTip: (OFString*)statusTip
{
	[self qWidget]->setStatusTip(toQt(statusTip));
}

- (OFString*)styleSheet
{
	return toOF([self qWidget]->styleSheet());
}

- (void)setStyleSheet: (OFString*)styleSheet
{
	[self qWidget]->setStyleSheet(toQt(styleSheet));
}

- (OFString*)toolTip
{
	return toOF([self qWidget]->toolTip());
}

- (void)setToolTip: (OFString*)toolTip
{
	[self qWidget]->setToolTip(toQt(toolTip));
}

- (int)toolTipDuration
{
	return [self qWidget]->toolTipDuration();
}

- (void)setToolTipDuration: (int)toolTipDuration
{
	[self qWidget]->setToolTipDuration(toolTipDuration);
}

- (bool)updatesEnabled
{
	return [self qWidget]->updatesEnabled();
}

- (void)setUpdatesEnabled: (bool)updatesEnabled
{
	[self qWidget]->setUpdatesEnabled(updatesEnabled);
}

- (bool)isVisible
{
	return [self qWidget]->isVisible();
}

- (void)setVisible: (bool)visible
{
	[self qWidget]->setVisible(visible);
}

- (OFString*)whatsThis
{
	return toOF([self qWidget]->whatsThis());
}

- (void)setWhatsThis: (OFString*)whatsThis
{
	[self qWidget]->setWhatsThis(toQt(whatsThis));
}

- (int)width
{
	return [self qWidget]->width();
}

- (OFString*)windowFilePath
{
	return toOF([self qWidget]->windowFilePath());
}

- (void)setWindowFilePath: (OFString*)windowFilePath
{
	[self qWidget]->setWindowFilePath(toQt(windowFilePath));
}

- (Qt::WindowFlags)windowFlags
{
	return [self qWidget]->windowFlags();
}

- (void)setWindowFlags: (Qt::WindowFlags)windowFlags
{
	[self qWidget]->setWindowFlags(windowFlags);
}

- (QIcon)windowIcon
{
	return [self qWidget]->windowIcon();
}

- (void)setWindowIcon: (QIcon)windowIcon
{
	[self qWidget]->setWindowIcon(windowIcon);
}

- (Qt::WindowModality)windowModality
{
	return [self qWidget]->windowModality();
}

- (void)setWindowModality: (Qt::WindowModality)windowModality
{
	[self qWidget]->setWindowModality(windowModality);
}

- (bool)isWindowModified
{
	return [self qWidget]->isWindowModified();
}

- (void)setWindowModified: (bool)windowModified
{
	[self qWidget]->setWindowModified(windowModified);
}

- (double)windowOpacity
{
	return [self qWidget]->windowOpacity();
}

- (void)setWindowOpacity: (double)windowOpacity
{
	[self qWidget]->setWindowOpacity(windowOpacity);
}

- (OFString*)windowTitle
{
	return toOF([self qWidget]->windowTitle());
}

- (void)setWindowTitle: (OFString*)windowTitle
{
	[self qWidget]->setWindowTitle(toQt(windowTitle));
}

- (int)x
{
	return [self qWidget]->x();
}

- (int)y
{
	return [self qWidget]->y();
}

- (OFArray OF_GENERIC(QtAction*)*)actions
{
	const QList<QAction*> &actions = [self qWidget]->actions();
	OFMutableArray *ret =
	    [OFMutableArray arrayWithCapacity: actions.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QAction *action: actions)
		[ret addObject:
		    [[[QtAction alloc] initWithQAction: action] autorelease]];

	[ret makeImmutable];

	objc_autoreleasePoolPop(pool);

	return ret;
}

- (void)activateWindow
{
	[self qWidget]->activateWindow();
}

- (void)addAction: (QtAction*)action
{
	[self qWidget]->addAction([action qAction]);
}

- (void)addActions: (OFArray OF_GENERIC(QtAction*)*)actions
{
	QList<QAction*> list;

	for (QtAction *action in actions)
		list.append([action qAction]);

	[self qWidget]->addActions(list);
}

- (void)adjustSize
{
	[self qWidget]->adjustSize();
}

- (QPalette::ColorRole)backgroundRole
{
	return [self qWidget]->backgroundRole();
}

- (QBackingStore*)backingStore
{
	return [self qWidget]->backingStore();
}

- (QtWidget*)childAt: (of_point_t)point
{
	return [[[QtWidget alloc] initWithQWidget:
	    [self qWidget]->childAt(toQt(point))] autorelease];
}

- (void)clearFocus
{
	return [self qWidget]->clearFocus();
}

- (void)clearMask
{
	[self qWidget]->clearMask();
}

- (QMargins)contentsMargins
{
	return [self qWidget]->contentsMargins();
}

- (of_rectangle_t)contentsRect
{
	return toOF([self qWidget]->contentsRect());
}

- (WId)effectiveWinId
{
	return [self qWidget]->effectiveWinId();
}

- (void)ensurePolished
{
	[self qWidget]->ensurePolished();
}

- (QtWidget*)focusProxy
{
	return [[[QtWidget alloc] initWithQWidget:
	    [self qWidget]->focusProxy()] autorelease];
}

- (QtWidget*)focusWidget
{
	return [[[QtWidget alloc] initWithQWidget:
	    [self qWidget]->focusWidget()] autorelease];
}

- (QFontInfo)fontInfo
{
	return [self qWidget]->fontInfo();
}

- (QFontMetrics)fontMetrics
{
	return [self qWidget]->fontMetrics();
}

- (QPalette::ColorRole)foregroundRole
{
	return [self qWidget]->foregroundRole();
}

- (QPixmap)grabRectangle: (of_rectangle_t)rectangle
{
	return [self qWidget]->grab(toQt(rectangle));
}

- (void)grabGesture: (Qt::GestureType)gesture
{
	[self qWidget]->grabGesture(gesture);
}

- (void)grabGesture: (Qt::GestureType)gesture
	      flags: (Qt::GestureFlags)flags
{
	[self qWidget]->grabGesture(gesture, flags);
}

- (void)grabKeyboard
{
	[self qWidget]->grabKeyboard();
}

- (void)grabMouse
{
	[self qWidget]->grabMouse();
}

- (void)grabMouseWithCursor: (const QCursor&)cursor
{
	[self qWidget]->grabMouse(cursor);
}

- (int)grabShortcutWithKey: (const QKeySequence&)key
{
	return [self qWidget]->grabShortcut(key);
}

- (int)grabShortcutWithKey: (const QKeySequence&)key
		   context: (Qt::ShortcutContext)context
{
	return [self qWidget]->grabShortcut(key, context);
}

- (QGraphicsEffect*)graphicsEffect
{
	return [self qWidget]->graphicsEffect();
}

- (QGraphicsProxyWidget*)graphicsProxyWidget
{
	return [self qWidget]->graphicsProxyWidget();
}

#ifdef QT_KEYPAD_NAVIGATION
- (bool)hasEditFocus
{
	return [self qWidget]->hasEditFocus();
}
#endif

- (bool)hasHeightForWidth
{
	return [self qWidget]->hasHeightForWidth();
}

- (int)heightForWidth: (int)w
{
	return [self qWidget]->heightForWidth(w);
}

- (QVariant)queryInputMethod: (Qt::InputMethodQuery)query
{
	return [self qWidget]->inputMethodQuery(query);
}

- (void)insertAction: (QtAction*)action
	      before: (QtAction*)before
{
	[self qWidget]->insertAction([before qAction], [action qAction]);
}

- (void)insertActions: (OFArray OF_GENERIC(QtAction*)*)actions
	       before: (QtAction*)before
{
	QList<QAction*> list;

	for (QtAction *action in actions)
		list.append([action qAction]);

	[self qWidget]->insertActions([before qAction], list);
}

- (bool)isAncestorOf: (QtWidget*)child
{
	return [self qWidget]->isAncestorOf([child qWidget]);
}

- (bool)isEnabledTo: (QtWidget*)ancestor
{
	return [self qWidget]->isEnabledTo([ancestor qWidget]);
}

- (bool)isHidden
{
	return [self qWidget]->isHidden();
}

- (bool)isVisibleTo: (QtWidget*)ancestor
{
	return [self qWidget]->isVisibleTo([ancestor qWidget]);
}

- (bool)isWindow
{
	return [self qWidget]->isWindow();
}
@end
