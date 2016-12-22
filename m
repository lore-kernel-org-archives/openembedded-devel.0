Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB20C774DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 08:45:37 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id ez4so697997wjd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 00:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qZequElzURjW1L0Kel434sIQt8gsZfzl5Mrjbb+vJO8=;
	b=GKOOcCQFIfntZvYJCddyxfPUMX7ODbex3iZkVIysJSZle3Jz9LDLCpw+1NVZROzHPn
	SwgMCjmQ4iY66fzgrFHaGX/l2P6XwgrUzMa8W+vg4y++9MaoceZRyJg4mvdKr9dV77Sb
	dl4Uz20vHQ03lHXACBwyGWDVundZBLrn29SPA5U/uwwtu1lbaZzQ07KHVdO/kdIDnv+S
	eKsiwQKoUQS8t6ArATxCLsMYSTujNxdvIMGv+jv7MIkFMmb1SVPzjew8AYi0N5TBaq16
	aTWKxEXjtFLGQbYY8toaawOLO7++2imhII1IPNGVmJjExK7A8pD2n0+VwX773zkSHT/2
	qjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qZequElzURjW1L0Kel434sIQt8gsZfzl5Mrjbb+vJO8=;
	b=D1GB5JTpF/TuuUYWfrFO8Fmp8es346L4alyjUpGuAVG+Trbaw4F5WOK04UBYXijPxl
	zHATub5Gpicqx3vbu/UNOZsiArD2O9YN9hB1f/MeoHK8ZJIjGZmhBy7nFDqvBOJZkGMl
	xvuTDXeA/G6hF8TfliCeXDyKiAje4Doqp1KpHSUZXjgy+B+7NEhD0ScSrgKC9I1oFHfg
	eoGdS2X4f5FHPV2N55cxP7/NQoXoQs9C0eDQKNq3lD9zU40jnV0p8JUw10OZAkkdak0j
	+uIQMVt/UDiveIifmdxTCiWy/qAhA0hXYWf3ipbWuK1ymru9hvkUr0pmfYs0QtOC2K0G
	st3A==
X-Gm-Message-State: AIkVDXLZ2gxu5lsRnNuq/PBGqN06bMrz5cTyId7wnIXC0/QvW9RpwRm0SjP0/XPcjh9kig==
X-Received: by 10.194.59.71 with SMTP id x7mr9241385wjq.74.1482396338208;
	Thu, 22 Dec 2016 00:45:38 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l67sm29872292wmf.0.2016.12.22.00.45.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 00:45:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Dec 2016 09:45:36 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161222084536.GB3544@jama>
References: <1482395805-2971-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1482395805-2971-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe] [PATCH v2] add php 7.1.0
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
X-List-Received-Date: Thu, 22 Dec 2016 08:45:38 -0000
X-Groupsio-MsgNum: 64470
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 04:36:45PM +0800, Huang Qiyu wrote:
> 1)add php_7.1.0.bb
> 2)Delete php_5.5.38.bb,since it is Replaced by php_5.6.26.bb.
> 3)Delete pthread-check-threads-m4.patch, since it is integrated upstream.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         | 56 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/php/php.inc               |  3 +-
>  .../php/php/pthread-check-threads-m4.patch         | 30 ------------
>  meta-oe/recipes-devtools/php/php_5.5.38.bb         |  6 ---
>  meta-oe/recipes-devtools/php/php_7.1.0.bb          |  8 ++++
>  5 files changed, 65 insertions(+), 38 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_=
RUN-to-AC_TRY_LINK.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php/pthread-check-thread=
s-m4.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.38.bb
>  create mode 100644 meta-oe/recipes-devtools/php/php_7.1.0.bb
>=20
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-=
AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RU=
N-to-AC_TRY_LINK.patch
> new file mode 100644
> index 0000000..39c334f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_=
LINK.patch
> @@ -0,0 +1,56 @@
> +[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
> +
> +Upstream-Status: Pending
> +
> +AC_TRY_RUN is not suitable for cross-compile
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + ext/fileinfo/config.m4 | 31 ++++++-------------------------
> + 1 file changed, 6 insertions(+), 25 deletions(-)
> +
> +diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
> +index 7e98d62..8a8ea0e 100644
> +--- a/ext/fileinfo/config.m4
> ++++ b/ext/fileinfo/config.m4
> +@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" !=3D "no"; then
> +     libmagic/readcdf.c libmagic/softmagic.c"
> +=20
> +   AC_MSG_CHECKING([for strcasestr])
> +-  AC_TRY_RUN([
> +-#include <string.h>
> +-#include <strings.h>
> +-#include <stdlib.h>
> +-
> +-int main(void)
> +-{
> +-        char *s0, *s1, *ret;
> +-
> +-        s0 =3D (char *) malloc(42);
> +-        s1 =3D (char *) malloc(8);
> +-
> +-        memset(s0, 'X', 42);
> +-        s0[24] =3D 'Y';
> +-        s0[26] =3D 'Z';
> +-        s0[41] =3D '\0';
> +-        memset(s1, 'x', 8);
> +-        s1[0] =3D 'y';
> +-        s1[2] =3D 'Z';
> +-        s1[7] =3D '\0';
> +-
> +-        ret =3D strcasestr(s0, s1);
> +-
> +-        return !(NULL !=3D ret);
> +-}
> ++  AC_TRY_COMPILE([
> ++     #include <string.h>
> ++     #include <strings.h>
> ++     #include <stdlib.h>
> ++  ],[
> ++     strcasestr(NULL, NULL);
> +   ],[
> +     dnl using the platform implementation
> +     AC_MSG_RESULT(yes)
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index cd91940..191005f 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -24,7 +24,6 @@ SRC_URI_append_class-target =3D " \
>              file://php-fpm.conf \
>              file://php-fpm-apache.conf \
>              file://configure.patch \
> -            file://pthread-check-threads-m4.patch \
>              file://70_mod_php5.conf \
>              file://php-fpm.service \
>            "
> @@ -218,7 +217,7 @@ FILES_${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
>  FILES_${PN}-cli =3D "${bindir}/php"
>  FILES_${PN}-phar =3D "${bindir}/phar*"
>  FILES_${PN}-cgi =3D "${bindir}/php-cgi"
> -FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.se=
rvice"
> +FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.se=
rvice /etc/*"

Why /etc/*? doesn't it respect ${sysconfdir} variable? and '*" at the
end isn't needed for glob.

>  FILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>  CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
>  CONFFILES_${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.co=
nf"
> diff --git a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.pa=
tch b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> deleted file mode 100644
> index 0c564cd..0000000
> --- a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Mon, 8 Apr 2013 14:29:51 +0800
> -Subject: [PATCH] pthread-check
> -
> -Enable pthreads support when cross-compiling
> -
> -Upstream-Status: Inapproprate [config]
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - TSRM/threads.m4 |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
> -index 38494ce..15d9454 100644
> ---- a/TSRM/threads.m4
> -+++ b/TSRM/threads.m4
> -@@ -86,7 +86,7 @@ int main() {
> -   pthreads_working=3Dno
> -   ], [
> -   dnl For cross compiling running this test is of no use. NetWare suppo=
rts pthreads
> --  pthreads_working=3Dno
> -+  pthreads_working=3Dyes
> -   case $host_alias in
> -   *netware*)
> -     pthreads_working=3Dyes
> ---=20
> -1.7.4.1
> -
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.38.bb b/meta-oe/recipes=
-devtools/php/php_5.5.38.bb
> deleted file mode 100644
> index 26f35b1..0000000
> --- a/meta-oe/recipes-devtools/php/php_5.5.38.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require php.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D464ca70af214d2407f6b7d4458158=
afd"
> -
> -SRC_URI[md5sum] =3D "312244a0eecad602a1555ed2434e223f"
> -SRC_URI[sha256sum] =3D "473c81ebb2e48ca468caee031762266651843d7227c18a82=
4add9b07b9393e38"
> diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-=
devtools/php/php_7.1.0.bb
> new file mode 100644
> index 0000000..eeca0cb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
> @@ -0,0 +1,8 @@
> +require php.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db602636d46a61c0ac0432bbf5c078=
fe4"
> +
> +SRC_URI +=3D "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> +
> +SRC_URI[md5sum] =3D "54e364b60a88db77adb96aacb10f10a4"
> +SRC_URI[sha256sum] =3D "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25b=
bc9ec70995228e61"
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

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFuSrwAKCRA3VSO3ZXaA
HPlVAJ90Ph2ZtMfS0uEYxwWdXnRaiONcfQCgoqGIgZOKC7IOdBxjqVd5h2KUjLc=
=lfqa
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
