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
#import "OFString+QString.h"
#import "OFData+QByteArray.h"

#import "helpers.h"

#include <QIcon>
#include <QLocale>

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtWidget
+ (void)initialize
{
	if (self == [QtWidget class])
		[self inheritMethodsFromClass: [QtPaintDevice class]];
}

- initWithQObject: (QObject *)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQWidget: (QWidget *)qWidget
{
	return [super initWithQObject: qWidget];
}

- (QWidget *)qWidget
{
	return qobject_cast<QWidget *>(_qObject);
}

- (bool)acceptDrops
{
	return toQt(self)->acceptDrops();
}

- (void)setAcceptDrops: (bool)acceptDrops
{
	toQt(self)->setAcceptDrops(acceptDrops);
}

- (OFString *)accessibleDescription
{
	return toOF(toQt(self)->accessibleDescription());
}

- (void)setAccessibleDescription: (OFString *)accessibleDescription
{
	toQt(self)->setAccessibleDescription(toQt(accessibleDescription));
}

- (OFString *)accessibleName
{
	return toOF(toQt(self)->accessibleName());
}

- (void)setAccessibleName: (OFString *)accessibleName
{
	toQt(self)->setAccessibleName(toQt(accessibleName));
}

- (bool)autoFillBackground
{
	return toQt(self)->autoFillBackground();
}

- (void)setAutoFillBackground: (bool)autoFillBackground
{
	toQt(self)->setAutoFillBackground(autoFillBackground);
}

- (of_dimension_t)baseSize
{
	return toOF(toQt(self)->baseSize());
}

- (void)setBaseSize: (of_dimension_t)baseSize
{
	toQt(self)->setBaseSize(toQt(baseSize));
}

- (of_rectangle_t)childrenRect
{
	return toOF(toQt(self)->childrenRect());
}

- (QRegion)childrenRegion
{
	return toQt(self)->childrenRegion();
}

- (Qt::ContextMenuPolicy)contextMenuPolicy
{
	return toQt(self)->contextMenuPolicy();
}

- (void)setContextMenuPolicy: (Qt::ContextMenuPolicy)contextMenuPolicy
{
	toQt(self)->setContextMenuPolicy(contextMenuPolicy);
}

- (QCursor)cursor
{
	return toQt(self)->cursor();
}

- (void)setCursor: (QCursor)cursor
{
	toQt(self)->setCursor(cursor);
}

- (void)unsetCursor
{
	toQt(self)->unsetCursor();
}

- (bool)isEnabled
{
	return toQt(self)->isEnabled();
}

- (void)setEnabled: (bool)enabled
{
	toQt(self)->setEnabled(enabled);
}

- (bool)hasFocus
{
	return toQt(self)->hasFocus();
}

- (Qt::FocusPolicy)focusPolicy
{
	return toQt(self)->focusPolicy();
}

- (void)setFocusPolicy: (Qt::FocusPolicy)focusPolicy
{
	toQt(self)->setFocusPolicy(focusPolicy);
}

- (const QFont &)font
{
	return toQt(self)->font();
}

- (void)setFont: (const QFont &)font
{
	toQt(self)->setFont(font);
}

- (of_rectangle_t)frameGeometry
{
	return toOF(toQt(self)->frameGeometry());
}

- (of_dimension_t)frameSize
{
	return toOF(toQt(self)->frameSize());
}

- (bool)isFullScreen
{
	return toQt(self)->isFullScreen();
}

- (of_rectangle_t)geometry
{
	return toOF(toQt(self)->geometry());
}

- (void)setGeometry: (of_rectangle_t)geometry
{
	toQt(self)->setGeometry(toQt(geometry));
}

- (int)height
{
	return toQt(self)->height();
}

- (Qt::InputMethodHints)inputMethodHints
{
	return toQt(self)->inputMethodHints();
}

- (void)setInputMethodHints: (Qt::InputMethodHints)inputMethodHints
{
	toQt(self)->setInputMethodHints(inputMethodHints);
}

- (bool)isActiveWindow
{
	return toQt(self)->isActiveWindow();
}

- (Qt::LayoutDirection)layoutDirection
{
	return toQt(self)->layoutDirection();
}

- (void)setLayoutDirection: (Qt::LayoutDirection)layoutDirection
{
	toQt(self)->setLayoutDirection(layoutDirection);
}

- (void)unsetLayoutDirection
{
	toQt(self)->unsetLayoutDirection();
}

- (QLocale)locale
{
	return toQt(self)->locale();
}

- (void)setLocale: (QLocale)locale
{
	toQt(self)->setLocale(locale);
}

- (void)unsetLocale
{
	toQt(self)->unsetLocale();
}

- (bool)isMaximized
{
	return toQt(self)->isMaximized();
}

- (int)maximumHeight
{
	return toQt(self)->maximumHeight();
}

- (void)setMaximumHeight: (int)maximumHeight
{
	toQt(self)->setMaximumHeight(maximumHeight);
}

- (of_dimension_t)maximumSize
{
	return toOF(toQt(self)->maximumSize());
}

- (void)setMaximumSize: (of_dimension_t)maximumSize
{
	toQt(self)->setMaximumSize(toQt(maximumSize));
}

- (int)maximumWidth
{
	return toQt(self)->maximumWidth();
}

- (void)setMaximumWidth: (int)maximumWidth
{
	toQt(self)->setMaximumWidth(maximumWidth);
}

- (bool)isMinimized
{
	return toQt(self)->isMinimized();
}

- (int)minimumHeight
{
	return toQt(self)->minimumHeight();
}

- (void)setMinimumHeight: (int)minimumHeight
{
	toQt(self)->setMinimumHeight(minimumHeight);
}

- (of_dimension_t)minimumSize
{
	return toOF(toQt(self)->minimumSize());
}

- (void)setMinimumSize: (of_dimension_t)minimumSize
{
	toQt(self)->setMinimumSize(toQt(minimumSize));
}

- (of_dimension_t)minimumSizeHint
{
	return toOF(toQt(self)->minimumSizeHint());
}

- (int)minimumWidth
{
	return toQt(self)->minimumWidth();
}

- (void)setMinimumWidth: (int)minimumWidth
{
	toQt(self)->setMinimumWidth(minimumWidth);
}

- (bool)isModal
{
	return toQt(self)->isModal();
}

- (bool)hasMouseTracking
{
	return toQt(self)->hasMouseTracking();
}

- (void)setMouseTracking: (bool)mouseTracking
{
	toQt(self)->setMouseTracking(mouseTracking);
}

- (of_rectangle_t)normalGeometry
{
	return toOF(toQt(self)->normalGeometry());
}

- (const QPalette &)palette
{
	return toQt(self)->palette();
}

- (void)setPalette: (const QPalette &)palette
{
	toQt(self)->setPalette(palette);
}

- (of_point_t)pos
{
	return toOF(toQt(self)->pos());
}

- (void)moveToPosition: (of_point_t)pos
{
	toQt(self)->move(toQt(pos));
}

- (of_rectangle_t)rect
{
	return toOF(toQt(self)->rect());
}

- (of_dimension_t)size
{
	return toOF(toQt(self)->size());
}

- (void)resizeTo: (of_dimension_t)size
{
	toQt(self)->resize(toQt(size));
}

- (of_dimension_t)sizeHint
{
	return toOF(toQt(self)->sizeHint());
}

- (of_dimension_t)sizeIncrement
{
	return toOF(toQt(self)->sizeIncrement());
}

- (void)setSizeIncrement: (of_dimension_t)sizeIncrement
{
	toQt(self)->setSizeIncrement(toQt(sizeIncrement));
}

- (QSizePolicy)sizePolicy
{
	return toQt(self)->sizePolicy();
}

- (void)setSizePolicy: (QSizePolicy)sizePolicy
{
	toQt(self)->setSizePolicy(sizePolicy);
}

- (OFString *)statusTip
{
	return toOF(toQt(self)->statusTip());
}

- (void)setStatusTip: (OFString *)statusTip
{
	toQt(self)->setStatusTip(toQt(statusTip));
}

- (OFString *)styleSheet
{
	return toOF(toQt(self)->styleSheet());
}

- (void)setStyleSheet: (OFString *)styleSheet
{
	toQt(self)->setStyleSheet(toQt(styleSheet));
}

- (OFString *)toolTip
{
	return toOF(toQt(self)->toolTip());
}

- (void)setToolTip: (OFString *)toolTip
{
	toQt(self)->setToolTip(toQt(toolTip));
}

- (int)toolTipDuration
{
	return toQt(self)->toolTipDuration();
}

- (void)setToolTipDuration: (int)toolTipDuration
{
	toQt(self)->setToolTipDuration(toolTipDuration);
}

- (bool)updatesEnabled
{
	return toQt(self)->updatesEnabled();
}

- (void)setUpdatesEnabled: (bool)updatesEnabled
{
	toQt(self)->setUpdatesEnabled(updatesEnabled);
}

- (bool)isVisible
{
	return toQt(self)->isVisible();
}

- (void)setVisible: (bool)visible
{
	toQt(self)->setVisible(visible);
}

- (OFString *)whatsThis
{
	return toOF(toQt(self)->whatsThis());
}

- (void)setWhatsThis: (OFString *)whatsThis
{
	toQt(self)->setWhatsThis(toQt(whatsThis));
}

- (int)width
{
	return toQt(self)->width();
}

- (OFString *)windowFilePath
{
	return toOF(toQt(self)->windowFilePath());
}

- (void)setWindowFilePath: (OFString *)windowFilePath
{
	toQt(self)->setWindowFilePath(toQt(windowFilePath));
}

- (Qt::WindowFlags)windowFlags
{
	return toQt(self)->windowFlags();
}

- (void)setWindowFlags: (Qt::WindowFlags)windowFlags
{
	toQt(self)->setWindowFlags(windowFlags);
}

- (QIcon)windowIcon
{
	return toQt(self)->windowIcon();
}

- (void)setWindowIcon: (QIcon)windowIcon
{
	toQt(self)->setWindowIcon(windowIcon);
}

- (Qt::WindowModality)windowModality
{
	return toQt(self)->windowModality();
}

- (void)setWindowModality: (Qt::WindowModality)windowModality
{
	toQt(self)->setWindowModality(windowModality);
}

- (bool)isWindowModified
{
	return toQt(self)->isWindowModified();
}

- (void)setWindowModified: (bool)windowModified
{
	toQt(self)->setWindowModified(windowModified);
}

- (double)windowOpacity
{
	return toQt(self)->windowOpacity();
}

- (void)setWindowOpacity: (double)windowOpacity
{
	toQt(self)->setWindowOpacity(windowOpacity);
}

- (OFString *)windowTitle
{
	return toOF(toQt(self)->windowTitle());
}

- (void)setWindowTitle: (OFString *)windowTitle
{
	toQt(self)->setWindowTitle(toQt(windowTitle));
}

- (int)x
{
	return toQt(self)->x();
}

- (int)y
{
	return toQt(self)->y();
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

- (void)activateWindow
{
	toQt(self)->activateWindow();
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

- (QPalette::ColorRole)backgroundRole
{
	return toQt(self)->backgroundRole();
}

- (QBackingStore *)backingStore
{
	return toQt(self)->backingStore();
}

- (QtWidget *)childAt: (of_point_t)point
{
	return toOF(toQt(self)->childAt(toQt(point)));
}

- (void)clearFocus
{
	return toQt(self)->clearFocus();
}

- (void)clearMask
{
	toQt(self)->clearMask();
}

- (QMargins)contentsMargins
{
	return toQt(self)->contentsMargins();
}

- (of_rectangle_t)contentsRect
{
	return toOF(toQt(self)->contentsRect());
}

- (WId)effectiveWinID
{
	return toQt(self)->effectiveWinId();
}

- (void)ensurePolished
{
	toQt(self)->ensurePolished();
}

- (QtWidget *)focusProxy
{
	return toOF(toQt(self)->focusProxy());
}

- (QtWidget *)focusWidget
{
	return toOF(toQt(self)->focusWidget());
}

- (QFontInfo)fontInfo
{
	return toQt(self)->fontInfo();
}

- (QFontMetrics)fontMetrics
{
	return toQt(self)->fontMetrics();
}

- (QPalette::ColorRole)foregroundRole
{
	return toQt(self)->foregroundRole();
}

- (QPixmap)grabRectangle: (of_rectangle_t)rectangle
{
	return toQt(self)->grab(toQt(rectangle));
}

- (void)grabGesture: (Qt::GestureType)gesture
{
	toQt(self)->grabGesture(gesture);
}

- (void)grabGesture: (Qt::GestureType)gesture
	      flags: (Qt::GestureFlags)flags
{
	toQt(self)->grabGesture(gesture, flags);
}

- (void)grabKeyboard
{
	toQt(self)->grabKeyboard();
}

- (void)grabMouse
{
	toQt(self)->grabMouse();
}

- (void)grabMouseWithCursor: (const QCursor &)cursor
{
	toQt(self)->grabMouse(cursor);
}

- (int)grabShortcutWithKey: (const QKeySequence &)key
{
	return toQt(self)->grabShortcut(key);
}

- (int)grabShortcutWithKey: (const QKeySequence &)key
		   context: (Qt::ShortcutContext)context
{
	return toQt(self)->grabShortcut(key, context);
}

- (QGraphicsEffect *)graphicsEffect
{
	return toQt(self)->graphicsEffect();
}

- (QGraphicsProxyWidget *)graphicsProxyWidget
{
	return toQt(self)->graphicsProxyWidget();
}

#ifdef QT_KEYPAD_NAVIGATION
- (bool)hasEditFocus
{
	return toQt(self)->hasEditFocus();
}
#endif

- (bool)hasHeightForWidth
{
	return toQt(self)->hasHeightForWidth();
}

- (int)heightForWidth: (int)w
{
	return toQt(self)->heightForWidth(w);
}

- (QVariant)queryInputMethod: (Qt::InputMethodQuery)query
{
	return toQt(self)->inputMethodQuery(query);
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

- (bool)isAncestorOf: (QtWidget *)child
{
	return toQt(self)->isAncestorOf(toQt(child));
}

- (bool)isEnabledTo: (QtWidget *)ancestor
{
	return toQt(self)->isEnabledTo(toQt(ancestor));
}

- (bool)isHidden
{
	return toQt(self)->isHidden();
}

- (bool)isVisibleTo: (QtWidget *)ancestor
{
	return toQt(self)->isVisibleTo(toQt(ancestor));
}

- (bool)isWindow
{
	return toQt(self)->isWindow();
}

- (of_point_t)mapPosition: (of_point_t)pos
		     from: (QtWidget *)parent
{
	return toOF(toQt(self)->mapFrom(toQt(parent), toQt(pos)));
}

- (of_point_t)mapPositionFromGlobal: (of_point_t)pos
{
	return toOF(toQt(self)->mapFromGlobal(toQt(pos)));
}

- (of_point_t)mapPositionFromParent: (of_point_t)pos
{
	return toOF(toQt(self)->mapFromParent(toQt(pos)));
}

- (of_point_t)mapPosition: (of_point_t)pos
		       to: (QtWidget *)parent
{
	return toOF(toQt(self)->mapTo(toQt(parent), toQt(pos)));
}

- (of_point_t)mapPositionToGlobal: (of_point_t)pos
{
	return toOF(toQt(self)->mapToGlobal(toQt(pos)));
}

- (of_point_t)mapPositionToParent: (of_point_t)pos
{
	return toOF(toQt(self)->mapToParent(toQt(pos)));
}

- (QRegion)mask
{
	return toQt(self)->mask();
}

- (QtWidget *)nativeParentWidget
{
	return toOF(toQt(self)->nativeParentWidget());
}

- (QtWidget *)nextInFocusChain
{
	return toOF(toQt(self)->nextInFocusChain());
}

- (void)overrideWindowFlags: (Qt::WindowFlags)flags
{
	toQt(self)->overrideWindowFlags(flags);
}

- (QtWidget *)parentWidget
{
	return toOF(toQt(self)->parentWidget());
}

- (QtWidget *)previousInFocusChain
{
	return toOF(toQt(self)->previousInFocusChain());
}

- (void)releaseKeyboard
{
	toQt(self)->releaseKeyboard();
}

- (void)releaseMouse
{
	toQt(self)->releaseMouse();
}

- (void)releaseShortcut: (int)ID
{
	toQt(self)->releaseShortcut(ID);
}

- (void)removeAction: (QtAction *)action
{
	toQt(self)->removeAction(toQt(action));
}

- (void)renderIntoPaintDevice: (QtObject <QtPaintDevice> *)target
		 targetOffset: (of_point_t)targetOffset
		 sourceRegion: (QRegion)sourceRegion
{
	toQt(self)->render([target qPaintDevice], toQt(targetOffset),
	    sourceRegion);
}

- (void)renderIntoPaintDevice: (QtObject <QtPaintDevice> *)target
		 targetOffset: (of_point_t)targetOffset
		 sourceRegion: (QRegion)sourceRegion
			flags: (QWidget::RenderFlags)renderFlags
{
	toQt(self)->render([target qPaintDevice], toQt(targetOffset),
	    sourceRegion, renderFlags);
}

- (void)renderIntoPainter: (QPainter *)target
	     targetOffset: (of_point_t)targetOffset
	     sourceRegion: (QRegion)sourceRegion
{
	toQt(self)->render(target, toQt(targetOffset), sourceRegion);
}

- (void)renderIntoPainter: (QPainter *)target
	     targetOffset: (of_point_t)targetOffset
	     sourceRegion: (QRegion)sourceRegion
		    flags: (QWidget::RenderFlags)renderFlags
{
	toQt(self)->render(target, toQt(targetOffset), sourceRegion,
	    renderFlags);
}

- (void)repaintInRectangle: (of_rectangle_t)rect
{
	toQt(self)->repaint(toQt(rect));
}

- (void)repaintInRegion: (const QRegion &)region
{
	toQt(self)->repaint(region);
}

- (bool)restoreGeometry: (OFData *)geometry
{
	return toQt(self)->restoreGeometry(toQt(geometry));
}

- (OFData *)saveGeometry
{
	return toOF(toQt(self)->saveGeometry());
}

- (void)scrollRight: (int)dx
	       down: (int)dy
{
	toQt(self)->scroll(dx, dy);
}

- (void)scrollRight: (int)dx
	       down: (int)dy
	inRectangle: (of_rectangle_t)rect
{
	toQt(self)->scroll(dx, dy, toQt(rect));
}

- (void)setAttribute: (Qt::WidgetAttribute)attribute
		  to: (bool)on
{
	toQt(self)->setAttribute(attribute, on);
}

#ifdef QT_KEYPAD_NAVIGATION
- (void)setEditFocus: (bool)enable
{
	toQt(self)->setEditFocus(enable);
}
#endif

- (void)setFixedHeight: (int)height
{
	toQt(self)->setFixedHeight(height);
}

- (void)setFixedSize: (of_dimension_t)size
{
	toQt(self)->setFixedSize(toQt(size));
}

- (void)setFixedWidth: (int)width
{
	toQt(self)->setFixedWidth(width);
}

- (void)setFocus: (Qt::FocusReason)reason
{
	toQt(self)->setFocus(reason);
}

- (void)setFocusProxy: (QtWidget *)widget
{
	toQt(self)->setFocusProxy(toQt(widget));
}

- (void)setForegroundRole: (QPalette::ColorRole)role
{
	toQt(self)->setForegroundRole(role);
}

- (void)setGraphicsEffect: (QGraphicsEffect *)effect
{
	toQt(self)->setGraphicsEffect(effect);
}

- (void)setLayout: (QLayout *)layout
{
	toQt(self)->setLayout(layout);
}

- (void)setMaskFromBitmap: (const QBitmap &)bitmap
{
	toQt(self)->setMask(bitmap);
}

- (void)setMask: (const QRegion &)region
{
	toQt(self)->setMask(region);
}

- (void)setParent: (QtWidget *)parent
{
	toQt(self)->setParent(toQt(parent));
}

- (void)setParent: (QtWidget *)parent
	    flags: (Qt::WindowFlags)flags
{
	toQt(self)->setParent(toQt(parent), flags);
}

- (void)setAutoRepeat: (bool)enable
	  forShortcut: (int)ID
{
	toQt(self)->setShortcutAutoRepeat(ID, enable);
}

- (void)setEnabled: (bool)enable
       forShortcut: (int)ID
{
	toQt(self)->setShortcutEnabled(ID, enable);
}

- (void)setStyle: (QStyle *)style
{
	toQt(self)->setStyle(style);
}

- (void)setWindowRole: (OFString *)role
{
	toQt(self)->setWindowRole(toQt(role));
}

- (void)setWindowState: (Qt::WindowStates)windowState
{
	toQt(self)->setWindowState(windowState);
}

- (void)stackUnder: (QtWidget *)widget
{
	toQt(self)->stackUnder(toQt(widget));
}

- (QStyle *)style
{
	return toQt(self)->style();
}

- (bool)testAttribute: (Qt::WidgetAttribute)attribute
{
	return toQt(self)->testAttribute(attribute);
}

- (bool)isUnderMouse
{
	return toQt(self)->underMouse();
}

- (void)ungrabGesture: (Qt::GestureType)gesture
{
	toQt(self)->ungrabGesture(gesture);
}

- (void)updateInRectangle: (of_rectangle_t)rect
{
	toQt(self)->update(toQt(rect));
}

- (void)updateInRegion: (const QRegion &)region
{
	toQt(self)->update(region);
}

- (void)updateGeometry
{
	toQt(self)->updateGeometry();
}

- (QRegion)visibleRegion
{
	return toQt(self)->visibleRegion();
}

- (WId)winID
{
	return toQt(self)->winId();
}

- (QtWidget *)window
{
	return toOF(toQt(self)->window());
}

- (QWindow *)windowHandle
{
	return toQt(self)->windowHandle();
}

- (OFString *)windowRole
{
	return toOF(toQt(self)->windowRole());
}

- (Qt::WindowStates)windowState
{
	return toQt(self)->windowState();
}

- (Qt::WindowType)windowType
{
	return toQt(self)->windowType();
}
@end
