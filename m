Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1C21A60766
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:51:55 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id c20so16721995itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=kRbHvwmqa9FU2YvRMfUDJxCuXCjfGPUv/u9TG/TPZc8=;
	b=Mty8jljdqebvNSkMlPfUuqARUmg8NPH60qFIMa8qY+INyshd3hDdoGCBSNB08kn/Cq
	eit1kSGZkAiKKU9jn8d48+C/NNo40TCjrolzjfOXYXx4Agpw6EX+ZsXdBd/if8ra/3kd
	L8C/FNBJ1pLOBxPe/Kz60p0Guk0I31H0AOvXs1VO2sZYtZw2af8ULKfecqpUYfCcOcbe
	d8wMRMuu7xoCdsuemKyEneG+Hil/l0jIem0WEduna9J8yrWnjoqVBC69wNjSyDrm4XCG
	wqEuxGvCv5n2xBH+NKsz8Eb2xO2/m9kB/MHJoN7tpV0cxK40LvTXq/oYBnKP/K1lXiJu
	rLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kRbHvwmqa9FU2YvRMfUDJxCuXCjfGPUv/u9TG/TPZc8=;
	b=k+ISiHh3Q0lByj5kHVjEZQV6nA2IGrz/vcxj3H9XhtkxVNZFdLMInWuk8TDRV6Rsi5
	0q7fgWeqof9nr6CjP17gB8kzRt3OL5b7NqvWwXcNy5TG3FOiAhXB9zVQdgASetK5phUt
	mXNCr+1GUej+8TfjZB1VgokLove0z7zwDdtyppnRZHEOCOtAC2OC1oYtvboOBPwyf0zJ
	7x6i8YACnrHxCmbFpT2pHkK7VcoRQltu5O8YW+IRBOdOz9pyBKCVE43zDQyHYRkfk8x9
	0YFoqGxB6qH9cDC91nOAyeBaxyBio5LoRP+i9Vu/1IttNaw6d9dHnKjlWvx2eqjGTeUe
	4B1A==
X-Gm-Message-State: ABUngvdA2/geytal9V2L6maxflcZrrtOX/9tiySWHqqR5m+f0dpnNbog/k7En2a75PIrbg==
X-Received: by 10.36.64.75 with SMTP id n72mr11342973ita.105.1479405116561;
	Thu, 17 Nov 2016 09:51:56 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	141sm1264577ity.12.2016.11.17.09.51.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 09:51:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
References: <20161117023409.5303-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <1efcea40-f13c-5095-f0cb-2406f42e1329@gmail.com>
Date: Thu, 17 Nov 2016 09:50:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <20161117023409.5303-1-Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 17 Nov 2016 17:51:56 -0000
X-Groupsio-MsgNum: 63864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="r36MGTUqvKxCfilHUx5Ocm6u5j5SmwQQv"

--r36MGTUqvKxCfilHUx5Ocm6u5j5SmwQQv
Content-Type: multipart/mixed; boundary="eVWs19AQk0g78c7569UG5vuCkTvpQNblm";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Message-ID: <1efcea40-f13c-5095-f0cb-2406f42e1329@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] openobex: upgrade to 1.7.2
References: <20161117023409.5303-1-Qi.Chen@windriver.com>
In-Reply-To: <20161117023409.5303-1-Qi.Chen@windriver.com>

--eVWs19AQk0g78c7569UG5vuCkTvpQNblm
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Can you also take a look at

https://github.com/kraj/meta-openembedded/commit/3789eb98ee620916c47ba5f7=
c66bffd90a8a6161

and

https://github.com/kraj/meta-openembedded/commit/9d2100ee53b3c11324f998fd=
e4c47ba371d03fae

As well. May be you can do a patch on top of them ?

On 11/16/16 6:34 PM, Chen Qi wrote:
> Add a patch to resolve segment fault in obex-check-device.
> Disable generation of documentation.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../obex/openobex-1.5/disable-cable-test.patch     | 16 ----------
>  .../openobex-1.5/libusb_crosscompile_check.patch   | 11 -------
>  .../obex/openobex-1.5/separate_builddir.patch      | 16 ----------
>  ...001-obex-check-device-avoid-segment-fault.patch | 29 ++++++++++++++=
++++
>  meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 --------------=
--------
>  .../recipes-connectivity/obex/openobex_1.7.2.bb    | 33 ++++++++++++++=
++++++
>  6 files changed, 62 insertions(+), 78 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/disa=
ble-cable-test.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/libu=
sb_crosscompile_check.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/sepa=
rate_builddir.patch
>  create mode 100644 meta-oe/recipes-connectivity/obex/openobex/0001-obe=
x-check-device-avoid-segment-fault.patch
>  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
>  create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb=

>=20
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cab=
le-test.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-ca=
ble-test.patch
> deleted file mode 100644
> index 95b636d..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test=
=2Epatch
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
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_cros=
scompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/lib=
usb_crosscompile_check.patch
> deleted file mode 100644
> index 1177dfe..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompil=
e_check.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
> -+++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
> -@@ -158,7 +158,7 @@
> - 		;;
> - 	*)
> - 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=3Dyes, AC_MSG_RESULT(n=
o))
> --		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES=3D"libusb=
")
> -+		REQUIRES=3D"libusb"
> - 		;;
> - 	esac
> - 	AC_SUBST(USB_CFLAGS)
> diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_bu=
ilddir.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_bu=
ilddir.patch
> deleted file mode 100644
> index 8abf8ae..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.=
patch
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
> diff --git a/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check=
-device-avoid-segment-fault.patch b/meta-oe/recipes-connectivity/obex/ope=
nobex/0001-obex-check-device-avoid-segment-fault.patch
> new file mode 100644
> index 0000000..d7c2681
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device=
-avoid-segment-fault.patch
> @@ -0,0 +1,29 @@
> +Subject: obex-check-device: avoid segment fault
> +
> +The argument number needs to be no less than 3 instead of 2. Otherwise=
,
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
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-o=
e/recipes-connectivity/obex/openobex_1.5.bb
> deleted file mode 100644
> index 6ac7905..0000000
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION =3D "The Openobex project is an open source implementation=
 of the \
> -Object Exchange (OBEX) protocol."
> -HOMEPAGE =3D "http://openobex.triq.net"
> -SECTION =3D "libs"
> -DEPENDS =3D "virtual/libusb0"
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5'=
,'bluez4',d)}"
> -
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b=
5c50a \
> -                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f39=
8e37343 \
> -"
> -
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.=
tar.gz \
> -           file://disable-cable-test.patch \
> -           file://libusb_crosscompile_check.patch \
> -           file://separate_builddir.patch"
> -
> -SRC_URI[md5sum] =3D "0d83dc86445a46a1b9750107ba7ab65c"
> -SRC_URI[sha256sum] =3D "e602047570799a47ecb028420bda8f2cef41310e5a99d0=
84de10aa9422935e65"
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
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta=
-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> new file mode 100644
> index 0000000..948308e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "The Openobex project is an open source implementation=
 of the \
> +Object Exchange (OBEX) protocol."
> +HOMEPAGE =3D "http://openobex.triq.net"
> +SECTION =3D "libs"
> +DEPENDS =3D "virtual/libusb0"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5'=
,'bluez4',d)}"
> +
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b=
5c50a \
> +                    file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f39=
8e37343 \
> +"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/openobex/openobex-${PV}-=
Source.tar.gz \
> +           file://0001-obex-check-device-avoid-segment-fault.patch"
> +
> +SRC_URI[md5sum] =3D "f6e0b6cb7dcfd731460a7e9a91429a3a"
> +SRC_URI[sha256sum] =3D "158860aaea52f0fce0c8e4b64550daaae06df2689e0583=
4697b7e8c7d73dd4fc"
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
>=20


--eVWs19AQk0g78c7569UG5vuCkTvpQNblm--

--r36MGTUqvKxCfilHUx5Ocm6u5j5SmwQQv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgt7ekACgkQuwUzVZGdMxTeegCdH1yWdt2IryZ63vnj0uKAW/Xn
fHgAn3aOyRMf69JY70pwyajraVHYtcP7
=xwUr
-----END PGP SIGNATURE-----

--r36MGTUqvKxCfilHUx5Ocm6u5j5SmwQQv--
