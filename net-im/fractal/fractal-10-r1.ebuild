# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

declare -A GIT_CRATES=(
	[matrix-sdk-base]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-base'
	[matrix-sdk-common]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-common'
	[matrix-sdk-crypto]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-crypto'
	[matrix-sdk-indexeddb]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-indexeddb'
	[matrix-sdk-qrcode]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-qrcode'
	[matrix-sdk-sqlite]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-sqlite'
	[matrix-sdk-store-encryption]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-store-encryption'
	[matrix-sdk-ui]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk-ui'
	[matrix-sdk]='https://github.com/matrix-org/matrix-rust-sdk;66ffc3448ee17e263311c3d4747d779cc79a904d;matrix-rust-sdk-%commit%/crates/matrix-sdk'
	[ruma-client-api]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-client-api'
	[ruma-common]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-common'
	[ruma-events]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-events'
	[ruma-federation-api]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-federation-api'
	[ruma-html]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-html'
	[ruma-identifiers-validation]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-identifiers-validation'
	[ruma-macros]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma-macros'
	[ruma]='https://github.com/ruma/ruma;b868438f5d91918e97d2c3f64d7c82a0d86d29d4;ruma-%commit%/crates/ruma'
	[vodozemac]='https://github.com/matrix-org/vodozemac;3d655add09992d17fdb2b55c60f532658090487d;vodozemac-%commit%'
)

RUST_MIN_VER="1.82.0"

inherit cargo gnome2-utils meson

MY_P=${P/_/.}
CRATE_P=fractal-${PV}

DESCRIPTION="Matrix messaging app for GNOME written in Rust"
HOMEPAGE="
	https://wiki.gnome.org/Apps/Fractal
	https://gitlab.gnome.org/World/fractal/
"
SRC_URI="
	https://gitlab.gnome.org/World/fractal/-/archive/${PV/_/.}/${MY_P}.tar.bz2
	${CARGO_CRATE_URIS}
"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	SRC_URI+="
		https://github.com/gentoo-crate-dist/fractal/releases/download/${PV}/${CRATE_P}-crates.tar.xz
	"
fi
S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0
	GPL-3+ ISC MIT MPL-2.0 MPL-2.0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/glib-2.82
	>=gui-libs/gtk-4.16:4
	>=gui-libs/libadwaita-1.6:1

	>=media-libs/gstreamer-1.20:1.0
	>=media-libs/gst-plugins-bad-1.20:1.0
	>=media-libs/gst-plugins-base-1.20:1.0

	>=gui-libs/gtksourceview-5.0.0:5
	>=media-libs/libwebp-1.0.0:=
	>=dev-libs/openssl-1.0.1:=
	>=media-libs/libshumate-1.2:1.0
	>=dev-db/sqlite-3.24.0:3
	>=sys-apps/xdg-desktop-portal-1.14.1

	>=media-libs/lcms-2.12.0:2
	>=sys-libs/libseccomp-2.5.0:=

"
RDEPEND="
	${DEPEND}
	media-libs/glycin-loaders
	media-plugins/gst-plugin-gtk4
	virtual/secret-service
"
# clang needed by bindgen
BDEPEND="
	llvm-core/clang
	dev-lang/grass
"

# Rust
QA_FLAGS_IGNORED="usr/bin/fractal"

src_prepare() {
	default

	# upstream dev settings are insane
	sed -i -e 's:profile\.dev:ignored.insanity:' Cargo.toml || die
}

src_configure() {
	local mymesonargs=(
		#-Ddisable-glycin-sandbox=true
	)

	meson_src_configure
	ln -s "${CARGO_HOME}" "${BUILD_DIR}/cargo-home" || die
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
