#import <ObjFW/ObjFW.h>

#include <QString>
#include <QSize>
#include <QRect>

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

inline of_dimension_t
QToOFDimension(const QSize &qSize)
{
	return of_dimension(qSize.width(), qSize.height());
}

inline of_point_t
QToOFPoint(const QPoint &qPoint)
{
	return of_point(qPoint.x(), qPoint.y());
}

inline QPoint
OFToQPoint(of_point_t point)
{
	return QPoint(point.x, point.y);
}

inline QSize
OFToQSize(of_dimension_t dimension)
{
	return QSize(dimension.width, dimension.height);
}

inline of_rectangle_t
QToOFRectangle(const QRect &qRect)
{
	return of_rectangle(qRect.x(), qRect.y(),
	    qRect.width(), qRect.height());
}

inline QRect
OFToQRect(of_rectangle_t rectangle)
{
	return QRect(rectangle.origin.x, rectangle.origin.y,
	    rectangle.size.width, rectangle.size.height);
}
