EAPI=8

inherit desktop

DESCRIPTION="Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer."
HOMEPAGE="https://github.com/nsxiv/nsxiv"
SRC_URI="https://github.com/nsxiv/nsxiv/archive/master.tar.gz -> ${P}.tar.gz
https://github.com/ivanp7/nsxiv-ivanp7/archive/master.tar.gz -> ${P}_patches.tar.gz"
S="${WORKDIR}/nsxiv-master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=x11-libs/libXft-2.3.6
>=media-libs/imlib2-1.9.1-r1
>=media-libs/giflib-5.2.1-r1
>=media-libs/libwebp-1.2.4-r1
>=media-libs/libexif-0.6.24"
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
    cp -t . -- "$WORKDIR/nsxiv-ivanp7-master/config.h"
    cp -t . -- "$WORKDIR/nsxiv-ivanp7-master/keycodes.patch"
    cp -t etc -- "$WORKDIR/nsxiv-ivanp7-master/nsxiv.1"

    sed -i '/^install: / s|: all|:|' Makefile

    eapply keycodes.patch
    eapply_user
}

src_configure() {
    : # do nothing
}

src_compile() {
    emake PREFIX=/usr DESTDIR="${D}" OPT_DEP_DEFAULT=1
}

src_install() {
    emake PREFIX=/usr DESTDIR="${D}" EGPREFIX=/usr/share/doc/${P}/examples install-all
}

pkg_postinst() {
    xdg_desktop_database_update
}

pkg_postrm() {
    xdg_desktop_database_update
}

