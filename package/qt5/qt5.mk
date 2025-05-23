################################################################################
#
# qt5
#
################################################################################

QT5_VERSION_MAJOR = 5.15
QT5_VERSION = $(QT5_VERSION_MAJOR).11
QT5_SITE = https://invent.kde.org/qt/qt

include $(sort $(wildcard package/qt5/*/*.mk))

# The file "qt.conf" can be used to override the hard-coded paths that are
# compiled into the Qt library. We need it to make "qmake" relocatable and
# tweak the per-package install paths
define QT5_INSTALL_QT_CONF
	rm -f $(HOST_DIR)/bin/qt.conf
	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
endef

ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
define QT5_QT_CONF_FIXUP
	$(QT5_INSTALL_QT_CONF)
endef
endif

# Variable for other Qt applications to use
QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
