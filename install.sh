#!/bin/sh -ex

PREFIX=`opam config var root`
MINIOS=xen-minios-v0.1
MINIOS_ARCHIVE=minios-v0.1.tar.gz
MINIOS_URL=https://github.com/talex5/xen/archive/${MINIOS_ARCHIVE}
if [ ! -e ${MINIOS_ARCHIVE} ]; then curl -OL ${MINIOS_URL}; fi
rm -rf ${MINIOS}
tar -zxf ${MINIOS_ARCHIVE}
cd ${MINIOS}/extras/mini-os
make
make install LIBDIR=${PREFIX}/lib INCLUDEDIR=${PREFIX}/include
cd ../../..

LIBM=openlibm-0.3.1-tal1
LIBM_ARCHIVE=v0.3.1-tal1.tar.gz
LIBM_URL=https://github.com/talex5/openlibm/archive/${LIBM_ARCHIVE}
if [ ! -e ${LIBM_ARCHIVE} ]; then curl -OL ${LIBM_URL}; fi
rm -rf ${LIBM}
tar -zxf ${LIBM_ARCHIVE}
cd ${LIBM}
make
make install prefix=${PREFIX}