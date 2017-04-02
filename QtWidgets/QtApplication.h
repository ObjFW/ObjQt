#import "QtGuiApplication.h"

#include <QApplication>

@interface QtApplication: QtGuiApplication
@property (readonly) QApplication *qApplication;
@property bool autoSipEnabled;
@property int cursorFlashTime;
@property int doubleClickInterval;
@property of_dimension_t globalStrut;
@property int keyboardInputInterval;
@property int startDragDistance;
@property int startDragTime;
@property (copy) OFString *styleSheet;
@property int wheelScrollLines;

- initWithQApplication: (QApplication*)qApplication;
- (void)aboutQt;
- (bool)autoSipEnabled;
- (void)closeAllWindows;
- (void)setAutoSipEnabled: (bool)enabled;
@end
