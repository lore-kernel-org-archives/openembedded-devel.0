Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D720A6072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 12:39:25 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a17so63041091wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=O6ha2fTJQLwn/wsKD9o8X6Oi0HVYGISii3raGyllwyQ=;
	b=EGzzITxHE+ekxc4CAJ8iC2uWUWTyjMe/PzwsTLIuXZlW5zoEIWTwtOfbLGfaQY0Jxh
	vdpze27rv4TlIWP2k5CoocNz6B9zC4vMmJQD/iK3FWrmU1ISsyNgUO4rnhcUXj8TzW9o
	2Xq3exYz1n+e/cIzr/5OBz+MAlGTRb1z4BvnpGx08ozR0uVw4F/0BESkPAWsUp9MXuiH
	hpzU/C53rxrC85zKpX3FHJSmA2y+qwAf/7X34J2Bd58wfKUZVk0GMetcSnNFKiVwV0yC
	05+ytMpdMlShE8k2+/LVoQ/IDHi40CJz6TLlcNsxa9gGmhtpm1qjK74Dj/1/vf6v6zgA
	QKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=O6ha2fTJQLwn/wsKD9o8X6Oi0HVYGISii3raGyllwyQ=;
	b=MrGU4pzMHVZgq4CcwpyOtmLKWWMm8CjwcJwuy0DV6OshBzPGpbUQmgKJTLkLuH0Jyr
	3okdr05jgaiqj6+TvF+LdxXMolpKOOdI4jG9GYma775Z/irhomGNJd9mUhcFCvN4yu6d
	nVbrktZ3xoS+f8L7Pb+/+59QiShS0Qmav5OTPQQnX6V64Z+PWZ2lJqk1iZ25n8QtsEnM
	PL9G+fOmB57QSzhg4C0O+69Fi1RLFb15s0eGunM6ORJJX24iPqS4BnloinZXLmqhUJS2
	nz2InFbbEE+hRIhiZ/HqR9qs1Ph5J0AVRgrXVFTtEVUvVTzdEUsIRwBG1xi1Oa+1203o
	8ajw==
X-Gm-Message-State: AOPr4FWxEuyqke+O8GShIX2el8jIGtHIxRDWeCZr+lmN3FxcXtfLWXdulXdg+e723SRyjg==
X-Received: by 10.194.201.37 with SMTP id jx5mr14896742wjc.60.1461847165609;
	Thu, 28 Apr 2016 05:39:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id yr1sm9540115wjc.9.2016.04.28.05.39.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Apr 2016 05:39:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Apr 2016 14:40:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160428124008.GA2563@jama>
References: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [PATCH 1/3] poppler: update to 0.4.1
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
X-List-Received-Date: Thu, 28 Apr 2016 12:39:28 -0000
X-Groupsio-MsgNum: 61233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 24, 2016 at 04:18:14PM +0200, Andreas M=FCller wrote:
> * remove leftover patches
> * run tested against evince and qpdfview

BTW; This seems to fail with Qt 5.7 from meta-qt5/master-next:

| x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-g++ -m64 -march=3Dcore=
2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/jenkins/oe/world/s=
hr-core/tmp-glibc/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I../../../popple=
r-0.41.0/qt5/src -I../.. -I../../poppler -I../../../poppler-0.41.0 -I../../=
=2E./poppler-0.41.0/poppler -I/home/jenkins/oe/world/shr-core/tmp-glibc/sys=
roots/qemux86-64/usr/include/qt5/QtXml -I/home/jenkins/oe/world/shr-core/tm=
p-glibc/sysroots/qemux86-64/usr/include/qt5 -I/home/jenkins/oe/world/shr-co=
re/tmp-glibc/sysroots/qemux86-64/usr/include/qt5/QtWidgets -I/home/jenkins/=
oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/qt5 -I/home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/qt5/QtGui =
-I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include=
/qt5 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/in=
clude/qt5/QtCore -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux=
86-64/usr/include/qt5 -Dpoppler_qt5_EXPORTS -fPIC -Wall -Woverloaded-virtua=
l -Wnon-virtual-dtor -Wcast-align -fno-exceptions -fno-check-new -fno-commo=
n -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/je=
nkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/poppler/0.41.0-r0=
=3D/usr/src/debug/poppler/0.41.0-r0 -fdebug-prefix-map=3D/home/jenkins/oe/w=
orld/shr-core/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home=
/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64=3D -fvisibility-in=
lines-hidden -c ../../../poppler-0.41.0/qt5/src/ArthurOutputDev.cc  -fPIC -=
DPIC -o .libs/libpoppler_qt5_la-ArthurOutputDev.o
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/qatomic.h:46:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/qglobal.h:1140,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/qchar.h:43,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/qstring.h:48,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/qdatetime.h:43,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/qt5/QtCore/QDateTime:1,
|                  from ../../../poppler-0.41.0/qt5/src/poppler-annotation.=
h:31,
|                  from ../../../poppler-0.41.0/qt5/src/poppler-qt5.h:37,
|                  from ../../../poppler-0.41.0/qt5/src/poppler-page.cc:34:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include=
/qt5/QtCore/qbasicatomic.h:61:4: error: #error "Qt requires C++11 support"
|  #  error "Qt requires C++11 support"
|     ^


>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../fix-qt4e-library-dependencies.patch            | 28 ----------------=
------
>  .../{poppler_0.37.0.bb =3D> poppler_0.41.0.bb}       |  4 ++--
>  2 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt=
4e-library-dependencies.patch
>  rename meta-oe/recipes-support/poppler/{poppler_0.37.0.bb =3D> poppler_0=
=2E41.0.bb} (93%)
>=20
> diff --git a/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-libr=
ary-dependencies.patch b/meta-oe/recipes-support/poppler/poppler-0.35.0/fix=
-qt4e-library-dependencies.patch
> deleted file mode 100644
> index f67e1f5..0000000
> --- a/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dep=
endencies.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Configuration changes needed to allow building with QT4-embedded
> -
> -Index: poppler-0.35.0/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- poppler-0.35.0.orig/configure.ac
> -+++ poppler-0.35.0/configure.ac
> -@@ -654,17 +654,17 @@ AC_ARG_ENABLE(poppler-qt4,
> -               enable_poppler_qt4=3D"try")
> - if test x$enable_poppler_qt4 =3D xyes; then
> -   PKG_CHECK_MODULES(POPPLER_QT4,=20
> --	            QtCore >=3D 4.7.0 QtGui >=3D 4.7.0 QtXml >=3D 4.7.0)
> -+	            QtCoreE >=3D 4.7.0 QtGuiE >=3D 4.7.0 QtXmlE >=3D 4.7.0)
> -   PKG_CHECK_MODULES(POPPLER_QT4_TEST,=20
> --	            QtTest >=3D 4.7.0)
> -+	            QtTestE >=3D 4.7.0)
> - elif test x$enable_poppler_qt4 =3D xtry; then
> -   PKG_CHECK_MODULES(POPPLER_QT4,
> --                    QtCore >=3D 4.7.0 QtGui >=3D 4.7.0 QtXml >=3D 4.7.0,
> -+                    QtCoreE >=3D 4.7.0 QtGuiE >=3D 4.7.0 QtXmlE >=3D 4.=
7.0,
> -                     [enable_poppler_qt4=3D"yes"],
> -                     [enable_poppler_qt4=3D"no"])
> -   if test x$enable_poppler_qt4 =3D xyes; then
> -     PKG_CHECK_MODULES(POPPLER_QT4_TEST,
> --                    QtTest >=3D 4.7.0,
> -+                    QtTestE >=3D 4.7.0,
> -                     [enable_poppler_qt4=3D"yes"],
> -                     [enable_poppler_qt4=3D"no"])
> -   fi
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb b/meta-oe/=
recipes-support/poppler/poppler_0.41.0.bb
> similarity index 93%
> rename from meta-oe/recipes-support/poppler/poppler_0.37.0.bb
> rename to meta-oe/recipes-support/poppler/poppler_0.41.0.bb
> index 2c6b1a9..4320408 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
> @@ -6,8 +6,8 @@ SRC_URI =3D " \
>      http://poppler.freedesktop.org/${BP}.tar.xz \
>      file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
>  "
> -SRC_URI[md5sum] =3D "c635e1742202cbbd9182cb0255d95652"
> -SRC_URI[sha256sum] =3D "b89f9c5eae3bbb1046b0f767714afd75eca102a0406a3a30=
856778d42a685bee"
> +SRC_URI[md5sum] =3D "849a8bd6af5794efb961b70418414e5a"
> +SRC_URI[sha256sum] =3D "420abaab63caed9e1ee28964a0ba216d1979506726164bc9=
9ad5ade289192a1b"
> =20
>  DEPENDS =3D "fontconfig zlib cairo lcms"
> =20
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlciA+sACgkQN1Ujt2V2gBzwBQCfSLjSyNaIdrrgwJDii5j4GFjP
hD0AoKaNNDqgdpn2/RRJryvoHXFT68/6
=zeCd
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
