#UzuCore

PKG_NAME="portmaster"
PKG_VERSION="1.0"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_URL="https://github.com/christianhaitian/PortMaster/raw/main/PortMaster.zip"
PKG_SHORTDESC="PortMaster"
PKG_LONGDESC="PortMaster by christianhaitian"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}
  unzip ${SOURCES}/portmaster/portmaster-${PKG_VERSION}.zip -d ${PKG_BUILD}/
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/portmaster
  cp -rf ${PKG_BUILD}/PortMaster/. ${INSTALL}/usr/share/portmaster
}
