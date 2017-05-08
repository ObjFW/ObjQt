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

#include <QAction>

@class QtWidget;

@interface QtAction: QtObject
@property (readonly) QAction *qAction;
@property bool autoRepeat;
@property (getter=isCheckable) bool checkable;
@property (getter=isChecked) bool checked;
@property (getter=isEnabled) bool enabled;
@property QFont font;
@property QIcon icon;
@property (copy) OFString *iconText;
@property (getter=isIconVisibleInMenu) bool iconVisibleInMenu;
@property QAction::MenuRole menuRole;
@property QAction::Priority priority;
@property QKeySequence shortcut;
@property Qt::ShortcutContext shortcutContext;
@property (copy) OFString *statusTip;
@property (copy) OFString *text;
@property (copy) OFString *toolTip;
@property (getter=isVisible) bool visible;
@property (copy) OFString *whatsThis;

- initWithQObject: (QObject *)qObject OF_UNAVAILABLE;
- initWithQAction: (QAction *)qAction;
- (QActionGroup *)actionGroup;
- (void)activate: (QAction::ActionEvent)event;
- (QList<QGraphicsWidget *>)associatedGraphicsWidgets;
- (OFArray OF_GENERIC(QtWidget *) *)associatedWidgets;
- (QVariant)data;
- (bool)isSeparator;
- (QMenu *)menu;
- (QtWidget *)parentWidget;
- (void)setActionGroup: (QActionGroup *)group;
- (void)setData: (const QVariant&)data;
- (void)setMenu: (QMenu *)menu;
- (void)setSeparator: (bool)isSeparator;
- (void)setShortcuts: (const QList<QKeySequence>&)shortcuts;
- (void)setShortcutsWithStandardKey: (QKeySequence::StandardKey)key;
- (QList<QKeySequence>)shortcuts;
- (bool)showStatusText: (QtWidget *)widget;
@end

namespace ObjQt {

static OF_INLINE QtAction *
toOF(QAction *qAction)
{
	return [[[QtAction alloc] initWithQAction: qAction] autorelease];
}

static OF_INLINE QAction *
toQt(QtAction *action)
{
	return [action qAction];
}

}
