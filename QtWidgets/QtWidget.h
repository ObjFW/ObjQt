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
@property (readonly) QWidget *qWidget;
@property bool acceptDrops;
@property (copy) OFString *accessibleDescription;
@property (copy) OFString *accessibleName;
@property bool autoFillBackground;
@property of_dimension_t baseSize;
@property (readonly) of_rectangle_t childrenRect;
@property (readonly) QRegion childrenRegion;
@property Qt::ContextMenuPolicy contextMenuPolicy;
@property QCursor cursor;
@property (getter=isEnabled) bool enabled;
@property (readonly, getter=hasFocus) bool focus;
@property Qt::FocusPolicy focusPolicy;
@property const QFont &font;
@property (readonly) of_rectangle_t frameGeometry;
@property (readonly) of_dimension_t frameSize;
@property (readonly, getter=isFullScreen) bool fullScreen;
@property of_rectangle_t geometry;
@property (readonly) int height;
@property Qt::InputMethodHints inputMethodHints;
@property (readonly) bool isActiveWindow;
@property Qt::LayoutDirection layoutDirection;
@property QLocale locale;
@property (readonly, getter=isMaximized) bool maximized;
@property int maximumHeight;
@property of_dimension_t maximumSize;
@property int maximumWidth;
@property (readonly, getter=isMinimized) bool minimized;
@property int minimumHeight;
@property of_dimension_t minimumSize;
@property (readonly) of_dimension_t minimumSizeHint;
@property int minimumWidth;
@property (readonly, getter=isModal) bool modal;
@property (getter=hasMouseTracking) bool mouseTracking;
@property (readonly) of_rectangle_t normalGeometry;
@property const QPalette &palette;
@property (setter=moveToPosition:) of_point_t pos;
@property (readonly) of_rectangle_t rect;
@property (setter=resizeTo:) of_dimension_t size;
@property (readonly) of_dimension_t sizeHint;
@property of_dimension_t sizeIncrement;
@property QSizePolicy sizePolicy;
@property (copy) OFString *statusTip;
@property (copy) OFString *styleSheet;
@property (copy) OFString *toolTip;
@property int toolTipDuration;
@property bool updatesEnabled;
@property (getter=isVisible) bool visible;
@property (copy) OFString *whatsThis;
@property (readonly) int width;
@property (copy) OFString *windowFilePath;
@property Qt::WindowFlags windowFlags;
@property QIcon windowIcon;
@property Qt::WindowModality windowModality;
@property (getter=isWindowModified) bool windowModified;
@property double windowOpacity;
@property (copy) OFString *windowTitle;
@property (readonly) int x;
@property (readonly) int y;

- initWithQWidget: (QWidget*)qWidget;
- (OFArray OF_GENERIC(QtAction*)*)actions;
- (void)activateWindow;
- (void)addAction: (QtAction*)action;
- (void)addActions: (OFArray OF_GENERIC(QtAction*)*)actions;
- (void)adjustSize;
- (QPalette::ColorRole)backgroundRole;
- (QBackingStore*)backingStore;
- (QtWidget*)childAt: (of_point_t)point;
- (void)clearFocus;
- (void)clearMask;
- (QMargins)contentsMargins;
- (of_rectangle_t)contentsRect;
- (WId)effectiveWinId;
- (void)ensurePolished;
- (QtWidget*)focusProxy;
- (QtWidget*)focusWidget;
- (QFontInfo)fontInfo;
- (QFontMetrics)fontMetrics;
- (QPalette::ColorRole)foregroundRole;
- (QPixmap)grabRectangle: (of_rectangle_t)rectangle;
- (void)grabGesture: (Qt::GestureType)gesture;
- (void)grabGesture: (Qt::GestureType)gesture
	      flags: (Qt::GestureFlags)flags;
- (void)grabKeyboard;
- (void)grabMouse;
- (void)grabMouseWithCursor: (const QCursor&)cursor;
- (int)grabShortcutWithKey: (const QKeySequence&)key;
- (int)grabShortcutWithKey: (const QKeySequence&)key
		   context: (Qt::ShortcutContext)context;
- (QGraphicsEffect*)graphicsEffect;
- (QGraphicsProxyWidget*)graphicsProxyWidget;
#ifdef QT_KEYPAD_NAVIGATION
- (bool)hasEditFocus;
#endif
- (bool)hasHeightForWidth;
- (int)heightForWidth: (int)w;
- (QVariant)queryInputMethod: (Qt::InputMethodQuery)query;
- (void)insertAction: (QtAction*)action
	      before: (QtAction*)before;
- (void)insertActions: (OFArray OF_GENERIC(QtAction*)*)actions
	       before: (QtAction*)before;
- (bool)isAncestorOf: (QtWidget*)child;
- (bool)isEnabledTo: (QtWidget*)ancestor;
- (bool)isHidden;
- (bool)isVisibleTo: (QtWidget*)ancestor;
- (bool)isWindow;
// QPoint mapFrom(const QWidget *parent, const QPoint &pos) const
// QPoint mapFromGlobal(const QPoint &pos) const
// QPoint mapFromParent(const QPoint &pos) const
// QPoint mapTo(const QWidget *parent, const QPoint &pos) const
// QPoint mapToGlobal(const QPoint &pos) const
// QPoint mapToParent(const QPoint &pos) const
// QRegion mask() const
// ...

- (void)unsetCursor;
- (void)unsetLayoutDirection;
- (void)unsetLocale;
@end

@interface QtWidget (QtPaintDevice) <QtPaintDevice>
@end
