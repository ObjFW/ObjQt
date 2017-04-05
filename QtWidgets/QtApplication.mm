#import "QtApplication.h"

#import "helpers.h"

@implementation QtApplication
- initWithQGuiApplication: (QGuiApplication*)qGuiApplication
{
	OF_INVALID_INIT_METHOD
}

- initWithQApplication: (QApplication*)qApplication
{
	return [super initWithQGuiApplication: qApplication];
}

- (QApplication*)qApplication
{
	return qobject_cast<QApplication*>(_qObject);
}

- (bool)autoSipEnabled
{
	return [self qApplication]->autoSipEnabled();
}

- (void)setAutoSipEnabled: (bool)autoSipEnabled
{
	[self qApplication]->setAutoSipEnabled(autoSipEnabled);
}

- (int)cursorFlashTime
{
	return [self qApplication]->cursorFlashTime();
}

- (void)setCursorFlashTime: (int)cursorFlashTime
{
	[self qApplication]->setCursorFlashTime(cursorFlashTime);
}

- (int)doubleClickInterval
{
	return [self qApplication]->doubleClickInterval();
}

- (void)setDoubleClickInterval: (int)doubleClickInterval
{
	[self qApplication]->setDoubleClickInterval(doubleClickInterval);
}

- (of_dimension_t)globalStrut
{
	return toOF([self qApplication]->globalStrut());
}

- (void)setGlobalStrut: (of_dimension_t)globalStrut
{
	[self qApplication]->setGlobalStrut(toQt(globalStrut));
}

- (int)keyboardInputInterval
{
	return [self qApplication]->keyboardInputInterval();
}

- (void)setKeyboardInputInterval: (int)keyboardInputInterval
{
	[self qApplication]->setKeyboardInputInterval(keyboardInputInterval);
}

- (int)startDragDistance
{
	return [self qApplication]->startDragDistance();
}

- (void)setStartDragDistance: (int)startDragDistance
{
	[self qApplication]->setStartDragDistance(startDragDistance);
}

- (int)startDragTime
{
	return [self qApplication]->startDragTime();
}

- (void)setStartDragTime: (int)startDragTime
{
	[self qApplication]->setStartDragTime(startDragTime);
}

- (OFString*)styleSheet
{
	return toOF([self qApplication]->styleSheet());
}

- (void)setStyleSheet: (OFString*)styleSheet
{
	[self qApplication]->setStyleSheet(toQt(styleSheet));
}

- (int)wheelScrollLines
{
	return [self qApplication]->wheelScrollLines();
}

- (void)setWheelScrollLines: (int)wheelScrollLines
{
	[self qApplication]->setWheelScrollLines(wheelScrollLines);
}

- (void)aboutQt
{
	[self qApplication]->aboutQt();
}

- (void)closeAllWindows
{
	[self qApplication]->closeAllWindows();
}
@end
