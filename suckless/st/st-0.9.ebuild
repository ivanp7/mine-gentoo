EAPI=8

DESCRIPTION="A simple virtual terminal emulator for X."
HOMEPAGE="https://st.suckless.org"
SRC_URI="https://github.com/ivanp7/st-ivanp7/archive/master.tar.gz"

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

    local shrdir="${D}/usr/share"
    local docdir="$shrdir/doc/${P}"

    local installopts='--mode 0644 -D --target-directory'

    install $installopts "$shrdir/${PN}" "${S}/st.info"
    install $installopts "$docdir" "${S}/README"
    install $installopts "$docdir" "${S}/README.terminfo.rst"
}

