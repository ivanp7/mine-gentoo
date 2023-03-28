EAPI=8

DESCRIPTION="A simple generic tabbed frontend to xembed aware applications."
HOMEPAGE="https://tools.suckless.org/tabbed"
SRC_URI="https://github.com/ivanp7/tabbed-ivanp7/archive/8bfdbc3.tar.gz"
S="${WORKDIR}/tabbed-ivanp7-8bfdbc33b92ee5585a2b4f77ae6a324b5f4340b6"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=x11-libs/libXft-2.3.6"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
    : # do nothing
}

src_compile() {
    emake DESTDIR="${D}" X11INC=/usr/include/X11 X11LIB=/usr/lib64/X11
}

src_install() {
    emake DESTDIR="${D}" install
}

