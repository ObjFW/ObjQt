include ../extra.mk

SUBDIRS = QtCore	\
	  QtGui		\
	  QtWidgets	\
	  common

SHARED_LIB = ${OBJQT_SHARED_LIB}
STATIC_LIB = ${OBJQT_STATIC_LIB}
LIB_MAJOR = 0
LIB_MINOR = 0

OBJS_EXTRA = ${QTCORE_QTCORE_A}		\
	     ${QTGUI_QTGUI_A}		\
	     ${QTWIDGETS_QTWIDGETS_A}	\
	     ${COMMON_COMMON_A}
LIB_OBJS_EXTRA = ${QTCORE_QTCORE_LIB_A}		\
		 ${QTGUI_QTGUI_LIB_A}		\
		 ${QTWIDGETS_QTWIDGETS_LIB_A}	\
		 ${COMMON_COMMON_LIB_A}

include ../buildsys.mk

LD = ${OBJCXX}
