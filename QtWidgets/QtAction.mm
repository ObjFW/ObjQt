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

#import "QtAction.h"
#import "QtWidget.h"

#import "helpers.h"

@implementation QtAction
- initWithQObject: (QObject*)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQAction: (QAction*)qAction
{
	return [super initWithQObject: qAction];
}

- (QAction*)qAction
{
	return qobject_cast<QAction*>(_qObject);
}

- (bool)autoRepeat
{
	return [self qAction]->autoRepeat();
}

- (void)setAutoRepeat: (bool)autoRepeat
{
	[self qAction]->setAutoRepeat(autoRepeat);
}

- (bool)isCheckable
{
	return [self qAction]->isCheckable();
}

- (void)setCheckable: (bool)checkable
{
	[self qAction]->setCheckable(checkable);
}

- (bool)isChecked
{
	return [self qAction]->isChecked();
}

- (void)setChecked: (bool)checked
{
	[self qAction]->setChecked(checked);
}

- (bool)isEnabled
{
	return [self qAction]->isEnabled();
}

- (void)setEnabled: (bool)enabled
{
	[self qAction]->setEnabled(enabled);
}

- (QFont)font
{
	return [self qAction]->font();
}

- (void)setFont: (QFont)font
{
	[self qAction]->setFont(font);
}

- (QIcon)icon
{
	return [self qAction]->icon();
}

- (void)setIcon: (QIcon)icon
{
	[self qAction]->setIcon(icon);
}

- (OFString*)iconText
{
	return toOF([self qAction]->iconText());
}

- (void)setIconText: (OFString*)iconText
{
	[self qAction]->setIconText(toQt(iconText));
}

- (bool)isIconVisibleInMenu
{
	return [self qAction]->isIconVisibleInMenu();
}

- (void)setIconVisibleInMenu: (bool)iconVisibleInMenu
{
	[self qAction]->setIconVisibleInMenu(iconVisibleInMenu);
}

- (QAction::MenuRole)menuRole
{
	return [self qAction]->menuRole();
}

- (void)setMenuRole: (QAction::MenuRole)menuRole
{
	[self qAction]->setMenuRole(menuRole);
}

- (QAction::Priority)priority
{
	return [self qAction]->priority();
}

- (void)setPriority: (QAction::Priority)priority
{
	[self qAction]->setPriority(priority);
}

- (QKeySequence)shortcut
{
	return [self qAction]->shortcut();
}

- (void)setShortcut: (QKeySequence)shortcut
{
	[self qAction]->setShortcut(shortcut);
}

- (Qt::ShortcutContext)shortcutContext
{
	return [self qAction]->shortcutContext();
}

- (void)setShortcutContext: (Qt::ShortcutContext)shortcutContext
{
	[self qAction]->setShortcutContext(shortcutContext);
}

- (OFString*)statusTip
{
	return toOF([self qAction]->statusTip());
}

- (void)setStatusTip: (OFString*)statusTip
{
	[self qAction]->setStatusTip(toQt(statusTip));
}

- (OFString*)text
{
	return toOF([self qAction]->text());
}

- (void)setText: (OFString*)text
{
	[self qAction]->setText(toQt(text));
}

- (OFString*)toolTip
{
	return toOF([self qAction]->toolTip());
}

- (void)setToolTip: (OFString*)toolTip
{
	[self qAction]->setToolTip(toQt(toolTip));
}

- (bool)isVisible
{
	return [self qAction]->isVisible();
}

- (void)setVisible: (bool)visible
{
	[self qAction]->setVisible(visible);
}

- (OFString*)whatsThis
{
	return toOF([self qAction]->whatsThis());
}

- (void)setWhatsThis: (OFString*)whatsThis
{
	[self qAction]->setWhatsThis(toQt(whatsThis));
}

- (QActionGroup*)actionGroup
{
	return [self qAction]->actionGroup();
}

- (void)activate: (QAction::ActionEvent)event
{
	[self qAction]->activate(event);
}

- (QList<QGraphicsWidget*>)associatedGraphicsWidgets
{
	return [self qAction]->associatedGraphicsWidgets();
}

- (OFArray OF_GENERIC(QtWidget*)*)associatedWidgets
{
	const QList<QWidget*> &widgets = [self qAction]->associatedWidgets();
	OFMutableArray *ret =
	    [OFMutableArray arrayWithCapacity: widgets.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QWidget *widget: widgets)
		[ret addObject:
		    [[[QtWidget alloc] initWithQWidget: widget] autorelease]];

	[ret makeImmutable];

	objc_autoreleasePoolPop(pool);

	return ret;
}

- (QVariant)data
{
	return [self qAction]->data();
}

- (bool)isSeparator
{
	return [self qAction]->isSeparator();
}

- (QMenu*)menu
{
	return [self qAction]->menu();
}

- (QtWidget*)parentWidget
{
	return [[[QtWidget alloc] initWithQWidget:
	    [self qAction]->parentWidget()] autorelease];
}

- (void)setActionGroup: (QActionGroup*)group
{
	[self qAction]->setActionGroup(group);
}

- (void)setMenu: (QMenu*)menu
{
	[self qAction]->setMenu(menu);
}

- (void)setSeparator: (bool)isSeparator
{
	[self qAction]->setSeparator(isSeparator);
}

- (void)setShortcuts: (const QList<QKeySequence>&)shortcuts
{
	[self qAction]->setShortcuts(shortcuts);
}

- (void)setShortcutsWithStandardKey: (QKeySequence::StandardKey)key
{
	[self qAction]->setShortcuts(key);
}

- (QList<QKeySequence>)shortcuts
{
	return [self qAction]->shortcuts();
}

- (bool)showStatusText: (QtWidget*)widget
{
	return [self qAction]->showStatusText([widget qWidget]);
}
@end
