Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 234E477133
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:45:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so14916290wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KmnjrOpv7FUGcb88gOEeurWON8jrmC87IvV//hV00k0=;
	b=btqy684kT+WQC0jpXMG3FSwGZVHcXcdxJ3qzPnaNuILc6g4p5YYBkRDl2ll0pfc4dW
	AY5eGs9h7INXCLQEvXEmDFPBI3bk3ACQmoiKTy0pKvmHVQtJentcgvDu1HZ/vTa2zdh+
	lPMgsoI6BSIEgZRBRBgmMdQ0xeYEva0TR9NSvolBxV7BaM1f0c6uwiimdov/fUHGP7Fc
	Zb68kNXzdQQhi9Ye7HCwWX7oDJKSbPeWMVv/rCjSt9vZQysRb1HGkHHtMOSR+DfvopNp
	feLpvqhbqYSmsZOst3uff6GyNuUrqAkmEAy74tYpsFzuVYJqJzoi+TJaJvDjYUxgDymb
	K4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KmnjrOpv7FUGcb88gOEeurWON8jrmC87IvV//hV00k0=;
	b=mjr5FqIDQteD04rPfl8Ll9S6TJaDsjDXJAC8ku9rXrsUWVuU0LDCtpbrjFhgnRgEDJ
	C0JdJq5ESj6zwEdr0T4cPN6/0UK66rvq471ZbZ5cI6kcZqV9eGyCOPJ9GsvmVZVMScza
	17btoztcsnekSLFVZO+741ELn4scN3h6c0O06LOyzc+ptYPwml/5hoSWWlaT/o+OLYjx
	3gt1tFDsecsQ7TReBLvWH6nmTVI7qTo1kTcsFoIBwJn1vImTBOyWKRbfk30DAn2VFsLf
	YE31ecVi6CUY6NdgaJXMa2UnS2AUUmJ/u6QOO+TvvcjuyaZ2tNsXfyKvis+G9YWRN1Nm
	zNIQ==
X-Gm-Message-State: AEkoouvQGMKTrKC8bW4w15usIQOYYGveagghcWAfGfDukQC8ykYYTuvXXCARmASHZI9iGg==
X-Received: by 10.28.209.134 with SMTP id i128mr14913643wmg.97.1470656717616; 
	Mon, 08 Aug 2016 04:45:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i66sm23354970wmg.9.2016.08.08.04.45.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Aug 2016 04:45:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Aug 2016 13:45:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160808114518.nyymtyx53w5upadu@jama>
References: <1461826934-3369-1-git-send-email-daicy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1461826934-3369-1-git-send-email-daicy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] uim: add support for anthy
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
X-List-Received-Date: Mon, 08 Aug 2016 11:45:19 -0000
X-Groupsio-MsgNum: 62474
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xaj3qg43xbt6ujnd"
Content-Disposition: inline

--xaj3qg43xbt6ujnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 10:02:14AM +0300, Dai Caiyun wrote:
> make uim support anthy.
>=20
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  .../uim/uim/0001-configure.ac-Error-Fix.patch      | 29 ++++++++++++++++=
+++++
>  .../uim/uim/0001-fep-uim-fep.c-Error-Fix.patch     | 30 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/uim/uim_1.8.6.bb           | 11 +++++++-
>  3 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/uim/uim/0001-configure.ac-Err=
or-Fix.patch
>  create mode 100644 meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Er=
ror-Fix.patch
>=20
> diff --git a/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.=
patch b/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch
> new file mode 100644
> index 0000000..1e992d9
> --- /dev/null
> +++ b/meta-oe/recipes-support/uim/uim/0001-configure.ac-Error-Fix.patch
> @@ -0,0 +1,29 @@
> +From 843155bb61729d5fa0513b0cc967f5ed34124848 Mon Sep 17 00:00:00 2001
> +From: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 26 Feb 2016 15:14:30 +0900
> +Subject: [PATCH] configure.ac: Error Fix
> +
> +ERROR: QA Issue: uim: The compile log indicates that host
> +include and/or library paths were used.
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9249bfd..be03d74 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1216,7 +1216,7 @@ if test "x$use_libedit" !=3D "xno"; then
> +             use_libedit=3D"no")])
> +     if test "x$use_libedit" !=3D "xno"; then
> +         AC_CHECK_LIB(edit, el_init,
> +-            [LIBEDIT_LIBS=3D"-ledit $LIBEDIT_LIBS -L$libedit_path/lib"
> ++            [LIBEDIT_LIBS=3D"-ledit $LIBEDIT_LIBS"
> +                 AC_SUBST(LIBEDIT_LIBS)],
> +             [AC_MSG_WARN("libedit not found. Disabled...")
> +                 use_libedit=3D"no"])
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix=
=2Epatch b/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.pat=
ch
> new file mode 100644
> index 0000000..2ca21b0
> --- /dev/null
> +++ b/meta-oe/recipes-support/uim/uim/0001-fep-uim-fep.c-Error-Fix.patch
> @@ -0,0 +1,30 @@
> +From db57f34cf8e6483866ff7df7e65bc015a86cc71c Mon Sep 17 00:00:00 2001
> +From: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Date: Thu, 3 Mar 2016 15:23:59 +0900
> +Subject: [PATCH] fep/uim-fep.c: Error Fix
> +
> +uim-1.8.6/fep/uim-fep.c:93:21: error: stropts.h: No such file or directo=
ry
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + fep/uim-fep.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/fep/uim-fep.c b/fep/uim-fep.c
> +index 55dbf7c..3fb62bf 100644
> +--- a/fep/uim-fep.c
> ++++ b/fep/uim-fep.c
> +@@ -90,7 +90,7 @@
> + #include <sys/time.h>
> + #endif
> + #ifdef HAVE_STROPTS_H
> +-#include <stropts.h>
> ++//#include <stropts.h>
> + #endif
> + #ifdef HAVE_SYS_PARAM_H
> + #include <sys/param.h>
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-s=
upport/uim/uim_1.8.6.bb
> index ae193b2..acb9443 100644
> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -3,11 +3,15 @@ HOMEPAGE =3D "http://uim.freedesktop.org/"
>  LICENSE =3D "BSD-3-Clause & LGPLv2+"
>  SECTION =3D "inputmethods"
> =20
> +PARALLEL_MAKEINST =3D ""
> +
>  SRC_URI =3D "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
>            "
> =20
>  SRC_URI_append_class-target =3D "file://uim-module-manager.patch \
> -                               file://0001-fix-bug-for-cross-compile.pat=
ch"
> +                               file://0001-fix-bug-for-cross-compile.pat=
ch \
> +			        file://0001-configure.ac-Error-Fix.patch"
> +SRC_URI_append_class-native =3D "file://0001-fep-uim-fep.c-Error-Fix.pat=
ch"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32463fd29aa303fb2360faeeae172=
56b"
>  SRC_URI[md5sum] =3D "ecea4c597bab1fd4ba98ea84edcece59"
> @@ -19,6 +23,8 @@ DEPENDS_class-target +=3D "intltool-native gtk+ gtk+3 u=
im-native takao-fonts"
>  RDEPENDS_uim =3D "libuim0 libedit"
>  RDEPENDS_uim-anthy =3D "takao-fonts anthy libanthy0"
> =20
> +do_configure[depends] +=3D "anthy:do_populate_sysroot"

NAK, how this differs from having anthy in DEPENDS?

Using this strange construct also causes native uim to depends on target
anthy as reported in last status e-mail:

http://lists.openembedded.org/pipermail/openembedded-core/2016-August/12484=
6.html

=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (2) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160806_024813.log/
    * ERROR: 2 issues were found in these recipes: uim-native

    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_populate_sysroot.sigda=
ta.log

    * ERROR: uim-native different signature for task do_configure.sigdata b=
etween qemux86copy and qemuarm
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1470487693/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: uim-native different signature for task do_populate_sysroot.si=
gdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1470487693/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 2 issues were found in these recipes: uim-native

> +
>  LEAD_SONAME =3D "libuim.so.1"
> =20
>  inherit autotools pkgconfig gettext
> @@ -31,6 +37,8 @@ EXTRA_OECONF +=3D "--disable-emacs \
>                   --without-mana \
>                   --without-eb"
> =20
> +EXTRA_OECONF_append_class-target =3D " --with-anthy"
> +
>  CONFIGUREOPTS_remove_class-target =3D "--disable-silent-rules"
> =20
>  #Because m4 file's find maxdepth=3D2, so copy the m4 files of the deep d=
epth.
> @@ -40,6 +48,7 @@ do_configure_prepend () {
> =20
>  do_install_append() {
>      rm -rf ${D}/${datadir}/applications
> +    rm -f ${D}${datadir}/uim/elatin-rules.scm
>  }
> =20
>  PACKAGES +=3D "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim=
-common uim-anthy libuim0 libuim-dev"
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xaj3qg43xbt6ujnd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleocMEACgkQN1Ujt2V2gByMOACeLcAiviLJ+d+8tNpPoHPJ6/LV
PkYAnA2Y1dB5jBKfhmHzNO3RCcTWfjvM
=eqQq
-----END PGP SIGNATURE-----

--xaj3qg43xbt6ujnd--
