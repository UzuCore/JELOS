#UzuCore

PKG_NAME="es-colorful-simplified-dc"
PKG_VERSION="da0f1bb6c626a2a0061c9f681a016bbea66bfdd2"
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
