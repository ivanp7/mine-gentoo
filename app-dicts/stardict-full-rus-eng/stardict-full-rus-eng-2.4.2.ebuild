EAPI=8

FROM_LANG="Russian"
TO_LANG="English"
DICT_PREFIX="full-"

inherit stardict

HOMEPAGE="https://git.sr.ht/~rostiger/stardict/"
SRC_URI="https://git.sr.ht/~rostiger/stardict/blob/main/src/ru/${PN}-${PV}.tar.bz2"

KEYWORDS="amd64 ppc ~riscv sparc x86"
