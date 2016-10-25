Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C70BB71A15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:30:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d128so1175155wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2c0ppazTnW+U4EdLTbbegz8Qzo3aQAXk6RpUXm/+eCo=;
	b=i5jYZRgPj6ub1p0j6yeaKrnoIE/yZM0DtQfkPQNy7bKvWz2VNTAp4yLAEWEOOJe9K4
	LLCPiz1VcvoP0W66yTKfBJyql7m0OajULHK5H/qDt8uaZYyqTfYWbOSCShyz810vQ9AO
	YZ1Xgo1f4W1x02ryVbJGS60UhcFTHMuRl1Cb6LWz9Ek5JIDP5IK/A8mwnlcggkC8sp7e
	2G0I7XV/lx4uEWo/p2ASoTdjCC7lVsFfQ2HzOakis3AaarcDGpETAOCT58sUpJ9Tgeir
	M0SR0bhZG3JL2ga/7MV15knaoQ3vk7c/gQ0rP+p4vsqdT3M9PlsSGBKL1YCwNPrbltwU
	XIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2c0ppazTnW+U4EdLTbbegz8Qzo3aQAXk6RpUXm/+eCo=;
	b=hOaopF2yBtwiRcUxkNwcHa9j3d9htaIqJVjZLr+zV6yoBJMtbDjQCO4hEQeotewDHc
	BVYHAPn11n0sagc9Akb41rOyjhHj3UtWLeTzSupc+iajMni8qS+oEuvvsWk5mI0PNhej
	NYABKlpESf9FcZcBssg4l0/jK9b26KArmrLmQajF4OVCIT0EGa1xrnfEOJVOa2f6qlEz
	OuF5u15UMfhHn2QNHAaaN6tQ4XiZtDY/frvJ1UzE/NtJBvijKbCd3G+/9g2X8XfDxhD2
	xqYmVyubrcSOIcNWwTYAU88WSqo2mVxV5utdh5I21O0y08wIz0D/LeyZaju/j9XDoI1d
	p85g==
X-Gm-Message-State: ABUngvdzGINIM79H/Re1SO8miMglBsxpNqHX79TJGr8G8w7yF3kEl2YNVZqUaDCJNrp+Gw==
X-Received: by 10.28.11.17 with SMTP id 17mr199189wml.88.1477402243246;
	Tue, 25 Oct 2016 06:30:43 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	af4sm25183831wjc.17.2016.10.25.06.30.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 06:30:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Oct 2016 15:30:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161025133042.GC2911@jama>
References: <1476341681-29827-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1476341681-29827-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH] gnuplot: upgrade to 5.0.5
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
X-List-Received-Date: Tue, 25 Oct 2016 13:30:43 -0000
X-Groupsio-MsgNum: 63596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline

--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 02:54:41PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>

Fails to build - autodetects qt5 in sysroot

http://errors.yoctoproject.org/Errors/Details/93026/

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch    | 16 ----------=
------
>  .../recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch | 11 -----------
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc             |  1 -
>  .../gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch  | 16 ++++++++++=
++++++
>  meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch   | 11 +++++++++++
>  meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb        | 14 ----------=
----
>  meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb        | 14 ++++++++++=
++++
>  7 files changed, 41 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-lo=
adlibs-configure-in-fix.patch
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdir=
s.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs=
-configure-in-fix.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>=20
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-=
configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua=
-loadlibs-configure-in-fix.patch
> deleted file mode 100644
> index 23f2cd2..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configu=
re-in-fix.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Index: gnuplot-4.6.5/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnuplot-4.6.5.orig/configure.in
> -+++ gnuplot-4.6.5/configure.in
> -@@ -690,6 +690,11 @@ if test "${with_lua}" =3D yes ; then
> -   fi
> -=20
> -   if test "$with_lua" !=3D no; then
> -+    dnl check for dlopen/dl to fix loadlibs link failure
> -+    AC_CHECK_FUNC([dlopen], [],
> -+      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS=3D"-ldl"))
> -+    AC_SUBST(DLOPEN_LIBS)
> -+    LUA_LIBS=3D"$LUA_LIBS $DLOPEN_LIBS"
> -     TERMLIBS=3D"$TERMLIBS $LUA_LIBS"
> -     CPPFLAGS=3D"$CPPFLAGS $LUA_CFLAGS"
> -   else
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch=
 b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> deleted file mode 100644
> index 8c7d1f0..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
> -+++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
> -@@ -1,7 +1,7 @@
> - ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> - AUTOMAKE_OPTIONS =3D foreign 1.2h
> -=20
> --SUBDIRS =3D config m4 term src docs $(LISPDIR) man demo tutorial share
> -+SUBDIRS =3D config m4 term src  $(LISPDIR) man share
> -=20
> - EXTRA_DIST =3D BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL=
=2Egnu \
> - Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recip=
es-extended/gnuplot/gnuplot.inc
> index 69bc74b..5bcf2ad 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> @@ -17,7 +17,6 @@ PACKAGECONFIG[cairo] =3D "--with-cairo,--without-cairo,=
cairo pango"
>  PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua"
> =20
>  EXTRA_OECONF =3D "--with-readline=3D${STAGING_LIBDIR}/.. \
> -                --without-lisp-files \
>                  --without-tutorial \
>                  --disable-wxwidgets"
> =20
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-config=
ure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-co=
nfigure-in-fix.patch
> new file mode 100644
> index 0000000..23f2cd2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-=
fix.patch
> @@ -0,0 +1,16 @@
> +Index: gnuplot-4.6.5/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnuplot-4.6.5.orig/configure.in
> ++++ gnuplot-4.6.5/configure.in
> +@@ -690,6 +690,11 @@ if test "${with_lua}" =3D yes ; then
> +   fi
> +=20
> +   if test "$with_lua" !=3D no; then
> ++    dnl check for dlopen/dl to fix loadlibs link failure
> ++    AC_CHECK_FUNC([dlopen], [],
> ++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS=3D"-ldl"))
> ++    AC_SUBST(DLOPEN_LIBS)
> ++    LUA_LIBS=3D"$LUA_LIBS $DLOPEN_LIBS"
> +     TERMLIBS=3D"$TERMLIBS $LUA_LIBS"
> +     CPPFLAGS=3D"$CPPFLAGS $LUA_CFLAGS"
> +   else
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch b/met=
a-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
> new file mode 100644
> index 0000000..8c7d1f0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
> ++++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
> +@@ -1,7 +1,7 @@
> + ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> + AUTOMAKE_OPTIONS =3D foreign 1.2h
> +=20
> +-SUBDIRS =3D config m4 term src docs $(LISPDIR) man demo tutorial share
> ++SUBDIRS =3D config m4 term src  $(LISPDIR) man share
> +=20
> + EXTRA_DIST =3D BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL=
=2Egnu \
> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_4.6.5.bb
> deleted file mode 100644
> index 3f694a0..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require gnuplot.inc
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=3Darchive \
> -    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=3Dqtplot=
 \
> -    file://subdirs.patch \
> -    file://lua-loadlibs-configure-in-fix.patch \
> -    file://gnuplot.desktop \
> -    file://gnuplot.png \
> -"
> -
> -SRC_URI[archive.md5sum] =3D "9a476b21f74bd99c876f1509d731a0f9"
> -SRC_URI[archive.sha256sum] =3D "e550f030c7d04570e89c3d4e3f6e822968165084=
19c86ab46c4dd73156519a2d"
> -SRC_URI[qtplot.md5sum] =3D "0a481885a496092c77eb4017540b5cf6"
> -SRC_URI[qtplot.sha256sum] =3D "6df317183ff62cc82f3dcf88207a267cd6478cb51=
47f55d7530c94f1ad5f4132"
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_5.0.5.bb
> new file mode 100644
> index 0000000..42308ba
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
> @@ -0,0 +1,14 @@
> +require gnuplot.inc
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=3Darchive \
> +    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=3Dqtplot=
 \
> +    file://subdirs.patch \
> +    file://lua-loadlibs-configure-in-fix.patch \
> +    file://gnuplot.desktop \
> +    file://gnuplot.png \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "c5e96fca73afbee4f57cbc1bfce6b3b8"
> +SRC_URI[archive.sha256sum] =3D "25f3e0bf192e01115c580f278c3725d7a569eb84=
8786e12b455a3fda70312053"
> +SRC_URI[qtplot.md5sum] =3D "0a481885a496092c77eb4017540b5cf6"
> +SRC_URI[qtplot.sha256sum] =3D "6df317183ff62cc82f3dcf88207a267cd6478cb51=
47f55d7530c94f1ad5f4132"
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

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgPXoEACgkQN1Ujt2V2gBwmhACgtZxLvCudOmqVat3cokTlfYSP
o7EAn3/eoKXiUx157eHkzp8+8mMePvQm
=6Nfq
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
