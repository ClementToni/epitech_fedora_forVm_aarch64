#!/usr/bin/env bash

clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP FEDORA aarch64"

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[teams]\nname=teams\nbaseurl=https://packages.microsoft.com/yumrepos/ms-teams\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/teams.repo'
dnf -y install dnf-plugins-core && dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf upgrade -y

packages_list=(boost-devel.aarch64
               boost-static.aarch64
               ca-certificates.noarch
               clang.aarch64
               cmake.aarch64
               CUnit-devel.aarch64
               curl.aarch64
               flac-devel.aarch64
               freetype-devel.aarch64
               gcc.aarch64
               gcc-c++.aarch64
               gdb.aarch64
               git
               glibc.aarch64
               glibc-devel.aarch64
               glibc-locale-source.aarch64
               gmp-devel.aarch64
               ksh.aarch64
               elfutils-libelf-devel.aarch64
               libjpeg-turbo-devel.aarch64
               libvorbis-devel.aarch64
               libX11-devel.aarch64
               libXext-devel.aarch64
               ltrace.aarch64
               make.aarch64
               nasm.aarch64
               ncurses.aarch64
               ncurses-devel.aarch64
               ncurses-libs.aarch64
               net-tools.aarch64
               openal-soft-devel.aarch64
               python3-numpy.aarch64
               python3.aarch64
               rlwrap.aarch64
               ruby.aarch64
               strace.aarch64
               tar.aarch64
               tcsh.aarch64
               tmux.aarch64
               sudo.aarch64
               tree.aarch64
               unzip.aarch64
               valgrind.aarch64
               vim
               emacs-nox
               which.aarch64
               xcb-util-image.aarch64
               xcb-util-image-devel.aarch64
               zip.aarch64
               zsh.aarch64
               avr-gcc.aarch64
               qt-devel
               docker
               docker-compose
               java-17-openjdk
               java-17-openjdk-devel
               boost
               boost-math
               boost-graph
               autoconf
               automake
               tcpdump
               wireshark
               nodejs
               emacs-tuareg
               libvirt
               libvirt-devel
               virt-install
               haskell-platform
               golang
               systemd-devel
               libgudev-devel
               php.aarch64
               php-devel.aarch64
               php-bcmath.aarch64
               php-cli.aarch64
               php-gd.aarch64
               php-mbstring.aarch64
               php-mysqlnd.aarch64
               php-pdo.aarch64
               php-pear.noarch
               php-xml.aarch64
               php-gettext-gettext.noarch
               php-phar-io-version.noarch
               php-theseer-tokenizer.noarch
               SFML.aarch64
               SFML-devel.aarch64
               CSFML.aarch64
               CSFML-devel.aarch64
               irrlicht.aarch64
               irrlicht-devel.aarch64
               rust.aarch64
               cargo.aarch64
               mariadb-server.aarch64
               x264.aarch64
               lightspark.aarch64
               lightspark-mozilla-plugin.aarch64
               teams.aarch64
               SDL2.aarch64
               SDL2-devel.aarch64
               SDL2_image.aarch64)

dnf -y install ${packages_list[@]}

# Criterion
curl -sSL "https://github.com/Snaipe/Criterion/releases/download/v2.4.0/criterion-2.4.0-linux-aarch64.tar.xz" -o criterion-2.4.0.tar.xz
tar xf criterion-2.4.0.tar.xz
cp -r criterion-2.4.0/* /usr/local/
echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local.conf
ldconfig
rm -rf criterion-2.4.0.tar.xz criterion-2.4.0/

# Sbt
curl -sSL "https://github.com/sbt/sbt/releases/download/v1.3.13/sbt-1.3.13.tgz" | tar xz
mv sbt /usr/local/share
ln -s '/usr/local/share/sbt/bin/sbt' '/usr/local/bin'

# Gradle
wget https://services.gradle.org/distributions/gradle-7.2-bin.zip
mkdir /opt/gradle && unzip -d /opt/gradle gradle-7.2-bin.zip && rm -f gradle-7.2-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-7.2/bin' >> /etc/profile

# Stack
curl -sSL https://get.haskellstack.org/ | sh

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 278bb6a630e6474f99028a8ee1a5c763e943d9a3
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

# CONFIG VIM
git clone https://github.com/Epitech/vim-epitech.git
cd vim-epitech
git checkout ec936f2a49ca673901d56598e141932fd309ddac
./install.sh
cd .. && rm -rf vim-epitech
