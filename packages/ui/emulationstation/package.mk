# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="emulationstation"
PKG_VERSION="0a5be4d4c341022ca9b2c3297cd8e0df7042ceb4"
PKG_GIT_CLONE_BRANCH="main"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/JustEnoughLinuxOS/emulationstation"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="boost toolchain SDL2 freetype curl freeimage bash rapidjson SDL2_mixer fping p7zip alsa vlc drm_tool pugixml"
PKG_NEED_UNPACK="busybox"
PKG_SHORTDESC="Emulationstation emulator frontend"
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"
PKG_PATCH_DIRS+="${DEVICE}"

if [ ! "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL} glu"
  PKG_CMAKE_OPTS_TARGET+=" -DGL=1"
fi

if [ ! "${OPENGLES_SUPPORT}" = no ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  PKG_CMAKE_OPTS_TARGET+=" -DGLES2=1"
fi

if [ ! "${ENABLE_UPDATES}" = "no" ]; then
  PKG_CMAKE_OPTS_TARGET+=" -DENABLE_UPDATES=1"
else
  PKG_CMAKE_OPTS_TARGET+=" -DENABLE_UPDATES=0"
fi

PKG_CMAKE_OPTS_TARGET+=" -DENABLE_EMUELEC=1 \
                         -DDISABLE_KODI=1 \
                         -DENABLE_FILEMANAGER=0 \
                         -DCEC=0 \
                         -DENABLE_PULSE=1 \
                         -DUSE_SYSTEM_PUGIXML=1"

##########################################################################################################
# The following allows building Emulation station from local copy by using EMULATIONSTATION_SRC.
# The built makes symlinks to a local repository.
#
# One time setup:
# ---------------
# cd ~
# git clone https://github.com/JustEnoughLinuxOS/emulationstation.git
# cd emulationstation
# git submodule update --init
#
# Cleanup old files:
# ------------------
# DEVICE=RG351V ARCH=aarch64 ./scripts/clean emulationstation
#
# Build from local copy:
# ----------------------
# EMULATIONSTATION_SRC=~/emulationstation DEVICE=RG351V ARCH=aarch64 ./scripts/build emulationstation
#
# Run from the device:
# --------------------
# Copy ./emulationstation binary found in build.JELOS-<device>.aarch64/emulationstation-*/.install_pkg/usr/bin/
# Via ssh, run emulationstation with
# systemctl stop emustation
# chmod +x ./emulationstation
# ./emulationstation
##########################################################################################################
if [ -n "${EMULATIONSTATION_SRC}" ]; then
unpack() {
  echo cp -PRf ${EMULATIONSTATION_SRC} ${PKG_BUILD}
  cp -PRf ${EMULATIONSTATION_SRC} ${PKG_BUILD}
}
# add some symbolic links to point to a code in local source folder
post_unpack() {
  rm -rf "${PKG_BUILD}/es-app"
  ln -sf "${EMULATIONSTATION_SRC}/es-app" "${PKG_BUILD}"

  rm -rf "${PKG_BUILD}/es-core"
  ln -sf "${EMULATIONSTATION_SRC}/es-core" "${PKG_BUILD}"
}
fi

pre_configure_target() {
  for key in SCREENSCRAPER_DEV_LOGIN \
        GAMESDB_APIKEY \
        CHEEVOS_DEV_LOGIN
  do
    if [ -z "${!key}" ]
    then
      echo "WARNING: ${!key} not declared, will not build support."
    fi
  done

  export DEVICE=$(echo ${DEVICE^^} | sed "s#-#_##g")
}

pre_build_target() {
  cp -f ${ROOT}/distributions/JELOS/fonts/NanumSquareNeo-bRg.ttf ${PKG_BUILD}/resources/
  sed -e 's/NanumMyeongjo.ttf/NanumSquareNeo-bRg.ttf/g' \
      -i ${PKG_BUILD}/es-core/src/resources/Font.cpp

  cp -f ${ROOT}/distributions/JELOS/assets/emulationstation2.po ${PKG_BUILD}/locale/lang/ko/LC_MESSAGES/emulationstation2.po
  msgfmt ${PKG_BUILD}/locale/lang/ko/LC_MESSAGES/emulationstation2.po -o ${PKG_BUILD}/locale/lang/ko/LC_MESSAGES/emulationstation2.mo
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/locale
  cp -rf ${PKG_BUILD}/locale/lang/* ${INSTALL}/usr/config/locale/

  mkdir -p ${INSTALL}/usr/config/emulationstation/resources
  cp -rf ${PKG_BUILD}/resources/* ${INSTALL}/usr/config/emulationstation/resources/
  rm -rf ${INSTALL}/usr/config/emulationstation/resources/logo.png

  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/es_settings ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/es_settings

  cp ${PKG_BUILD}/start_es.sh ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/start_es.sh

  cp ${PKG_BUILD}/ppsspp_font.sh ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/ppsspp_font.sh
  
  mkdir -p ${INSTALL}/usr/lib/${PKG_PYTHON_VERSION}
  cp -rf ${PKG_DIR}/bluez/* ${INSTALL}/usr/lib/${PKG_PYTHON_VERSION}

  mkdir -p ${INSTALL}/usr/bin
  #ln -sf /storage/.config/emulationstation/resources ${INSTALL}/usr/bin/resources
  cp -rf ${PKG_BUILD}/emulationstation ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/etc/emulationstation/
  ln -sf /storage/.config/emulationstation/themes ${INSTALL}/etc/emulationstation/

  cp -rf ${PKG_DIR}/config/common/*.cfg ${INSTALL}/usr/config/emulationstation

  # If we're not an emulation device, ES may still be installed so we need a default config.
  if [ "${EMULATION_DEVICE}" = "no" ] || \
     [ "${BASE_ONLY}" = "true" ]
  then
    cat <<EOF >${INSTALL}/etc/emulationstation/es_systems.cfg
<?xml version="1.0" encoding="UTF-8"?>
<systemList>
        <system>
                <name>tools</name>
                <fullname>Tools</fullname>
                <manufacturer>JELOS</manufacturer>
                <release>2021</release>
                <hardware>system</hardware>
                <path>/storage/.config/modules</path>
                <extension>.sh</extension>
                <command>%ROM%</command>
                <platform>tools</platform>
                <theme>tools</theme>
        </system>
</systemList>
EOF
  fi

  ln -sf /usr/config/emulationstation/es_systems.cfg ${INSTALL}/etc/emulationstation/es_systems.cfg
  if [ -d "${PKG_DIR}/config/device/${DEVICE}" ]; then
    cp -rf ${PKG_DIR}/config/device/${DEVICE}/*.cfg ${INSTALL}/usr/config/emulationstation
  fi

  ln -sf /storage/.cache/system_timezone ${INSTALL}/etc/timezone

  #Delete all vulkan options from es_features when vulkan is not present
  if [ ! "${VULKAN_SUPPORT}" = "yes" ]
    then
      sed -i '/vulkan/d' ${INSTALL}/usr/config/emulationstation/es_features.cfg
  fi
}


post_install() {
  mkdir -p ${INSTALL}/usr/share
  ln -sf /storage/.config/locale ${INSTALL}/usr/share/locale

  mkdir -p ${INSTALL}/usr/lib
  ln -sf /usr/share/locale ${INSTALL}/usr/lib/locale

  ln -sf /usr/share/locale  ${INSTALL}/usr/config/emulationstation/locale

}
