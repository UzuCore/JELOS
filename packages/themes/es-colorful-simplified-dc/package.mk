#UzuCore

PKG_NAME="es-colorful-simplified-dc"
PKG_VERSION="e22ac49bf7d63ec18831f3dfcd97b1e502d7128d"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/UzuCore/es-colorful-simplified-dc"
PKG_URL="${PKG_SITE}.git"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="Colorful (Simplified)"
PKG_LONGDESC="Colorful (Simplified)"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
  cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
}
