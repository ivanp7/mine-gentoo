EAPI=8

FROM_LANG="Russian"
TO_LANG="English"
DICT_PREFIX="full-"

inherit stardict

HOMEPAGE="http://download.huzheng.org/ru/"
SRC_URI="http://download.huzheng.org/ru/${PN}-${PV}.tar.bz2"

KEYWORDS="amd64 ppc ~riscv sparc x86"
