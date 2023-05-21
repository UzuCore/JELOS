Just Enough Linux Operating System (JELOS)는 소규모 매니아 커뮤니티에서 개발한 휴대용 게임 장치용 불변의 리눅스 배포판입니다. 우리의 목표는 우리가 필요로 하는 기능을 갖춘 운영 체제를 만드는 것이며, 개발 과정에서 재미를 느끼는 것입니다.

## 라이선스
JELOS는 다양한 오픈 소스 구성 요소로 구성된 Linux 배포판입니다. 구성 요소는 각각의 라이선스에 따라 제공됩니다. 이 배포판에는 비상업적 용도로만 라이선스가 부여된 구성 요소가 포함되어 있습니다.

### JELOS 브랜딩
JELOS 브랜드 및 이미지는 [크리에이티브 커먼즈 저작자표시-비영리-동일조건변경허락 4.0 국제 라이선스](https://creativecommons.org/licenses/by-nc-sa/4.0/)에 따라 라이선스가 부여됩니다.

#### 당신은 자유롭게
* 공유 - 모든 매체 또는 형식의 자료 복사 및 재배포합니다.
* 편집 - 자료를 재구성, 변형 및 구축합니다.

#### 다음 약관에 따라
* 귀속 - 적절한 출처를 표시하고 라이선스 링크를 제공하며 변경이 있었는지 표시해야 합니다. 합리적인 방식으로 표시할 수 있지만, 라이선스 제공자가 귀하 또는 귀하의 사용을 보증하는 것처럼 보이는 방식으로 표시해서는 안 됩니다.
* 비상업적 - 상업적 목적으로 자료를 사용할 수 없습니다.
* 동일조건 변경허락 - 자료를 재구성, 변형 또는 구축하는 경우 원본과 동일한 라이선스에 따라 기여한 내용을 배포해야 합니다.

### JELOS Software
Copyright 2021-present Fewtarius

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Flashing
* Download the latest [version of JELOS](https://github.com/JustEnoughLinuxOS/distribution/releases) (.img.gz) for your device.
* Decompress the image.
* Write the image to an SDCARD using an imaging tool.  Common imaging tools include [Balena Etcher](https://www.balena.io/etcher/), [Raspberry Pi Imager](https://www.raspberrypi.com/software/), and [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/).  If you're skilled with the command line, dd works fine too.

## Installation
* JELOS includes an installation tool.  The installation tool can be found in the tools menu.

## Upgrading
* Download and install the update online via the System Settings menu.
* Download the latest [version of JELOS](https://github.com/JustEnoughLinuxOS/distribution/releases) (.tar) for your device.
* Copy the update to your device over the network to your device's update share.
* Reboot the device, and the update will begin automatically.

## Network Access
* External services are disabled by default in stable builds.  When enabled, the username for ssh and samba access is "root".  The root password is generated during every boot, it can be found in the System Settings menu.

## Documentation
* [Home](https://github.com/JustEnoughLinuxOS/distribution/wiki)
* [Donating to JELOS](https://github.com/JustEnoughLinuxOS/distribution/wiki/Donating-to-JELOS)
* [Frequently asked Questions](https://github.com/JustEnoughLinuxOS/distribution/wiki/Frequently-Asked-Questions)
* [HotKeys](https://github.com/JustEnoughLinuxOS/distribution/wiki/Hotkeys)
* [Emulators and Game Engines](https://github.com/JustEnoughLinuxOS/distribution/wiki/JELOS-emulators-and-game-engines)
* [Moonlight Game Streaming](https://github.com/JustEnoughLinuxOS/distribution/wiki/Moonlight-Game-Streaming)
* [Performance and Battery Life Optimizations](https://github.com/JustEnoughLinuxOS/distribution/wiki/Performance-and-Battery-Life-Optimizations)
* [Using Cloud Drives](https://github.com/JustEnoughLinuxOS/distribution/wiki/Using-Cloud-Drives)
* [Tailscale VPN](https://github.com/JustEnoughLinuxOS/distribution/wiki/Tailscale-VPN)
* [Wireguard VPN](https://github.com/JustEnoughLinuxOS/distribution/wiki/WireGuard-VPN)

## Contributing
* [Developing and Building JELOS](https://github.com/JustEnoughLinuxOS/distribution/blob/dev/BUILDING.md)

## Credits
Like any Linux distribution, this project is not the work of one person.  It is the work of many persons all over the world who have developed the open source bits without which this project could not exist.  Special thanks to CoreELEC, LibreELEC, and to developers and contributors across the open source community.
