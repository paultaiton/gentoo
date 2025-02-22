# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A program for sorting files in sophisticated ways"
HOMEPAGE="https://billposer.org/Software/msort.html"
SRC_URI="https://billposer.org/Software/Downloads/${P}.tar.bz2"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="heap +icu +libuninum"

RDEPEND="dev-libs/tre
	icu? ( dev-libs/icu:= )
	!icu? ( dev-libs/libutf8proc:= )
	libuninum? ( dev-libs/libuninum:= )"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-fix-icu-build.patch"
	"${FILESDIR}/${P}-fix-missing-limits-header.patch"
	"${FILESDIR}/${P}-fix-segfault-on-certain-input.patch"
	"${FILESDIR}/${P}-respect-users-cflags.patch"
	"${FILESDIR}/${P}-configure-clang16.patch"
	"${FILESDIR}/${P}-fix-missing-prototypes.patch"
)

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable !heap allocaok)
		$(use_enable !icu utf8proc)
		$(use_enable libuninum uninum)
		--disable-debugbuild
	)

	econf "${myeconfargs[@]}"
}
