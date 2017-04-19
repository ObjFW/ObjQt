include ../extra.mk

PROG = exampleApplication
SRCS = main.mm

include ../buildsys.mk

CPPFLAGS += -I../src -I../src/common -I../src/QtCore -I../QtGui
LIBS := -L../src -lobjfw -lobjqt
LDFLAGS += ${MAP_LDFLAGS}
LD = ${OBJCXX}
