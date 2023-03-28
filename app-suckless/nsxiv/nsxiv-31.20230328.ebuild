EAPI=8

DESCRIPTION="Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer."
HOMEPAGE="https://github.com/nsxiv/nsxiv"
SRC_URI="https://github.com/nsxiv/nsxiv/archive/157646f.tar.gz"
S="${WORKDIR}/nsxiv-157646f54cd010c8c884998319954006260f960e"

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

src_configure() {
    if ! curl -fLo "config.h" "https://raw.githubusercontent.com/ivanp7/nsxiv-ivanp7/master/config.h" ||
        ! curl -fLo "keycodes.patch" "https://raw.githubusercontent.com/ivanp7/nsxiv-ivanp7/master/keycodes.patch" ||
        ! curl -fLo "etc/nsxiv.1" "https://raw.githubusercontent.com/ivanp7/nsxiv-ivanp7/master/nsxiv.1"
    then
        echo "Error: download failure"
        die
    fi

    patch < keycodes.patch
    sed -i '/^install: / s|: all|:|' Makefile
}

src_compile() {
    emake DESTDIR="${D}" OPT_DEP_DEFAULT=1
}

src_install() {
    emake DESTDIR="${D}" install-all
}

