EAPI=8

DESCRIPTION="A generic menu for X."
HOMEPAGE="https://tools.suckless.org/dmenu"
SRC_URI="https://github.com/ivanp7/dmenu-ivanp7/archive/master.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/dmenu-ivanp7-master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=x11-libs/libXft-2.3.6
>=x11-libs/libXinerama-1.1.5"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
    : # do nothing
}

src_compile() {
    emake PREFIX=/usr DESTDIR="${D}" X11INC=/usr/include/X11 X11LIB=/usr/lib64/X11
}

src_install() {
    emake PREFIX=/usr DESTDIR="${D}" install
}

