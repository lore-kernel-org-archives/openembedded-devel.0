Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 280807017C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 13:31:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so4174339wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nZWPccHc7rgcawfa9WaJBzJiY243E1FAEviJmv88fLw=;
	b=EKI/v6VVNKpft1J5qJvXsGTb2nYghWFYC1l9JE7/r7J78jR8gWW1HdUlb3Q4kLPXsQ
	E/2BtYWZYzSwY/G4lj1p6XQJJb8VbZXlXi6wuCbcnqODIEIlNS2TcMUwxpMQ+LSVLTAe
	EPYE/uCL2dpTjzh1EDW6WiuIfEhw0vyD7SI3F9X1zfRK2UhQhawrBcRTQhOfzgTaMu+8
	nY4hU4GyYTlozGs9OcfKg3njkldLtkklwbvXCF6V1dvNp2bgrhFbmRTaflZVYPRaK5mU
	iuv6uxZE8pPx9vlQNLNNzSDtsldOErzVBZ4CD1XfRxlcKHRq66rEgIE2v6FoyseHigUb
	IDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nZWPccHc7rgcawfa9WaJBzJiY243E1FAEviJmv88fLw=;
	b=ApyQkd4X+YYHfxiGsS2yOI+w5DbytpqXwFzTQh5nyoVF5aVjPokRyxkUtS61e8YGri
	a1+yrwUKaX+dGFXmjJHZ8nQvQufJnG0BhC8olojV0UHcYde6yD0SBLCwHSmI/zqp98P3
	ea8Nlum549y+VnN41t9KN/eM6IUr+7JhAUU3rFpBmsS9jxfiZmqUh+KGxU6qLnZJ/UG3
	9PUzipJEWQyNHVn/qojnDP3ZkYbv5M375TI5G7BwCth+OmNyx2KqydWmxPVAw5Wg+qRP
	7FfhdjHTjoedm0FfNANIYlPmLs0qB5TZ3S+NKbgSQEk4qOCrpmm2LRBFr2PeR9NALgx8
	Ej7w==
X-Gm-Message-State: AD7BkJKjvHFv/pisAJh2ctUjD3GUNmgZBKZ1PjwcCg1JSAhSxHMHhHfQD0lHwDFO03gBdw==
X-Received: by 10.28.222.214 with SMTP id v205mr4959014wmg.92.1457098318072;
	Fri, 04 Mar 2016 05:31:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b203sm3378271wmh.8.2016.03.04.05.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 05:31:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2016 14:34:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160304133409.GB2557@jama>
References: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH v2 1/2] efivar: update to 0.23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2016 13:31:58 -0000
X-Groupsio-MsgNum: 60337
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 08:14:54AM +0100, Koen Kooi wrote:
> Upstream removed the use of the nvme headers completely, so no more confl=
icts. Also drop gcc options patch, ubuntu 12.04 is too old to support in me=
ta-oe/master.

This fails to build static version, when no-static-libs.inc is used
(e.g. default in Poky).

Can you either disable static in popt or change efivar to respect
--disable-static (if possible)?

5.3.0/ld: cannot find -lpopt
| collect2: error: ld returned 1 exit status
| make[1]: *** [efivar-static] Error 1
| make[1]: *** Waiting for unfinished jobs....


>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../efivar/0001-efivar-fix-for-cross-compile.patch | 21 +++----
>  ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------=
------
>  meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 39 ------------
>  meta-oe/recipes-extended/efivar/efivar_0.23.bb     | 36 +++++++++++
>  4 files changed, 45 insertions(+), 122 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-op=
tions-not-supported-by-lower-version-gcc.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.23.bb
>=20
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-c=
ross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix=
-for-cross-compile.patch
> index 4bd7d95..b02edd9 100644
> --- a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-co=
mpile.patch
> +++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-co=
mpile.patch
> @@ -12,20 +12,17 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/src/Makefile b/src/Makefile
> -index 6eac858..ef4eb1d 100644
> +index 5fc7887..1829d22 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
> - makeguids : makeguids.o fakeguid.o
> - 	$(CC) $(cflags) -o $@ $^ -ldl
> -=20
> +@@ -29,8 +29,8 @@ all : deps $(TARGETS)
> + ./guid-symbols.c : include/efivar/efivar-guids.h
> + ./guids.bin : include/efivar/efivar-guids.h
> + ./names.bin : include/efivar/efivar-guids.h
>  -include/efivar/efivar-guids.h : makeguids guids.txt
> --	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> +-	./makeguids guids.txt guids.bin names.bin \
>  +include/efivar/efivar-guids.h : guids.txt
> -+	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> ++	makeguids guids.txt guids.bin names.bin \
> + 		guid-symbols.c include/efivar/efivar-guids.h
>  =20
> - guidlist.o : guids.S include/efivar/efivar-guids.h
> - 	$(CC) $(cflags) -c -o guidlist.o guids.S
> ---=20
> -2.6.0.rc2.10.gf4d9753
> -
> + makeguids : CPPFLAGS+=3D-DEFIVAR_BUILD_ENVIRONMENT
> diff --git a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-n=
ot-supported-by-lower-version-gcc.patch b/meta-oe/recipes-extended/efivar/e=
fivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
> deleted file mode 100644
> index 7f04b19..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supp=
orted-by-lower-version-gcc.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -gcc options '-Wmaybe-uninitialized' and '-std=3Dgnu11' are not recognize=
d by gcc
> -whose version is lower than 4.6, such as on Ubuntu 12.04. Drop them for =
backward
> -compatible.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -diff --git a/Make.defaults b/Make.defaults
> -index cc2baa9..118ae56 100644
> ---- a/Make.defaults
> -+++ b/Make.defaults
> -@@ -10,10 +10,9 @@ CFLAGS	?=3D -O2 -g
> -=20
> - ARCH =3D $(shell uname -m)
> - clang_cflags =3D
> --gcc_cflags =3D -Wmaybe-uninitialized
> - cflags	:=3D $(CFLAGS) \
> - 	-Werror -Wall -Wsign-compare -Wstrict-aliasing \
> --	-std=3Dgnu11 -fshort-wchar -fPIC \
> -+	-fshort-wchar -fPIC \
> - 	-fvisibility=3Dhidden \
> - 	-D_GNU_SOURCE -I${TOPDIR}/src/include/efivar/ \
> - 	$(if $(filter $(CC),clang),$(clang_cflags),) \
> -diff --git a/src/guid.h b/src/guid.h
> -index 9542ee1..0817991 100644
> ---- a/src/guid.h
> -+++ b/src/guid.h
> -@@ -31,7 +31,8 @@ static inline int
> - real_isspace(char c)
> - {
> - 	char spaces[] =3D " \f\n\r\t\v";
> --	for (int i =3D 0; spaces[i] !=3D '\0'; i++)
> -+	int i;
> -+	for (i =3D 0; spaces[i] !=3D '\0'; i++)
> - 		if (c =3D=3D spaces[i])
> - 			return 1;
> - 	return 0;
> -@@ -59,7 +60,8 @@ check_sanity(const char *text, size_t len)
> - static inline int
> - check_segment_sanity(const char *text, size_t len)
> - {
> --	for(unsigned int i =3D 0; i < len; i++) {
> -+	unsigned int i;
> -+	for(i =3D 0; i < len; i++) {
> - 		if (text[i] >=3D '0' && text[i] <=3D '9')
> - 			continue;
> - 		/* "| 0x20" is tolower() without having to worry about
> -diff --git a/src/makeguids.c b/src/makeguids.c
> -index e9acf15..7e16cb2 100644
> ---- a/src/makeguids.c
> -+++ b/src/makeguids.c
> -@@ -150,7 +150,8 @@ main(int argc, char *argv[])
> -=20
> - 	fprintf(header, "#ifndef EFIVAR_GUIDS_H\n#define EFIVAR_GUIDS_H 1\n\n"=
);
> -=20
> --	for (unsigned int i =3D 0; i < line-1; i++) {
> -+	unsigned int i, j;
> -+	for (i =3D 0; i < line-1; i++) {
> - 		if (!strcmp(outbuf[i].symbol, "efi_guid_zero"))
> - 			fprintf(symout, "\t.globl %s\n"
> - 					"\t.data\n"
> -@@ -176,7 +177,7 @@ main(int argc, char *argv[])
> - 			fprintf(symout, "efi_guid_empty:\n");
> -=20
> - 		uint8_t *guid_data =3D (uint8_t *) &outbuf[i].guid;
> --		for (unsigned int j =3D 0; j < sizeof (efi_guid_t); j++)
> -+		for (j =3D 0; j < sizeof (efi_guid_t); j++)
> - 			fprintf(symout,"\t.byte 0x%02x\n", guid_data[j]);
> -=20
> - 		fprintf(symout, "%s_end:\n", outbuf[i].symbol);
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/rec=
ipes-extended/efivar/efivar_0.21.bb
> deleted file mode 100644
> index f7a4d55..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY =3D "Tools to manipulate UEFI variables"
> -DESCRIPTION =3D "efivar provides a simple command line interface to the =
UEFI variable facility"
> -HOMEPAGE =3D "https://github.com/rhinstaller/efivar"
> -
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286=
393"
> -
> -DEPENDS_class-target =3D "popt efivar-native"
> -
> -SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> -SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> -SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-compi=
le.patch"
> -SRC_URI_append_class-native =3D " file://efivar-drop-options-not-support=
ed-by-lower-version-gcc.patch"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> -
> -do_compile_class-native() {
> -    oe_runmake -C src makeguids
> -}
> -
> -do_install_class-native() {
> -    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -
> -# See
> -# http://lists.openembedded.org/pipermail/openembedded-core/2016-Februar=
y/116564.html
> -# http://lists.openembedded.org/pipermail/openembedded-core/2016-Februar=
y/116571.html
> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-Februa=
ry/105802.html
> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-Februa=
ry/105786.html
> -# but it's still broken:
> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-Februa=
ry/105825.html
> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-Februa=
ry/105830.html
> -PNBLACKLIST[efivar] ?=3D "BROKEN: linux.c:27:30: fatal error: linux/nvme=
_ioctl.h: No such file or directory"
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/rec=
ipes-extended/efivar/efivar_0.23.bb
> new file mode 100644
> index 0000000..faffb79
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "Tools to manipulate UEFI variables"
> +DESCRIPTION =3D "efivar provides a simple command line interface to the =
UEFI variable facility"
> +HOMEPAGE =3D "https://github.com/rhinstaller/efivar"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286=
393"
> +
> +DEPENDS_class-target =3D "popt efivar-native"
> +
> +SRCREV =3D "01abee43d6d6e755f56a4135ab5aa0bfad609ce2"
> +SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> +SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-compi=
le.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Setting CROSS_COMPILE breaks pkgconfig, so just set AR
> +EXTRA_OEMAKE =3D "AR=3D${TARGET_PREFIX}gcc-ar"
> +
> +do_compile_prepend() {
> +    sed -i -e s:-Werror::g ${S}/gcc.specs
> +}
> +
> +do_compile_class-native() {
> +    oe_runmake -C src makeguids
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +do_install_class-native() {
> +    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbZjtAACgkQN1Ujt2V2gByD1wCfZ2hvYRlRPeMfYMaczrqJmjOE
f2kAnjcHTr83M1xLDDZ3dxkrX4mbTM+E
=IFj7
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
