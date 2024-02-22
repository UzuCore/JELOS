#UzuCore

PKG_NAME="es-theme-anbernic-dc"
PKG_VERSION="b70e9c6368487daa2a6bf8ea7b213043c63b75f6"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/UzuCore/es-theme-anbernic-dc"
PKG_URL="${PKG_SITE}.git"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="Epic Noir"
PKG_LONGDESC="Anbernic Epic Noir"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
  cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
}
