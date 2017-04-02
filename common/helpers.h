#import <ObjFW/ObjFW.h>

#include <QString>

inline OFString*
QToOFString(const QString &qString)
{
	return [OFString stringWithUTF8String: qString.toUtf8()];
}

inline QString
OFToQString(OFString *string)
{
	return QString::fromUtf8([string UTF8String]);
}
