EAPI=8

DESCRIPTION="A simple X display locker."
HOMEPAGE="https://tools.suckless.org/slock"
SRC_URI="https://github.com/ivanp7/slock-ivanp7/archive/master.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/slock-ivanp7-master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
>=x11-libs/libXrandr-1.5.3
>=media-libs/imlib2-1.9.1-r1
virtual/libcrypt"
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

