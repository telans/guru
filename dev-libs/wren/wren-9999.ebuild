# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="The Wren Programming Language"
HOMEPAGE="https://wren.io/"
if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/wren-lang/${PN}.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/wren-lang/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="static-libs tools"

DEPEND=">=dev-libs/libuv-1.10.0"
RDEPEND="${DEPEND}"
BDEPEND=""
#BDEPEND="test? ( dev-lang/python )"
#RESTRICT="!test? ( test )"
RESTRICT="test"

src_configure() {
	return
}

src_compile() {
	local targets=""

	if use static-libs ; then
		#do both shared and static libs
		targets="${targets} vm"
	else
		targets="${targets} shared"
	fi
	if use tools ; then
		targets="${targets} cli"
	fi
	#I don't think tests are working, I just get lots of linker errors
	#if use test ; then
	#	targets="${targets} api_test unit_test"
	#fi

	echo "prefix=\"${EPREFIX}/usr\"" > ${PN}.pc
	echo "libdir=\"\${prefix}/$(get_libdir)\"" >> ${PN}.pc
	echo "includedir=\"\${prefix}/include\"" >> ${PN}.pc
	echo "" >> ${PN}.pc
	echo "Name: ${PN}" >> ${PN}.pc
	echo "Description: ${DESCRIPTION}" >> ${PN}.pc
	echo "URL: ${HOMEPAGE}" >> ${PN}.pc
	echo "Version: ${PV}" >> ${PN}.pc
	echo "Libs: \"-L\${libdir}\" -l${PN}" >> ${PN}.pc
	echo "Cflags: \"-I\${includedir}\"" >> ${PN}.pc

	tc-export AR CC
	emake -f util/wren.mk LIBUV_DIR="${EPREFIX}/usr" LIBUV="${EPREFIX}/usr/$(get_libdir)/libuv.so" VERBOSE=1 ${targets}
}

src_install() {
	if use tools ; then
		dobin bin/wren
	fi
	if use static-libs ; then
		dolib.a lib/libwren.a
	fi
	dolib.so lib/libwren.so
	doheader src/include/wren.h
	doheader src/include/wren.hpp

	insinto /usr/$(get_libdir)/pkgconfig
	doins ${PN}.pc
}
