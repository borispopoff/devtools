#!/usr/bin/bash

# single command to produce a working, self contained installation of emacs on msys2
# see also nt/INSTALL.W64
# https://sourceforge.net/p/emacsbinw64/wiki/Build%20guideline%20for%20MSYS2-MinGW-w64%20system/

################
## PREREQUISITES
# list of prerequisite libraries and tools
# required for compilation;
# autoconf may be missing here
pacman -Sy --needed base-devel \
  mingw-w64-x86_64-toolchain \
  mingw-w64-x86_64-xpm-nox \
  mingw-w64-x86_64-libtiff \
  mingw-w64-x86_64-giflib \
  mingw-w64-x86_64-libpng \
  mingw-w64-x86_64-libjpeg-turbo \
  mingw-w64-x86_64-librsvg \
  mingw-w64-x86_64-libwebp \
  mingw-w64-x86_64-lcms2 \
  mingw-w64-x86_64-jansson \
  mingw-w64-x86_64-libxml2 \
  mingw-w64-x86_64-gnutls \
  mingw-w64-x86_64-zlib \
  mingw-w64-x86_64-harfbuzz

# there is no git in the default config.
# need to install it
pacman -Sy git


################
## SOURCE
# get the source tree
git clone git://git.savannah.gnu.org/emacs.git


################
## BUILD
cd emacs
# ommiting this creates problems during compilation
# apparently some files are corrupted by the automatic conversion
git config core.autocrlf false

# creates the configure script
./autogen.sh
# configure build
PKG_CONFIG_PATH=/mingw64/lib/pkgconfig ./configure --without-imagemagick --without-dbus --without-pop
# build and install
make -j8


################
## INSTALLATION
# the directory where the binary will be installed later
mkdir /c/emacs/
make install prefix=/c/emacs

# having this libraries where the binary is makes the package self contained
# and not dependent on the msys installation.
# it can be then copied to a machine without msys and will just run
cp /mingw64/bin/{libwinpthread-*.dll,libXpm-noX*.dll,libdbus-*.dll} /c/emacs/bin
cp /mingw64/bin/{libgomp-*.dll,libgcc_s_seh-*.dll,libglib-*.dll} /c/emacs/bin
cp /mingw64/bin/{libintl-*.dll,libiconv-*.dll,libgobject-*.dll} /c/emacs/bin
cp /mingw64/bin/{libffi-*.dll,libgdk_pixbuf-*.dll,libgio-*.dll} /c/emacs/bin
cp /mingw64/bin/{libgmodule-*.dll,zlib*.dll,librsvg-*.dll} /c/emacs/bin
cp /mingw64/bin/{libcairo-*.dll,libcroco-*.dll,libpango-*.dll} /c/emacs/bin
cp /mingw64/bin/{libpangocairo-*.dll,libxml2-*.dll,libfontconfig-*.dll} /c/emacs/bin
cp /mingw64/bin/{libfreetype-*.dll,libpixman-*.dll,libpng*.dll} /c/emacs/bin
cp /mingw64/bin/{libpangoft*.dll,libpangowin32-*.dll,liblzma-*.dll} /c/emacs/bin
cp /mingw64/bin/{libexpat-*.dll,libharfbuzz-*.dll,libgnutls-*.dll} /c/emacs/bin
cp /mingw64/bin/{libgnutlsxx-*.dll,libtiff-*.dll,libtiffxx-*.dll} /c/emacs/bin
cp /mingw64/bin/{libjpeg-*.dll,libgif-*.dll,libbz2-*.dll,libjbig-*.dll} /c/emacs/bin
cp /mingw64/bin/{libgmp-*.dll,libhogweed-*.dll,libnettle-*.dll} /c/emacs/bin
cp /mingw64/bin/{libp11-kit-*.dll,libtasn1-*.dll} /c/emacs/bin
