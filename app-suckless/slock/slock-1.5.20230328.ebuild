EAPI=8

DESCRIPTION="A simple X display locker."
HOMEPAGE="https://tools.suckless.org/slock"
SRC_URI="https://github.com/ivanp7/slock-ivanp7/archive/246b33c.tar.gz"
S="${WORKDIR}/slock-ivanp7-246b33c838ce10fcb9133f5c911f8d68b4ea401d"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=x11-libs/libXrandr-1.5.3
>=media-libs/imlib2-1.9.1-r1"
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

