#import "OFString+QString.h"

@implementation OFString (QString)
+ stringWithQString: (const QString&)qString
{
	return [[[self alloc] initWithQString: qString] autorelease];
}

- initWithQString: (const QString&)qString
{
	static_assert(sizeof(QChar) == sizeof(of_char16_t),
	    "QChar and of_char16_t have a different size!");

	return [self initWithUTF16String: (of_char16_t*)qString.data()
				  length: qString.length()];
}

- (QString)qString
{
	static_assert(sizeof(of_char16_t) == sizeof(QChar),
	    "of_char16_t and QChar have a different size!");

	void *pool = objc_autoreleasePoolPush();
	QString ret = QString((QChar*)[self UTF16String]);

	objc_autoreleasePoolPop(pool);

	return ret;
}
@end
