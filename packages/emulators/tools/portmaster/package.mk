#UzuCore

PKG_NAME="portmaster"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_URL="https://github.com/christianhaitian/PortMaster/raw/main/PortMaster.zip"
PKG_SHORTDESC="PortMaster"
PKG_LONGDESC="PortMaster by christianhaitian"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p ${INSTALL}/storage/portmaster
  cp * ${INSTALL}/storage/portmaster
  ln -s ${INSTALL}/storage/portmaster ${INSTALL}/storage/roms/ports
}
