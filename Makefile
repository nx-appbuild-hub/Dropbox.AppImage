SHELL := /usr/bin/bash
APPDIR := ./AppDir
PWD := $(shell pwd)


all:
	wget --output-document=dropbox.tar.xz --continue "https://www.dropbox.com/download?plat=lnx.x86_64"
	mkdir -p ./build
	tar xzf dropbox.tar.xz -C ./build

	mkdir -p ./AppDir/application
	mkdir -p ./AppDir/lib
	cp -r ./build/.dropbox-dist/* ./AppDir/application
	export ARCH=x86_64 && bin/appimagetool-x86_64.AppImage  ./AppDir dropbox.AppImage
	chmod +x ./dropbox.AppImage
	rm -rf ./AppDir/application
	rm -rf ./build
