Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F96E71951
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:49:03 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h201so5186201qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Svy5Ytz0eeJPntIMw51PdUNk3H/qn3sNal6OfposFww=;
	b=B8RwxFE1k9TvLZ4GGOVgxRc9FcTmSHI9shaEbspA1HpR0odSz/kq3ofWCxhydiDNsO
	Wz0S3n7cbUB2lZe0+bL814KT7+fbVrnrlN0bYs4WOd1yYJszQa3h3SZTc/yPfEAUFTOF
	aBjel7WBsjZhLGfRFvIArDooYb+7sosiaClkkZmSaJjTrMnqWSc5fmaU1mpEGQ0uWaYt
	LRTJg/cLbhcDrivoeH4yLPIwFnSCVz4XZLN/3z98XIRU5vFXsGGqoDv0s5PMc/dkU1aO
	/n7sfU8otiImSu3mrB2k1ZI45x0K+/U9IWDi9hRNwhtiiim7fUxogGv8WzQU1Eb3q4bi
	cf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Svy5Ytz0eeJPntIMw51PdUNk3H/qn3sNal6OfposFww=;
	b=CRHLm0DoDB63xXUd4TkaxfZfxMpKAnsI+sKnwi02pEjTsdEMY3FEcmmJ79kHKZohzL
	KLA5thsJepPOXJEC3k8LQusYm5SuWtRwY3fL1P3ufh0M0JKTlWIzK0srMqpU1yqW9HVb
	I7ugRGH7cyERZxR2FBqmpv+3fYBlCaRWuUpYN4/pJvJmi7xrGt4ySvQmVbgh33gdAybd
	pOqjhq7qhk5KY1JVUGnGvJwS9XPEj3uFeLzy9YWy+g3TsvOi07x0DAsLEtlMsJZ0EzzH
	IeJhlsdeMUfCPyepIwXSkGLUiH6FVybfUtowA94ZzY0kvyEVxGnaEIgA8/4eqTfFBlDj
	Jk0Q==
X-Gm-Message-State: AKaTC00p5XQ4gA9kBqowlYDCGiwHYrRdVxjv0PPaXWOYvoix78tjBzc4QovwXKu2PdpEuQ==
X-Received: by 10.194.101.97 with SMTP id ff1mr17467501wjb.67.1479833344600;
	Tue, 22 Nov 2016 08:49:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	191sm3872770wmr.11.2016.11.22.08.49.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Nov 2016 08:49:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Nov 2016 17:49:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161122164904.GB3348@jama>
References: <20161117023409.5303-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20161117023409.5303-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH V2] openobex: upgrade to 1.7.2
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
X-List-Received-Date: Tue, 22 Nov 2016 16:49:04 -0000
X-Groupsio-MsgNum: 63947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline

--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 10:34:09AM +0800, Chen Qi wrote:
> Add a patch to resolve segment fault in obex-check-device.
> Disable generation of documentation.

This is probably causing obexftp and obex-data-server issues:
http://errors.yoctoproject.org/Errors/Details/104698/
http://errors.yoctoproject.org/Errors/Details/104700/

reported in
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/10=
9897.html
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../obex/openobex-1.5/disable-cable-test.patch     | 16 ----------
>  .../openobex-1.5/libusb_crosscompile_check.patch   | 11 -------
>  .../obex/openobex-1.5/separate_builddir.patch      | 16 ----------
>  ...001-obex-check-device-avoid-segment-fault.patch | 29 ++++++++++++++++=
++
>  meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 ----------------=
------
>  .../recipes-connectivity/obex/openobex_1.7.2.bb    | 33 ++++++++++++++++=
++++
>  6 files changed, 62 insertions(+), 78 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/disabl=
e-cable-test.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/libusb=
_crosscompile_check.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/separa=
te_builddir.patch
>  create mode 100644 meta-oe/recipes-connectivity/obex/openobex/0001-obex-=
check-device-avoid-segment-fault.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>  create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable=
-test.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-=
test.patch
> deleted file mode 100644
> index 95b636d..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.p=
atch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -
> -#
> -# Patch managed by http://www.holgerschurig.de/patcher.html
> -#
> -
> ---- openobex-1.2/apps/Makefile.am~disable-cable-test
> -+++ openobex-1.2/apps/Makefile.am
> -@@ -6,7 +6,7 @@
> - 	obex_io.c obex_io.h \
> - 	obex_put_common.c obex_put_common.h
> -=20
> --bin_PROGRAMS =3D irxfer obex_tcp irobex_palm3 obex_test
> -+bin_PROGRAMS =3D irxfer obex_tcp irobex_palm3
> -=20
> - obex_test_SOURCES =3D \
> - 	obex_test.c obex_test.h \
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crossc=
ompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_=
crosscompile_check.patch
> deleted file mode 100644
> index 1177dfe..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_=
check.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
> -+++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
> -@@ -158,7 +158,7 @@
> - 		;;
> - 	*)
> - 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=3Dyes, AC_MSG_RESULT(no))
> --		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES=3D"libusb")
> -+		REQUIRES=3D"libusb"
> - 		;;
> - 	esac
> - 	AC_SUBST(USB_CFLAGS)
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_buil=
ddir.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_buildd=
ir.patch
> deleted file mode 100644
> index 8abf8ae..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.pa=
tch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Fix detection of IrDA failing with B!=3DS
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> ---- a/acinclude.m4	2014-05-24 14:05:41.757796816 +0100
> -+++ b/acinclude.m4	2014-05-24 14:03:06.556795536 +0100
> -@@ -54,6 +54,7 @@
> - ])
> -=20
> - AC_DEFUN([AC_PATH_IRDA_LINUX], [
> -+	CPPFLAGS=3D"${CPPFLAGS} -I${srcdir}"
> - 	AC_CACHE_CHECK([for IrDA support], irda_found, [
> - 		AC_TRY_COMPILE([
> - 				#include <sys/socket.h>
> diff --git a/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-d=
evice-avoid-segment-fault.patch b/meta-oe/recipes-connectivity/obex/openobe=
x/0001-obex-check-device-avoid-segment-fault.patch
> new file mode 100644
> index 0000000..d7c2681
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device-a=
void-segment-fault.patch
> @@ -0,0 +1,29 @@
> +Subject: obex-check-device: avoid segment fault
> +
> +The argument number needs to be no less than 3 instead of 2. Otherwise,
> +when we use `obex-check-device xxx' on target, there would be segment
> +fault error.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + udev/obex-check-device.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/udev/obex-check-device.c b/udev/obex-check-device.c
> +index 9eb4769..df9fc73 100644
> +--- a/udev/obex-check-device.c
> ++++ b/udev/obex-check-device.c
> +@@ -62,7 +62,7 @@ int main (int argc, char **argv)
> + 	unsigned long vendor;
> + 	unsigned long product;
> +=20
> +-	if (argc < 2)
> ++	if (argc < 3)
> + 		return 0;
> +=20
> + 	vendor =3D strtoul(argv[1], NULL, 16);
> +--=20
> +2.8.3
> +
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/=
recipes-connectivity/obex/openobex_1.5.bb
> deleted file mode 100644
> index 6ac7905..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION =3D "The Openobex project is an open source implementation o=
f the \
> -Object Exchange (OBEX) protocol."
> -HOMEPAGE =3D "http://openobex.triq.net"
> -SECTION =3D "libs"
> -DEPENDS =3D "virtual/libusb0"
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','=
bluez4',d)}"
> -
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> -                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
> -"
> -
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.ta=
r.gz \
> -           file://disable-cable-test.patch \
> -           file://libusb_crosscompile_check.patch \
> -           file://separate_builddir.patch"
> -
> -SRC_URI[md5sum] =3D "0d83dc86445a46a1b9750107ba7ab65c"
> -SRC_URI[sha256sum] =3D "e602047570799a47ecb028420bda8f2cef41310e5a99d084=
de10aa9422935e65"
> -
> -inherit autotools binconfig pkgconfig
> -
> -EXTRA_OECONF =3D "--enable-apps --enable-syslog"
> -
> -do_install_append() {
> -    install -d ${D}${datadir}/aclocal
> -    install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
> -}
> -
> -PACKAGES +=3D "openobex-apps"
> -FILES_${PN} =3D "${libdir}/lib*.so.*"
> -FILES_${PN}-dev +=3D "${bindir}/openobex-config"
> -FILES_${PN}-apps =3D "${bindir}/*"
> -DEBIAN_NOAUTONAME_${PN}-apps =3D "1"
> -
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-o=
e/recipes-connectivity/obex/openobex_1.7.2.bb
> new file mode 100644
> index 0000000..948308e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "The Openobex project is an open source implementation o=
f the \
> +Object Exchange (OBEX) protocol."
> +HOMEPAGE =3D "http://openobex.triq.net"
> +SECTION =3D "libs"
> +DEPENDS =3D "virtual/libusb0"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','=
bluez4',d)}"
> +
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> +                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
> +"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/openobex/openobex-${PV}-So=
urce.tar.gz \
> +           file://0001-obex-check-device-avoid-segment-fault.patch"
> +
> +SRC_URI[md5sum] =3D "f6e0b6cb7dcfd731460a7e9a91429a3a"
> +SRC_URI[sha256sum] =3D "158860aaea52f0fce0c8e4b64550daaae06df2689e058346=
97b7e8c7d73dd4fc"
> +
> +inherit cmake
> +
> +S =3D "${WORKDIR}/openobex-${PV}-Source"
> +
> +EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelease -DBUILD_DOCUMENTATION=
=3Dno"
> +
> +do_install_append () {
> +    if [ "`ls -A ${D}${bindir}`" =3D "" ]; then
> +	rm -rf ${D}${bindir}
> +    fi
> +}
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> +
> +
> --=20
> 2.8.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDR2/wAKCRA3VSO3ZXaA
HCVuAJ9C4MF0SnKAORenAH5BcejVlcPqmQCfR3poyY/nnsvkvMCSvyCxhxtaECU=
=Mvhz
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
