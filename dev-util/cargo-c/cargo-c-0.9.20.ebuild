# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

# Only bother defining this if the github tarball doesn't work!
# Otherwise just comment it out and things should Just Work (TM).
#MY_P="${P}+cargo-{CARGO_V}"

CRATES="
	${MY_P}
	adler-1.0.2
	ahash-0.8.3
	aho-corasick-0.7.18
	anstream-0.3.2
	anstyle-1.0.0
	anstyle-parse-0.2.0
	anstyle-query-1.0.0
	anstyle-wincon-1.0.1
	anyhow-1.0.58
	arc-swap-1.6.0
	arrayvec-0.5.2
	autocfg-1.1.0
	base16ct-0.2.0
	base64-0.21.2
	base64ct-1.6.0
	bitflags-1.3.2
	bitmaps-2.1.0
	block-buffer-0.10.4
	bstr-0.2.17
	bstr-1.5.0
	btoi-0.4.3
	bumpalo-3.13.0
	bytes-1.1.0
	bytesize-1.1.0
	cargo-0.71.0
	cargo-platform-0.1.2
	cargo-util-0.2.4
	cbindgen-0.24.3
	cc-1.0.73
	cfg-if-1.0.0
	clap-4.3.1
	clap_builder-4.3.1
	clap_derive-4.3.1
	clap_lex-0.5.0
	clru-0.6.1
	colorchoice-1.0.0
	const-oid-0.9.2
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	cpufeatures-0.2.7
	crates-io-0.36.0
	crc32fast-1.3.2
	crossbeam-channel-0.5.8
	crossbeam-utils-0.8.10
	crypto-bigint-0.5.2
	crypto-common-0.1.6
	ct-codecs-1.1.1
	curl-0.4.44
	curl-sys-0.4.63+curl-8.1.2
	der-0.7.6
	digest-0.10.7
	dirs-4.0.0
	dirs-sys-0.3.7
	dunce-1.0.4
	ecdsa-0.16.7
	ed25519-compact-2.0.4
	either-1.7.0
	elliptic-curve-0.13.5
	env_logger-0.10.0
	errno-0.3.1
	errno-dragonfly-0.1.2
	fastrand-1.7.0
	ff-0.13.0
	fiat-crypto-0.1.20
	filetime-0.2.17
	flate2-1.0.24
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	fwdansi-1.1.0
	generic-array-0.14.7
	getrandom-0.2.9
	git2-0.17.2
	git2-curl-0.18.0
	gix-0.39.0
	gix-actor-0.19.0
	gix-attributes-0.10.0
	gix-bitmap-0.2.3
	gix-chunk-0.4.1
	gix-command-0.2.4
	gix-config-0.18.0
	gix-config-value-0.10.2
	gix-credentials-0.11.0
	gix-date-0.4.3
	gix-diff-0.28.1
	gix-discover-0.15.0
	gix-features-0.28.1
	gix-glob-0.5.5
	gix-hash-0.10.4
	gix-hashtable-0.1.3
	gix-index-0.14.0
	gix-lock-4.0.0
	gix-mailmap-0.11.0
	gix-object-0.28.0
	gix-odb-0.42.0
	gix-pack-0.32.0
	gix-packetline-0.14.3
	gix-path-0.7.3
	gix-prompt-0.3.3
	gix-protocol-0.28.0
	gix-quote-0.4.3
	gix-ref-0.26.0
	gix-refspec-0.9.0
	gix-revision-0.12.2
	gix-sec-0.6.2
	gix-tempfile-4.1.1
	gix-transport-0.27.0
	gix-traverse-0.24.0
	gix-url-0.15.0
	gix-validate-0.7.4
	gix-worktree-0.14.0
	glob-0.3.0
	globset-0.4.9
	group-0.13.0
	hashbrown-0.12.3
	hashbrown-0.13.2
	heck-0.4.0
	hermit-abi-0.3.1
	hex-0.4.3
	hkdf-0.12.3
	hmac-0.12.1
	home-0.5.3
	http-auth-0.1.8
	humantime-2.1.0
	idna-0.2.3
	ignore-0.4.18
	im-rc-15.1.0
	imara-diff-0.1.5
	indexmap-1.9.1
	instant-0.1.12
	io-close-0.3.7
	io-lifetimes-1.0.11
	is-terminal-0.4.7
	itertools-0.10.3
	itoa-1.0.6
	jobserver-0.1.26
	js-sys-0.3.63
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.144
	libgit2-sys-0.15.2+1.6.4
	libnghttp2-sys-0.1.7+1.45.0
	libssh2-sys-0.3.0
	libz-sys-1.1.8
	linux-raw-sys-0.3.8
	lock_api-0.4.9
	log-0.4.17
	matches-0.1.9
	maybe-async-0.2.7
	memchr-2.5.0
	memmap2-0.5.10
	minimal-lexical-0.2.1
	miniz_oxide-0.5.3
	miow-0.5.0
	nix-0.26.2
	nom-7.1.3
	num-traits-0.2.15
	num_threads-0.1.6
	once_cell-1.18.0
	opener-0.5.0
	openssl-0.10.40
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-src-111.21.0+1.1.1p
	openssl-sys-0.9.74
	ordered-float-2.10.0
	orion-0.17.4
	os_info-3.7.0
	p384-0.13.0
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	pasetors-0.6.6
	pathdiff-0.2.1
	pem-rfc7468-0.7.0
	percent-encoding-2.1.0
	pkcs8-0.10.2
	pkg-config-0.3.25
	ppv-lite86-0.2.17
	primeorder-0.13.2
	proc-macro2-1.0.59
	prodash-23.1.2
	quote-1.0.28
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	rand_xoshiro-0.6.0
	redox_syscall-0.2.13
	redox_users-0.4.3
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.26
	remove_dir_all-0.5.3
	rfc6979-0.4.0
	rustc-workspace-hack-1.0.0
	rustfix-0.6.1
	rustix-0.37.19
	ryu-1.0.10
	same-file-1.0.6
	schannel-0.1.20
	scopeguard-1.1.0
	sec1-0.7.2
	semver-1.0.12
	serde-1.0.163
	serde-value-0.7.0
	serde_derive-1.0.163
	serde_ignored-0.1.3
	serde_json-1.0.82
	serde_spanned-0.6.2
	sha1-0.10.5
	sha1_smol-1.0.0
	sha2-0.10.6
	shell-escape-0.1.5
	signal-hook-0.3.15
	signal-hook-registry-1.4.1
	signature-2.1.0
	sized-chunks-0.6.5
	smallvec-1.10.0
	socket2-0.4.4
	spki-0.7.2
	static_assertions-1.1.0
	strip-ansi-escapes-0.1.1
	strsim-0.10.0
	subtle-2.5.0
	syn-1.0.98
	syn-2.0.18
	tar-0.4.38
	tempfile-3.3.0
	termcolor-1.1.3
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.4
	time-0.3.21
	time-core-0.1.1
	time-macros-0.2.9
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	toml-0.5.9
	toml-0.7.4
	toml_datetime-0.6.2
	toml_edit-0.19.10
	typenum-1.15.0
	unicode-bidi-0.3.8
	unicode-bom-1.1.4
	unicode-ident-1.0.1
	unicode-normalization-0.1.21
	unicode-width-0.1.9
	unicode-xid-0.2.3
	url-2.2.2
	utf8parse-0.2.1
	vcpkg-0.2.15
	version_check-0.9.4
	vte-0.10.1
	vte_generate_state_changes-0.1.1
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.86
	wasm-bindgen-backend-0.2.86
	wasm-bindgen-macro-0.2.86
	wasm-bindgen-macro-support-0.2.86
	wasm-bindgen-shared-0.2.86
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.43.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.4.6
	zeroize-1.6.0
"

inherit cargo

DESCRIPTION="Helper program to build and install c-like libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
if [[ -z ${MY_P} ]] ; then
	SRC_URI="https://github.com/lu-zero/cargo-c/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
else
	S="${WORKDIR}/${MY_P}"
fi

SRC_URI+=" $(cargo_crate_uris)"


LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

RDEPEND="dev-libs/libgit2:=
	dev-libs/openssl:=
	net-libs/libssh2:=
	net-misc/curl[ssl]
	sys-libs/zlib"
DEPEND="${RDEPEND}"
BDEPEND=">=virtual/rust-1.69.0"

QA_FLAGS_IGNORED="usr/bin/cargo-capi usr/bin/cargo-cbuild usr/bin/cargo-ctest usr/bin/cargo-cinstall"

src_unpack() {
	cargo_src_unpack

	if [[ -n ${MY_P} ]] ; then
		tar -xf "${DISTDIR}"/"${MY_P}.crate" -C "${WORKDIR}" || die
	fi
}

src_configure() {
	# Some crates will auto-build and statically link C libraries(!)
	# Tracker bug #709568
	export LIBSSH2_SYS_USE_PKG_CONFIG=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export PKG_CONFIG_ALLOW_CROSS=1
}
