TARGET = qwayland
include(../../qpluginbase.pri)

QTDIR_build:DESTDIR = $$QT_BUILD_TREE/plugins/platforms

DEFINES += Q_PLATFORM_WAYLAND
DEFINES += $$QMAKE_DEFINES_WAYLAND

SOURCES =   main.cpp \
            qwaylandintegration.cpp \
            qwaylandshmsurface.cpp \
            qwaylandinputdevice.cpp \
            qwaylandcursor.cpp \
            qwaylanddisplay.cpp \
            qwaylandwindow.cpp \
            qwaylandscreen.cpp \
            qwaylandshmwindow.cpp

HEADERS =   qwaylandintegration.h \
            qwaylandcursor.h \
            qwaylanddisplay.h \
            qwaylandwindow.h \
            qwaylandscreen.h \
            qwaylandshmsurface.h \
            qwaylandbuffer.h \
            qwaylandshmwindow.h

INCLUDEPATH += $$QMAKE_INCDIR_WAYLAND
LIBS += $$QMAKE_LIBS_WAYLAND
QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_WAYLAND

INCLUDEPATH += $$PWD

contains(QT_CONFIG, opengl) {
    DEFINES += QT_WAYLAND_GL_SUPPORT
    QT += opengl

    contains(QT_CONFIG, opengles2) {
        CONFIG += wayland_egl
        #CONFIG += xpixmap_egl
        #CONFIG += xcomposite_egl
    } else {
        CONFIG += xpixmap_glx
        #CONFIG += xcomposite_gl

    }

    include ($$PWD/gl_integration/gl_integration.pri)
}

include (../fontdatabases/genericunix/genericunix.pri)

target.path += $$[QT_INSTALL_PLUGINS]/platforms
INSTALLS += target