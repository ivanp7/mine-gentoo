EAPI=8

inherit rpm linux-info multilib

DESCRIPTION="Brother DCP-L2540DN printer driver"
HOMEPAGE="http://support.brother.com"
SRC_URI="http://download.brother.com/welcome/dlf101761/dcpl2540dnlpr-3.2.0-1.i386.rpm
    http://download.brother.com/welcome/dlf101762/dcpl2540dncupswrapper-3.2.0-1.i386.rpm"
S=${WORKDIR}

LICENSE="brother-eula GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="avahi"

RESTRICT="mirror strip"

DEPEND="net-print/cups
    avahi? ( net-dns/avahi
        sys-auth/nss-mdns )"
RDEPEND="${DEPEND}"


pkg_setup() {
    CONFIG_CHECK=""
    if use amd64; then
        CONFIG_CHECK="${CONFIG_CHECK} ~IA32_EMULATION"
        if ! has_multilib_profile; then
            die "This package CANNOT be installed on pure 64-bit system. You need multilib enabled."
        fi
    fi

    linux-info_pkg_setup
}

src_unpack() {
    rpm_unpack ${A}
}

src_prepare() {
    sed -ie '47,53c my $basedir = "/opt/brother/Printers/DCPL2540DN";' "${S}/opt/brother/Printers/DCPL2540DN/cupswrapper/brother_lpdwrapper_DCPL2540DN"
    eapply_user
}

src_install() {
    cp -r var "${D}" || die
    cp -r opt "${D}" || die
    cp -r etc "${D}" || die

    mkdir -p "${D}/usr/libexec/cups/filter" || die
    ( cd "${D}/usr/libexec/cups/filter/" && ln -s ../../../../opt/brother/Printers/DCPL2540DN/cupswrapper/brother_lpdwrapper_DCPL2540DN ) || die

    mkdir -p "${D}/usr/share/cups/model" || die
    ( cd "${D}/usr/share/cups/model" && ln -s ../../../../opt/brother/Printers/DCPL2540DN/cupswrapper/brother-DCPL2540DN-cups-en.ppd ) || die
}

pkg_postinst() {
    einfo "If you don't use avahi with nss-mdns, you'll have to use a static IP address in your printer configuration"
    einfo "If you want to use a broadcasted name, add .local to it"
    einfo "You can test if it's working with ping printername.local"
}

