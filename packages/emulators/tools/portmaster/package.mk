#UzuCore

PKG_NAME="portmaster"
PKG_LICENSE="CUSTOM"
PKG_ARCH="any"
PKG_URL="https://github.com/christianhaitian/PortMaster/raw/main/PortMaster.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_SOURCE_DIR="PortMaster by christianhaitian"
PKG_LONGDESC="PortMaster library"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  #mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
  #cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
}

