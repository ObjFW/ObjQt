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

#import "QtObject.h"
#import "QtPaintDevice.h"

#include <QWidget>

@class QtAction;

@interface QtWidget: QtObject
@property (readonly, nonatomic) QWidget *qWidget;
@property (nonatomic) bool acceptDrops;
@property (copy, nonatomic) OFString *accessibleDescription;
@property (copy, nonatomic) OFString *accessibleName;
@property (nonatomic) bool autoFillBackground;
@property (nonatomic) of_dimension_t baseSize;
@property (readonly, nonatomic) of_rectangle_t childrenRect;
@property (readonly, nonatomic) QRegion childrenRegion;
@property (nonatomic) Qt::ContextMenuPolicy contextMenuPolicy;
@property (nonatomic) QCursor cursor;
@property (nonatomic, getter=isEnabled) bool enabled;
@property (nonatomic) Qt::FocusPolicy focusPolicy;
@property (nonatomic) const QFont &font;
@property (readonly, nonatomic) of_rectangle_t frameGeometry;
@property (readonly, nonatomic) of_dimension_t frameSize;
@property (readonly, nonatomic, getter=isFullScreen) bool fullScreen;
@property (nonatomic) of_rectangle_t geometry;
@property (readonly, nonatomic) int height;
@property (nonatomic) Qt::InputMethodHints inputMethodHints;
@property (readonly, nonatomic) bool isActiveWindow;
@property (nonatomic) Qt::LayoutDirection layoutDirection;
@property (nonatomic) QLocale locale;
@property (readonly, nonatomic, getter=isMaximized) bool maximized;
@property (nonatomic) int maximumHeight;
@property (nonatomic) of_dimension_t maximumSize;
@property (nonatomic) int maximumWidth;
@property (readonly, nonatomic, getter=isMinimized) bool minimized;
@property (nonatomic) int minimumHeight;
@property (nonatomic) of_dimension_t minimumSize;
@property (readonly, nonatomic) of_dimension_t minimumSizeHint;
@property (nonatomic) int minimumWidth;
@property (readonly, nonatomic, getter=isModal) bool modal;
@property (nonatomic, getter=hasMouseTracking) bool mouseTracking;
@property (readonly, nonatomic) of_rectangle_t normalGeometry;
@property (nonatomic) const QPalette &palette;
@property (nonatomic, setter=moveToPosition:) of_point_t pos;
@property (readonly, nonatomic) of_rectangle_t rect;
@property (nonatomic, setter=resizeTo:) of_dimension_t size;
@property (readonly, nonatomic) of_dimension_t sizeHint;
@property (nonatomic) of_dimension_t sizeIncrement;
@property (nonatomic) QSizePolicy sizePolicy;
@property (copy, nonatomic) OFString *statusTip;
@property (copy, nonatomic) OFString *styleSheet;
@property (copy, nonatomic) OFString *toolTip;
@property (nonatomic) int toolTipDuration;
@property (nonatomic) bool updatesEnabled;
@property (nonatomic, getter=isVisible) bool visible;
@property (copy, nonatomic) OFString *whatsThis;
@property (readonly, nonatomic) int width;
@property (nonatomic) Qt::WindowFlags windowFlags;
@property (nonatomic) QIcon windowIcon;
@property (nonatomic) Qt::WindowModality windowModality;
@property (nonatomic, getter=isWindowModified) bool windowModified;
@property (nonatomic) double windowOpacity;
@property (copy, nonatomic) OFString *windowTitle;
@property (readonly, nonatomic) int x;
@property (readonly, nonatomic) int y;
@property (readonly, nonatomic) OFArray OF_GENERIC(QtAction *) *actions;
@property (readonly, nonatomic) of_rectangle_t contentsRect;
@property (readonly, nonatomic) QtWidget *focusProxy;
@property (readonly, nonatomic) QtWidget *focusWidget;
@property (readonly, nonatomic, getter=isHidden) bool hidden;
@property (readonly, nonatomic) bool isWindow;
@property (readonly, nonatomic) QtWidget *nativeParentWidget;
@property (readonly, nonatomic) QtWidget *nextInFocusChain;
@property (readonly, nonatomic) QtWidget *parentWidget;
@property (readonly, nonatomic) QtWidget *previousInFocusChain;
@property (readonly, nonatomic) QtWidget *window;
@property (readonly, nonatomic) OFString *windowRole;

- (instancetype)initWithQObject: (QObject *)qObject OF_UNAVAILABLE;
- (instancetype)initWithQWidget: (QWidget *)qWidget OF_DESIGNATED_INITIALIZER;
- (void)activateWindow;
- (void)addAction: (QtAction *)action;
- (void)addActions: (OFArray OF_GENERIC(QtAction *) *)actions;
- (void)adjustSize;
- (QPalette::ColorRole)backgroundRole;
- (QBackingStore *)backingStore;
- (QtWidget *)childAt: (of_point_t)point;
- (void)clearFocus;
- (void)clearMask;
- (QMargins)contentsMargins;
- (WId)effectiveWinID;
- (void)ensurePolished;
- (QFontInfo)fontInfo;
- (QFontMetrics)fontMetrics;
- (QPalette::ColorRole)foregroundRole;
- (QPixmap)grabRectangle: (of_rectangle_t)rectangle;
- (void)grabGesture: (Qt::GestureType)gesture;
- (void)grabGesture: (Qt::GestureType)gesture
	      flags: (Qt::GestureFlags)flags;
- (void)grabKeyboard;
- (void)grabMouse;
- (void)grabMouseWithCursor: (const QCursor &)cursor;
- (int)grabShortcutWithKey: (const QKeySequence &)key;
- (int)grabShortcutWithKey: (const QKeySequence &)key
		   context: (Qt::ShortcutContext)context;
- (QGraphicsEffect *)graphicsEffect;
- (QGraphicsProxyWidget *)graphicsProxyWidget;
#ifdef QT_KEYPAD_NAVIGATION
- (bool)hasEditFocus;
#endif
- (bool)hasFocus;
- (bool)hasHeightForWidth;
- (int)heightForWidth: (int)w;
- (QVariant)queryInputMethod: (Qt::InputMethodQuery)query;
- (void)insertAction: (QtAction *)action
	      before: (QtAction *)before;
- (void)insertActions: (OFArray OF_GENERIC(QtAction *) *)actions
	       before: (QtAction *)before;
- (bool)isAncestorOf: (QtWidget *)child;
- (bool)isEnabledTo: (QtWidget *)ancestor;
- (bool)isVisibleTo: (QtWidget *)ancestor;
- (of_point_t)mapPosition: (of_point_t)pos
		     from: (QtWidget *)parent;
- (of_point_t)mapPositionFromGlobal: (of_point_t)pos;
- (of_point_t)mapPositionFromParent: (of_point_t)pos;
- (of_point_t)mapPosition: (of_point_t)pos
		       to: (QtWidget *)parent;
- (of_point_t)mapPositionToGlobal: (of_point_t)pos;
- (of_point_t)mapPositionToParent: (of_point_t)pos;
- (QRegion)mask;
- (void)overrideWindowFlags: (Qt::WindowFlags)flags;
- (void)releaseKeyboard;
- (void)releaseMouse;
- (void)releaseShortcut: (int)ID;
- (void)removeAction: (QtAction *)action;
- (void)renderIntoPaintDevice: (QtObject <QtPaintDevice> *)target
		 targetOffset: (of_point_t)targetOffset
		 sourceRegion: (QRegion)sourceRegion;
- (void)renderIntoPaintDevice: (QtObject <QtPaintDevice> *)target
		 targetOffset: (of_point_t)targetOffset
		 sourceRegion: (QRegion)sourceRegion
			flags: (QWidget::RenderFlags)renderFlags;
- (void)renderIntoPainter: (QPainter *)target
	     targetOffset: (of_point_t)targetOffset
	     sourceRegion: (QRegion)sourceRegion;
- (void)renderIntoPainter: (QPainter *)target
	     targetOffset: (of_point_t)targetOffset
	     sourceRegion: (QRegion)sourceRegion
		    flags: (QWidget::RenderFlags)renderFlags;
- (void)repaintInRectangle: (of_rectangle_t)rect;
- (void)repaintInRegion: (const QRegion &)region;
- (bool)restoreGeometry: (OFData *)geometry;
- (OFData *)saveGeometry;
- (void)scrollRight: (int)dx
	       down: (int)dy;
- (void)scrollRight: (int)dx
	       down: (int)dy
	inRectangle: (of_rectangle_t)rect;
- (void)setAttribute: (Qt::WidgetAttribute)attribute
		  to: (bool)on;
- (void)setFocus: (Qt::FocusReason)reason;
#ifdef QT_KEYPAD_NAVIGATION
- (void)setEditFocus: (bool)enable;
#endif
- (void)setFixedHeight: (int)height;
- (void)setFixedSize: (of_dimension_t)size;
- (void)setFixedWidth: (int)width;
- (void)setFocusProxy: (QtWidget *)widget;
- (void)setForegroundRole: (QPalette::ColorRole)role;
- (void)setGraphicsEffect: (QGraphicsEffect *)effect;
- (void)setLayout: (QLayout *)layout;
- (void)setMaskFromBitmap: (const QBitmap &)bitmap;
- (void)setMask: (const QRegion &)region;
- (void)setParent: (QtWidget *)parent;
- (void)setParent: (QtWidget *)parent
	    flags: (Qt::WindowFlags)flags;
- (void)setAutoRepeat: (bool)enable
	  forShortcut: (int)ID;
- (void)setEnabled: (bool)enable
       forShortcut: (int)ID;
- (void)setStyle: (QStyle *)style;
- (void)setWindowRole: (OFString *)role;
- (void)setWindowState: (Qt::WindowStates)windowState;
- (void)stackUnder: (QtWidget *)widget;
- (QStyle *)style;
- (bool)testAttribute: (Qt::WidgetAttribute)attribute;
- (bool)isUnderMouse;
- (void)ungrabGesture: (Qt::GestureType)gesture;
- (void)unsetCursor;
- (void)unsetLayoutDirection;
- (void)unsetLocale;
- (void)updateInRectangle: (of_rectangle_t)rect;
- (void)updateInRegion: (const QRegion &)region;
- (void)updateGeometry;
- (QRegion)visibleRegion;
- (WId)winID;
- (QWindow *)windowHandle;
- (Qt::WindowStates)windowState;
- (Qt::WindowType)windowType;
@end

@interface QtWidget (QtPaintDevice) <QtPaintDevice>
@end

namespace ObjQt {

static OF_INLINE QtWidget *
toOF(QWidget *qWidget)
{
	if (qWidget == NULL)
		return nil;

	return [[[QtWidget alloc] initWithQWidget: qWidget] autorelease];
}

static OF_INLINE QWidget *
toQt(QtWidget *widget)
{
	return widget.qWidget;
}

}
