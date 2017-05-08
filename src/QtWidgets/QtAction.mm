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
#import "OFString+QString.h"

using ObjQt::toOF;
using ObjQt::toQt;

@implementation QtAction
- initWithQObject: (QObject *)qObject
{
	OF_INVALID_INIT_METHOD
}

- initWithQAction: (QAction *)qAction
{
	return [super initWithQObject: qAction];
}

- (QAction *)qAction
{
	return qobject_cast<QAction *>(_qObject);
}

- (bool)autoRepeat
{
	return toQt(self)->autoRepeat();
}

- (void)setAutoRepeat: (bool)autoRepeat
{
	toQt(self)->setAutoRepeat(autoRepeat);
}

- (bool)isCheckable
{
	return toQt(self)->isCheckable();
}

- (void)setCheckable: (bool)checkable
{
	toQt(self)->setCheckable(checkable);
}

- (bool)isChecked
{
	return toQt(self)->isChecked();
}

- (void)setChecked: (bool)checked
{
	toQt(self)->setChecked(checked);
}

- (bool)isEnabled
{
	return toQt(self)->isEnabled();
}

- (void)setEnabled: (bool)enabled
{
	toQt(self)->setEnabled(enabled);
}

- (QFont)font
{
	return toQt(self)->font();
}

- (void)setFont: (QFont)font
{
	toQt(self)->setFont(font);
}

- (QIcon)icon
{
	return toQt(self)->icon();
}

- (void)setIcon: (QIcon)icon
{
	toQt(self)->setIcon(icon);
}

- (OFString *)iconText
{
	return toOF(toQt(self)->iconText());
}

- (void)setIconText: (OFString *)iconText
{
	toQt(self)->setIconText(toQt(iconText));
}

- (bool)isIconVisibleInMenu
{
	return toQt(self)->isIconVisibleInMenu();
}

- (void)setIconVisibleInMenu: (bool)iconVisibleInMenu
{
	toQt(self)->setIconVisibleInMenu(iconVisibleInMenu);
}

- (QAction::MenuRole)menuRole
{
	return toQt(self)->menuRole();
}

- (void)setMenuRole: (QAction::MenuRole)menuRole
{
	toQt(self)->setMenuRole(menuRole);
}

- (QAction::Priority)priority
{
	return toQt(self)->priority();
}

- (void)setPriority: (QAction::Priority)priority
{
	toQt(self)->setPriority(priority);
}

- (QKeySequence)shortcut
{
	return toQt(self)->shortcut();
}

- (void)setShortcut: (QKeySequence)shortcut
{
	toQt(self)->setShortcut(shortcut);
}

- (Qt::ShortcutContext)shortcutContext
{
	return toQt(self)->shortcutContext();
}

- (void)setShortcutContext: (Qt::ShortcutContext)shortcutContext
{
	toQt(self)->setShortcutContext(shortcutContext);
}

- (OFString *)statusTip
{
	return toOF(toQt(self)->statusTip());
}

- (void)setStatusTip: (OFString *)statusTip
{
	toQt(self)->setStatusTip(toQt(statusTip));
}

- (OFString *)text
{
	return toOF(toQt(self)->text());
}

- (void)setText: (OFString *)text
{
	toQt(self)->setText(toQt(text));
}

- (OFString *)toolTip
{
	return toOF(toQt(self)->toolTip());
}

- (void)setToolTip: (OFString *)toolTip
{
	toQt(self)->setToolTip(toQt(toolTip));
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

- (QActionGroup *)actionGroup
{
	return toQt(self)->actionGroup();
}

- (void)activate: (QAction::ActionEvent)event
{
	toQt(self)->activate(event);
}

- (QList<QGraphicsWidget *>)associatedGraphicsWidgets
{
	return toQt(self)->associatedGraphicsWidgets();
}

- (OFArray OF_GENERIC(QtWidget *) *)associatedWidgets
{
	const QList<QWidget *> &widgets = toQt(self)->associatedWidgets();
	OFMutableArray *ret =
	    [OFMutableArray arrayWithCapacity: widgets.count()];
	void *pool = objc_autoreleasePoolPush();

	for (QWidget *widget: widgets)
		[ret addObject: toOF(widget)];

	[ret makeImmutable];

	objc_autoreleasePoolPop(pool);

	return ret;
}

- (QVariant)data
{
	return toQt(self)->data();
}

- (bool)isSeparator
{
	return toQt(self)->isSeparator();
}

- (QMenu *)menu
{
	return toQt(self)->menu();
}

- (QtWidget *)parentWidget
{
	return toOF(toQt(self)->parentWidget());
}

- (void)setActionGroup: (QActionGroup *)group
{
	toQt(self)->setActionGroup(group);
}

- (void)setData: (const QVariant &)userData
{
	toQt(self)->setData(userData);
}

- (void)setMenu: (QMenu *)menu
{
	toQt(self)->setMenu(menu);
}

- (void)setSeparator: (bool)isSeparator
{
	toQt(self)->setSeparator(isSeparator);
}

- (void)setShortcuts: (const QList<QKeySequence> &)shortcuts
{
	toQt(self)->setShortcuts(shortcuts);
}

- (void)setShortcutsWithStandardKey: (QKeySequence::StandardKey)key
{
	toQt(self)->setShortcuts(key);
}

- (QList<QKeySequence>)shortcuts
{
	return toQt(self)->shortcuts();
}

- (bool)showStatusText: (QtWidget *)widget
{
	return toQt(self)->showStatusText(toQt(widget));
}
@end
