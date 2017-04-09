#import <ObjFW/ObjFW.h>

#include <QString>
#include <QSize>
#include <QRect>

#import "OFString+QString.h"

static OF_INLINE OFString*
toOF(const QString &qString)
{
	return [OFString stringWithQString: qString];
}

static OF_INLINE QString
toQt(OFString *string)
{
	return [string qString];
}

static OF_INLINE of_point_t
toOF(const QPoint &qPoint)
{
	return of_point(qPoint.x(), qPoint.y());
}

static OF_INLINE QPoint
toQt(of_point_t point)
{
	return QPoint(point.x, point.y);
}

static OF_INLINE of_dimension_t
toOF(const QSize &qSize)
{
	return of_dimension(qSize.width(), qSize.height());
}

static OF_INLINE QSize
toQt(of_dimension_t dimension)
{
	return QSize(dimension.width, dimension.height);
}

static OF_INLINE of_rectangle_t
toOF(const QRect &qRect)
{
	return of_rectangle(qRect.x(), qRect.y(),
	    qRect.width(), qRect.height());
}

static OF_INLINE QRect
toQt(of_rectangle_t rectangle)
{
	return QRect(rectangle.origin.x, rectangle.origin.y,
	    rectangle.size.width, rectangle.size.height);
}
