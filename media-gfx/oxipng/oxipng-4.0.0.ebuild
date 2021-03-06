# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
adler-0.2.3
adler32-1.2.0
ansi_term-0.11.0
atty-0.2.14
autocfg-1.0.1
bit-vec-0.6.2
bitflags-1.2.1
build_const-0.2.1
bytemuck-1.4.1
byteorder-1.3.4
cc-1.0.62
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.33.3
cloudflare-zlib-0.2.5
cloudflare-zlib-sys-0.2.0
color_quant-1.1.0
const_fn-0.4.3
crc-1.8.1
crc32fast-1.2.1
crossbeam-channel-0.5.0
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.0
crossbeam-utils-0.8.0
deflate-0.8.6
either-1.6.1
glob-0.3.0
hashbrown-0.9.1
hermit-abi-0.1.17
image-0.23.11
indexmap-1.6.0
itertools-0.9.0
lazy_static-1.4.0
libc-0.2.80
libdeflate-sys-0.5.0
libdeflater-0.5.0
log-0.4.11
memoffset-0.5.6
miniz_oxide-0.3.7
miniz_oxide-0.4.3
num-integer-0.1.44
num-iter-0.1.42
num-rational-0.3.2
num-traits-0.2.14
num_cpus-1.13.0
pest-2.1.3
png-0.16.7
rayon-1.5.0
rayon-core-1.9.0
rgb-0.8.25
rustc_version-0.3.0
scopeguard-1.1.0
semver-0.11.0
semver-parser-0.10.1
stderrlog-0.5.0
strsim-0.8.0
termcolor-1.1.0
textwrap-0.11.0
thread_local-1.0.1
time-0.1.44
typed-arena-1.7.0
ucd-trie-0.1.3
unicode-width-0.1.8
vec_map-0.8.2
wasi-0.10.0+wasi-snapshot-preview1
wild-2.0.4
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
zopfli-0.4.0
"

inherit cargo

DESCRIPTION="A lossless PNG compression optimizer"
HOMEPAGE="https://github.com/shssoichiro/oxipng"
SRC_URI="https://github.com/shssoichiro/oxipng/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
# Prevent portage from trying to fetch bunch of *.crate from mirror despite they are not mirrored.
RESTRICT="mirror"
LICENSE="Apache-2.0 MIT ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	cargo_src_install

	dodoc CHANGELOG.md README.md
}
