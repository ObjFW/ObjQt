#import "QtWidget.h"

#import "helpers.h"

#include <QIcon>
#include <QLocale>

@implementation QtWidget
+ (void)initialize
{
	if (self == [QtWidget class])
		[self inheritMethodsFromClass: [QtPaintDevice class]];
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
@end
