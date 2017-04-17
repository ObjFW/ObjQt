AC_INIT(ObjQt, 0.1, js@heap.zone)
BUILDSYS_INIT

AS_IF([test configure.ac -nt configure], [
	AC_MSG_ERROR([configure.ac is newer than configure! Run autoreconf!])
])

AC_CONFIG_SRCDIR(src)
AC_CONFIG_AUX_DIR(build-aux)
AC_CONFIG_MACRO_DIR(build-aux/m4)

AC_CHECK_TOOL(OBJFW_CONFIG, objfw-config)
AS_IF([test x"$OBJFW_CONFIG" = x""], [
	AC_MSG_ERROR(You need ObjFW and objfw-config installed!)
])

AC_LANG([Objective C++])
AC_PROG_OBJCXX(clang++ g++)
AC_PROG_OBJCXXCPP
AC_PROG_LN_S
AC_PROG_INSTALL

CPP="$OBJCXXCPP"
CPPFLAGS="$CPPFLAGS $OBJCPPFLAGS $($OBJFW_CONFIG --cppflags)"
OBJCFLAGS="$OBJCFLAGS -Wall $($OBJFW_CONFIG --objcflags)"
LDFLAGS="$LDFLAGS $($OBJFW_CONFIG --ldflags --rpath)"
LIBS="$LIBS $($OBJFW_CONFIG --libs)"

AX_CHECK_COMPILER_FLAGS(-std=c++11, [CXXFLAGS="$CXXFLAGS -std=c++11"], [
	AC_MSG_ERROR(You need a compiler that supports C++11!)
])

AX_CHECK_COMPILER_FLAGS(-pipe, [OBJCFLAGS="$OBJCFLAGS -pipe"])
AX_CHECK_COMPILER_FLAGS(-fno-common, [OBJCFLAGS="$OBJCFLAGS -fno-common"])
AX_CHECK_COMPILER_FLAGS(-Wobjc-missing-property-synthesis -Werror,
	[OBJCFLAGS="$OBJCFLAGS -Wobjc-missing-property-synthesis"])

AC_CHECK_TOOL(AR, ar)
AC_PROG_RANLIB
AC_ARG_ENABLE(shared,
	AS_HELP_STRING([--disable-shared], [do not build shared library]))
AS_IF([test x"$enable_shared" != x"no"], [
	BUILDSYS_SHARED_LIB
	AC_SUBST(OBJQT_SHARED_LIB, "${LIB_PREFIX}objqt${LIB_SUFFIX}")
	AC_SUBST(QTCORE_LIB_A, "QtCore.lib.a")
	AC_SUBST(QTCORE_QTCORE_LIB_A, "QtCore/QtCore.lib.a")
	AC_SUBST(QTGUI_LIB_A, "QtGui.lib.a")
	AC_SUBST(QTGUI_QTGUI_LIB_A, "QtGui/QtGui.lib.a")
	AC_SUBST(QTWIDGETS_LIB_A, "QtWidgets.lib.a")
	AC_SUBST(QTWIDGETS_QTWIDGETS_LIB_A, "QtWidgets/QtWidgets.lib.a")
	AC_SUBST(COMMON_COMMON_LIB_A, "common/common.lib.a")
	AC_SUBST(COMMON_LIB_A, "common.lib.a")
])
AC_ARG_ENABLE(static, AS_HELP_STRING([--enable-static], [build static library]))
AS_IF([test x"$enable_static" = x"yes" -o x"$enable_shared" = x"no"], [
	AC_PROG_RANLIB
	AC_SUBST(OBJQT_STATIC_LIB, "libobjqt.a")
	AC_SUBST(QTCORE_A, "QtCore.a")
	AC_SUBST(QTCORE_QTCORE_A, "QtCore/QtCore.a")
	AC_SUBST(QTGUI_A, "QtGui.a")
	AC_SUBST(QTGUI_QTGUI_A, "QtGui/QtGui.a")
	AC_SUBST(QTWIDGETS_A, "QtWidgets.a")
	AC_SUBST(QTWIDGETS_QTWIDGETS_A, "QtWidgets/QtWidgets.a")
	AC_SUBST(COMMON_COMMON_A, "common/common.a")
	AC_SUBST(COMMON_A, "common.a")
])

PKG_CHECK_MODULES(Qt5Core, [Qt5Core >= 5.5], [
	CPPFLAGS="$CPPFLAGS $Qt5Core_CFLAGS"
	LIBS="$LIBS $Qt5Core_LIBS"
], [
	AC_MSG_ERROR(You need Qt5Core >= 5.5 installed!)
])

PKG_CHECK_MODULES(Qt5Gui, [Qt5Gui >= 5.5], [
	CPPFLAGS="$CPPFLAGS $Qt5Gui_CFLAGS"
	LIBS="$LIBS $Qt5Gui_LIBS"
], [
	AC_MSG_ERROR(You need Qt5Gui >= 5.5 installed!)
])
PKG_CHECK_MODULES(Qt5Widgets, [Qt5Widgets >= 5.5], [
	CPPFLAGS="$CPPFLAGS $Qt5Widgets_CFLAGS"
	LIBS="$LIBS $Qt5Widgets_LIBS"
], [
	AC_MSG_ERROR(You need Qt5Widgets >= 5.5 installed!)
])
AS_IF([test x"$GOBJC" = x"yes"], [
	OBJCFLAGS="$OBJCFLAGS -Wwrite-strings -Wpointer-arith -Werror"
])

BUILDSYS_INIT

dnl We don't call AC_PROG_CPP or AC_PROG_OBJC, but only AC_PROG_OBJCPPCXX and
dnl set CPP and OBJCC to OBJCPPCXX and add OBJCXXCPPFLAGS to CPPFLAGS, thus we
dnl need to AC_SUBST these ourself.
AC_SUBST(CPP)
AC_SUBST(CPPFLAGS)
AC_SUBST(CXXFLAGS)
AC_SUBST(OBJCFLAGS)

AC_CONFIG_FILES([buildsys.mk extra.mk])
AC_OUTPUT
