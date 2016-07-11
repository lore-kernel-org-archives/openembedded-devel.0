Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F89B731AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:35:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x83so14807586wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=a3M+Tv3W+nMNcEGjpbhkCxXb+GvM9f8qZ21glK9ElrQ=;
	b=HmSFx4vvQXahuKfXZoop1x7iK3SEbN7BZdydVymwQxGTacfeIkgZxOHOal/ve9HQOz
	b1QQ1trdTj748cn6ogZioGvZ0V9HkmD8l2CGmaEoY0JIvU08m7KPK3KTaKFLFFSPvCm5
	sUGYoDXzPN/USaEsMPdOq3A8iy2LlrwQ/g+dBANRlyS+Fj/5mTFc3nIz5GdhDiuF8Rhi
	Jr+wmfPPZ6wh0SYGpOHjw/H7538kZovgrIXWwUeDPDBe3Q0cv+fZmvioQ45/boco5CnE
	O8J+aNgL6m56h3oU5i0dhGrDOwwc+vU1XXOuQrVdi2i0RpVhcK5gZb54ce/edsZS7ktZ
	Bi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a3M+Tv3W+nMNcEGjpbhkCxXb+GvM9f8qZ21glK9ElrQ=;
	b=I/ptD+ZI+4+D4EsBzSHkMmF7UDRsGxrJCd1q3euZNdk+Xhp7qObcdhldeQi+hT+Sbb
	QiCKJBMe63LlpCQBKojGQ5ZimTnC9ZzUuLOPx4rWPh7VgA6BQqn31WZc40TNfx/8u1+c
	Q0Z+Mcyh5NdrXbUDufSy8OIFXljtMiLrvd78j/bP3SNln76lBpKC6N6oBGaBIIlL/mz6
	OXM/Y9+aPCJIEZxjnd20Fo4WDEnuQ2eJKQPPRsqfmA2ngkU05i51r+sG9BVozk1BlUpZ
	kPAQCYBKfxe9RYUuxkZfy0sed+a8ECJZhxfjZ0B9oJ0ut3JOdW36YQm837qOy0Y7rExj
	VZQA==
X-Gm-Message-State: ALyK8tKm6VeJZrWcv+j42AbbnRsVJkb1GB3JdYEOVKgwTBbACE5pKx6giKpV4B/yot5DTg==
X-Received: by 10.28.142.194 with SMTP id q185mr15242970wmd.6.1468247731525;
	Mon, 11 Jul 2016 07:35:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id hh4sm135327wjc.5.2016.07.11.07.35.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Jul 2016 07:35:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Jul 2016 16:35:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160711143536.s6nx2scag4j7sffc@jama>
References: <1467639953-22278-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1467639953-22278-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH] directfb: move recipe to meta-oe
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
X-List-Received-Date: Mon, 11 Jul 2016 14:35:35 -0000
X-Groupsio-MsgNum: 62108
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jn7xmil5xbx5zn75"
Content-Disposition: inline

--jn7xmil5xbx5zn75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2016 at 04:45:53PM +0300, Maxin B. John wrote:
> directfb.org has been down for about a year now. Since there
> are active users for this recipe, it makes sense to move this
> from oe-core to meta-oe.

Fails to apply:

OE @ ~/meta-openembedded $ pwam 126087
2016-07-11 15:29:51 URL:https://patchwork.openembedded.org/patch/126087/mbo=
x/ [33428] -> "pw-am-126087.patch" [1]
Applying: directfb: move recipe to meta-oe
=2Egit/rebase-apply/patch:51: trailing whitespace.
=20
=2Egit/rebase-apply/patch:53: trailing whitespace.
=20
=2Egit/rebase-apply/patch:56: space before tab in indent.
        AC_MSG_ERROR([$DIRECTFB_PKG_ERRORS
=2Egit/rebase-apply/patch:59: trailing whitespace.
--=20
=2Egit/rebase-apply/patch:207: trailing whitespace.
=20
fatal: corrupt patch at line 401
Patch failed at 0001 directfb: move recipe to meta-oe
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
OE @ ~/meta-openembedded $ patch -p1 < pw-am-126087.patch=20
patching file meta-oe/recipes-graphics/directfb/directfb-examples/configure=
=2Ein-Fix-string-argument-syntax.patch
patching file meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
patching file meta-oe/recipes-graphics/directfb/directfb.inc
patching file meta-oe/recipes-graphics/directfb/directfb/0001-gfx-direct-Ab=
oid-usng-VLAs-and-printf-formats.patch
patching file meta-oe/recipes-graphics/directfb/directfb/bashism.patch
patching file meta-oe/recipes-graphics/directfb/directfb/compar_fn_t.patch
patching file meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
patch: **** malformed patch at line 360:  ages-split/directfb/usr/bin/dfbsc=
reen contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb:=
 /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/m=
kdgiff contains probably-redundant RPATH /usr/libWARNING: QA Issue: directf=
b: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin=
/dfbinspector contains probably-redundant RPATH /usr/lib

Because there is extra line feed in
meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
(very long line), please check your sender configuration to prevent manglin=
g the patches in future.

This time I've fixed and applied it manually.

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../configure.in-Fix-string-argument-syntax.patch  |  28 +++++
>  .../directfb/directfb-examples_1.7.0.bb            |  21 ++++
>  meta-oe/recipes-graphics/directfb/directfb.inc     |  80 ++++++++++++++
>  ...direct-Aboid-usng-VLAs-and-printf-formats.patch |  61 +++++++++++
>  .../directfb/directfb/bashism.patch                |  18 ++++
>  .../directfb/directfb/compar_fn_t.patch            |  62 +++++++++++
>  .../directfb/directfb/configurefix.patch           |  60 +++++++++++
>  .../fix-client-gfx_state-initialisation.patch      |  38 +++++++
>  .../directfb/directfb/fusion.patch                 |  36 +++++++
>  .../directfb/directfb/union-sigval.patch           |  19 ++++
>  .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 116 +++++++++++++++=
++++++
>  .../recipes-graphics/directfb/directfb_1.7.7.bb    |   8 ++
>  12 files changed, 547 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb-examples/c=
onfigure.in-Fix-string-argument-syntax.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb-examples_1=
=2E7.0.bb
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb.inc
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-gfx-d=
irect-Aboid-usng-VLAs-and-printf-formats.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/bashism.pa=
tch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/compar_fn_=
t.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/configuref=
ix.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/fix-client=
-gfx_state-initialisation.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/fusion.pat=
ch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/union-sigv=
al.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/use-PTHREA=
D_MUTEX_RECURSIVE.patch
>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
>=20
> diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples/configur=
e.in-Fix-string-argument-syntax.patch b/meta-oe/recipes-graphics/directfb/d=
irectfb-examples/configure.in-Fix-string-argument-syntax.patch
> new file mode 100644
> index 0000000..0717ea6
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fi=
x-string-argument-syntax.patch
> @@ -0,0 +1,28 @@
> +From 88077ed156a714f32bb408f422278d61611ffd41 Mon Sep 17 00:00:00 2001
> +From: Otavio Salvador <otavio@ossystems.com.br>
> +Date: Sat, 26 Jul 2014 16:57:46 -0300
> +Subject: [PATCH] configure.in: Fix string argument syntax
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +---
> + configure.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index bfe1b82..e939bbd 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -65,7 +65,7 @@ fi)
> +=20
> + DIRECTFB_REQUIRED_VERSION=3D1.4.14
> +=20
> +-PKG_CHECK_MODULES(DIRECTFB, directfb >=3D $DIRECTFB_REQUIRED_VERSION,[ =
WATER=3D`$PKG_CONFIG --variable=3Dwater directfb` ],
> ++PKG_CHECK_MODULES([DIRECTFB], directfb >=3D $DIRECTFB_REQUIRED_VERSION,=
[ WATER=3D`$PKG_CONFIG --variable=3Dwater directfb` ],
> + 	AC_MSG_ERROR([$DIRECTFB_PKG_ERRORS
> + *** DirectFB $DIRECTFB_REQUIRED_VERSION or newer is required. The lates=
t version
> + *** of DirectFB is available from http://www.directfb.org/.]))
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb=
 b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> new file mode 100644
> index 0000000..7907c5c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Example DirectFB applications"
> +DESCRIPTION =3D "The DirectFB-examples package contains a set of simple =
DirectFB \
> +      applications that can be used to test and demonstrate various Dire=
ctFB \
> +      features"
> +DEPENDS =3D "directfb"
> +SECTION =3D "libs"
> +LICENSE =3D "MIT"
> +
> +SRC_URI =3D " \
> +           http://downloads.yoctoproject.org/mirror/sources/DirectFB-exa=
mples-${PV}.tar.gz \
> +           file://configure.in-Fix-string-argument-syntax.patch \
> +          "
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Decf6fd2b19915afc4da56043926ca=
18f"
> +
> +S =3D "${WORKDIR}/DirectFB-examples-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] =3D "8b60c867af295481c32a8c7fc5802307"
> +SRC_URI[sha256sum] =3D "9a2104cc4da8123c8371813551b66b943198979f745cbebc=
034bb5e10844122a"
> diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/rec=
ipes-graphics/directfb/directfb.inc
> new file mode 100644
> index 0000000..46e0838
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb.inc
> @@ -0,0 +1,80 @@
> +SUMMARY =3D "Graphics abstraction library for the Linux Framebuffer Devi=
ce"
> +DESCRIPTION =3D "DirectFB is a thin library that provides developers \
> +with hardware graphics acceleration, input device handling and \
> +abstraction, an integrated windowing system with support for \
> +translucent windows and multiple display layers on top of the \
> +Linux framebuffer device."
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a7908=
589"
> +
> +HOMEPAGE =3D "http://directfb.org"
> +DEPENDS =3D "jpeg libpng freetype zlib tslib sysfsutils"
> +
> +SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/DirectFB-$=
{PV}.tar.gz \
> +           file://configurefix.patch \
> +           file://fusion.patch \
> +           file://bashism.patch \
> +           file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.pat=
ch \
> +           file://compar_fn_t.patch \
> +           file://union-sigval.patch \
> +           file://use-PTHREAD_MUTEX_RECURSIVE.patch \
> +           file://fix-client-gfx_state-initialisation.patch \
> +          "
> +
> +S =3D "${WORKDIR}/DirectFB-${PV}"
> +
> +LDFLAGS_append =3D" -lts -lm"
> +
> +# Workaround for linking issues seen with armv7a + gold
> +LDFLAGS_append_arm =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', ' -fuse-ld=3Dbfd ', '', d)}"
> +
> +BINCONFIG =3D "${bindir}/directfb-config"
> +
> +inherit autotools binconfig-disabled pkgconfig
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jasper"
> +PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
> +PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
> +PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
> +
> +EXTRA_OECONF =3D "\
> +  --with-gfxdrivers=3Dnone \
> +  --enable-freetype=3Dyes \
> +  --enable-zlib \
> +  --disable-imlib2 \
> +  --disable-mesa \
> +  --disable-sdl \
> +  --disable-vnc \
> +  --disable-x11 \
> +"
> +
> +#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS =
as default
> +#this will cause directfb build failure on x86 arch, so filter out it.
> +TARGET_CFLAGS_remove_x86 =3D "-fno-omit-frame-pointer"
> +
> +#PACKAGES_DYNAMIC +=3D "^directfb-inputdrivers-.*"
> +#
> +#python populate_packages_prepend () {
> +#    inputdrivers_libdir =3D d.expand('${libdir}/directfb-${RV}/inputdri=
vers')
> +#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputd=
rivers-%s', 'Directfb plugin for %s')
> +#}
> +
> +# NOTE: monolithic packaging for now, should improve that eventually
> +
> +FILES_${PN}-dev +=3D "\
> +  ${bindir}/directfb-config \
> +  ${libdir}/directfb-${RV}/systems/*.la \
> +  ${libdir}/directfb-${RV}/inputdrivers/*.la \
> +  ${libdir}/directfb-${RV}/interfaces/*/*.la \
> +  ${libdir}/directfb-${RV}/wm/*.la \
> +"
> +
> +FILES_${PN} +=3D "\
> +  ${libdir}/directfb-${RV}/systems/*.so \
> +  ${libdir}/directfb-${RV}/inputdrivers/*.so \
> +  ${libdir}/directfb-${RV}/interfaces/*/*.so \
> +  ${libdir}/directfb-${RV}/wm/*.so \
> +  ${datadir}/directfb-${PV} \
> +"
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-gfx-direct-A=
boid-usng-VLAs-and-printf-formats.patch b/meta-oe/recipes-graphics/directfb=
/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
> new file mode 100644
> index 0000000..76e0f75
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-us=
ng-VLAs-and-printf-formats.patch
> @@ -0,0 +1,61 @@
> +From f43ef44806ffb8e3b35d99070dde9b6cc1714d3d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Sep 2015 21:32:20 +0000
> +Subject: [PATCH] gfx,direct: Aboid usng VLAs and printf formats
> +
> +VLAs are flagged by clang when using non-POD types, therefore replace
> +the usage with alloca which is exact same allocation on stack
> +
> + __attribute__((__format__ (__printf__))) is not portable as used here
> + therefore disable the check for clang here, we lose no functionality
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + lib/direct/util.h | 2 +-
> + src/gfx/util.cpp  | 8 ++++----
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/direct/util.h b/lib/direct/util.h
> +index 72941e9..8e7fa4a 100644
> +--- a/lib/direct/util.h
> ++++ b/lib/direct/util.h
> +@@ -98,7 +98,7 @@
> + #define D_CONST_FUNC
> + #endif
> +=20
> +-#if __GNUC__ >=3D 3
> ++#if __GNUC__ >=3D 3 && !defined __clang__
> + #define D_FORMAT_PRINTF(n)         __attribute__((__format__ (__printf_=
_, n, n+1)))
> + #define D_FORMAT_VPRINTF(n)        __attribute__((__format__ (__printf_=
_, n, 0)))
> + #else
> +diff --git a/src/gfx/util.cpp b/src/gfx/util.cpp
> +index 40032bc..d1015d4 100644
> +--- a/src/gfx/util.cpp
> ++++ b/src/gfx/util.cpp
> +@@ -294,8 +294,8 @@ dfb_gfx_copy_regions_stereo( CoreSurface           *=
source,
> + {
> +      unsigned int i, n =3D 0;
> +      DFBRectangle rect =3D { 0, 0, source->config.size.w, source->confi=
g.size.h };
> +-     DFBRectangle rects[num];
> +-     DFBPoint     points[num];
> ++     DFBRectangle *rects =3D  (DFBRectangle*)alloca( sizeof(struct DFBR=
ectangle) * num);
> ++     DFBPoint *points =3D  (DFBPoint*)alloca( sizeof(struct DFBPoint) *=
 num);
> +=20
> +      for (i=3D0; i<num; i++) {
> +           DFB_REGION_ASSERT( &regions[i] );
> +@@ -351,8 +351,8 @@ dfb_gfx_copy_regions_client( CoreSurface            =
 *source,
> + {
> +      unsigned int             i, n =3D 0;
> +      DFBRectangle             rect =3D { 0, 0, source->config.size.w, s=
ource->config.size.h };
> +-     DFBRectangle             rects[num];
> +-     DFBPoint                 points[num];
> ++     DFBRectangle            *rects =3D  (DFBRectangle*)alloca( sizeof(=
struct DFBRectangle) * num);
> ++     DFBPoint                *points =3D  (DFBPoint*)alloca( sizeof(str=
uct DFBPoint) * num);
> +      CoreGraphicsStateClient *client =3D _client ? _client : &StateClie=
nt::Get()->client;
> +      CardState               *state  =3D client->state;
> +      CardState                backup;
> +--=20
> +2.5.1
> +
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/bashism.patch b/m=
eta-oe/recipes-graphics/directfb/directfb/bashism.patch
> new file mode 100644
> index 0000000..2ef4e93
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/bashism.patch
> @@ -0,0 +1,18 @@
> +${x//y/} is a bash syntax. Replace with something dash compatible
> +
> +RP 2015/5/3
> +Upstream-Status: Pending
> +
> +Index: DirectFB-1.7.7/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/configure.in
> ++++ DirectFB-1.7.7/configure.in
> +@@ -2696,7 +2696,7 @@ AM_CONDITIONAL(BUILD_TOOLS, test "$with_
> + AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" =3D "yes")
> +=20
> + CFLAGS=3D"$CFLAGS $DFB_INTERNAL_CFLAGS"
> +-CXXFLAGS=3D"$CXXFLAGS ${CFLAGS//-Werror-implicit-function-declaration/}"
> ++CXXFLAGS=3D"$CXXFLAGS $(printf '%s\n' "$CFLAGS" | sed 's/-Werror-implic=
it-function-declaration//g')"
> + DFB_LDFLAGS=3D"$LDFLAGS $ZLIB_LIBS"
> +=20
> + CFLAGS=3D"$CFLAGS $CFLAGS_STD"
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/compar_fn_t.patch=
 b/meta-oe/recipes-graphics/directfb/directfb/compar_fn_t.patch
> new file mode 100644
> index 0000000..ee4d900
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/compar_fn_t.patch
> @@ -0,0 +1,62 @@
> +test for __compar_fn_t and if not defined by libc then define it
> +help make directfb compile with musl
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: DirectFB-1.7.7/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/configure.in
> ++++ DirectFB-1.7.7/configure.in
> +@@ -112,6 +112,17 @@ AC_CHECK_SIZEOF(long)
> + AC_CHECK_SIZEOF(long long)
> + AC_CHECK_FUNCS(fork)
> +=20
> ++AC_CACHE_CHECK([for compar_fn_t in stdlib.h],ccache_cv_COMPAR_FN_T, [
> ++    AC_TRY_COMPILE(
> ++        [#include <stdlib.h>],
> ++        [void test_fn(void) { qsort(NULL, 0, 0, (__compar_fn_t)NULL); }=
],
> ++        ccache_cv_COMPAR_FN_T=3Dyes,
> ++        ccache_cv_COMPAR_FN_T=3Dno)])
> ++if test x"$ccache_cv_COMPAR_FN_T" =3D x"yes"; then
> ++   AC_DEFINE(HAVE_COMPAR_FN_T, 1,
> ++             Define to 1 if you have the `__compar_fn_t' typedef.)
> ++fi
> ++
> + AC_PATH_PROGS(PERL, perl5 perl)
> +=20
> + AC_PATH_PROG(MAN2HTML, man2html, no)
> +Index: DirectFB-1.7.7/inputdrivers/lirc/lirc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/inputdrivers/lirc/lirc.c
> ++++ DirectFB-1.7.7/inputdrivers/lirc/lirc.c
> +@@ -59,6 +59,11 @@
> +=20
> + #include <core/input_driver.h>
> +=20
> ++#if HAVE_COMPAR_FN_T
> ++#define COMPAR_FN_T __compar_fn_t
> ++#else
> ++typedef int (*COMPAR_FN_T)(const void *, const void *);
> ++#endif
> +=20
> + DFB_INPUT_DRIVER( lirc )
> +=20
> +@@ -97,7 +102,7 @@ static DFBInputDeviceKeySymbol lirc_pars
> +           qsort ( keynames,
> +                   D_ARRAY_SIZE( keynames ),
> +                   sizeof(keynames[0]),
> +-                  (__compar_fn_t) keynames_sort_compare );
> ++                  (COMPAR_FN_T) keynames_sort_compare );
> +           keynames_sorted =3D true;
> +      }
> +=20
> +@@ -124,7 +129,7 @@ static DFBInputDeviceKeySymbol lirc_pars
> +                symbol_name =3D bsearch( name, keynames,
> +                                       D_ARRAY_SIZE( keynames ),
> +                                       sizeof(keynames[0]),
> +-                                      (__compar_fn_t) keynames_compare =
);
> ++                                      (COMPAR_FN_T) keynames_compare );
> +                if (symbol_name)
> +                     return symbol_name->symbol;
> +                break;
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/configurefix.patc=
h b/meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
> new file mode 100644
> index 0000000..dd8c019
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
> @@ -0,0 +1,60 @@
> +Libtool needs these set correctly else we end up with pointless rpaths
> +such as the QA warnings:
> +
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/bin/dfblayer contains probably-redundant RPATH /u=
sr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1=
/packages-split/directfb/usr/bin/dfbmaster contains probably-redundant RPAT=
H /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.1=
5-r1/packages-split/directfb/usr/bin/mkdgifft contains probably-redundant R=
PATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.=
4.15-r1/packages-split/directfb/usr/bin/dfbdump contains probably-redundant=
 RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-=
1.4.15-r1/packages-split/directfb/usr/bin/dfbinput contains probably-redund=
ant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/direct=
fb-1.4.15-r1/packages-split/directfb/usr/bin/dfbfx contains probably-redund=
ant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/direct=
fb-1.4.15-r1/pack
>  ages-split/directfb/usr/bin/dfbscreen contains probably-redundant RPATH =
/usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-=
r1/packages-split/directfb/usr/bin/mkdgiff contains probably-redundant RPAT=
H /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.1=
5-r1/packages-split/directfb/usr/bin/dfbinspector contains probably-redunda=
nt RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/bin/mkdfiff contains probably-redundant RPATH /us=
r/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/bin/dfbinfo contains probably-redundant RPATH /us=
r/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/bin/dfbpenmount contains probably-redundant RPATH=
 /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/bin/dfbg contains probably-redundant RPATH /usr/l=
ib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/libfusion-1.4.so.6 contains probably-redundan=
t RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/libdirectfb-1.4.so.6.0.9 contains probably-re=
dundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/libdirectfb-1.4.so.6 contains probably-redund=
ant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/libfusion-1.4.so.6.0.9 contains probably-redu=
ndant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_fbdev.so c=
ontains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_devmem.so =
contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_dummy.so c=
ontains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvi=
der/libidirectfbvideoprovider_v4l.so contains probably-redundant RPATH /usr=
/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvi=
der/libidirectfbvideoprovider_gif.so contains probably-redundant RPATH /usr=
/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/ICoreResourceManage=
r/libicoreresourcemanager_test.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvi=
der/libidirectfbimageprovider_jpeg.so contains probably-redundant RPATH /us=
r/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvi=
der/libidirectfbimageprovider_png.so contains probably-redundant RPATH /usr=
/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvi=
der/libidirectfbimageprovider_dfiff.so contains probably-redundant RPATH /u=
sr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvi=
der/libidirectfbimageprovider_gif.so contains probably-redundant RPATH /usr=
/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libid=
irectfbfont_ft2.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libid=
irectfbfont_dgiff.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/wm/libdirectfbwm_default.so co=
ntains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_zytro=
nic.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_penmo=
unt.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_linux=
_input.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_seria=
lmouse.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_mutou=
ch.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_tslib=
=2Eso contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_joyst=
ick.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_sonyp=
i.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_lirc.=
so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_wm97x=
x_ts.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_ps2mo=
use.so contains probably-redundant RPATH /usr/lib
> +WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pa=
ckages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_keybo=
ard.so contains probably-redundant RPATH /usr/lib
> +
> +Upstream-Status: Pending
> +
> +RP 2012/03/16
> +
> +Index: DirectFB-1.4.15/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.4.15.orig/configure.in	2012-03-16 13:32:23.692402879 +0000
> ++++ DirectFB-1.4.15/configure.in	2012-03-16 13:33:22.312400960 +0000
> +@@ -97,13 +97,6 @@
> + AC_CHECK_SIZEOF(long long)
> + AC_CHECK_FUNCS(fork)
> +=20
> +-
> +-## Work around libstuhl during cross build...
> +-if test "$host" !=3D "$build"; then
> +-  sys_lib_dlsearch_path_spec=3D""
> +-  sys_lib_search_path_spec=3D""
> +-fi
> +-
> + AC_PATH_PROGS(PERL, perl5 perl)
> +=20
> + AC_PATH_PROG(MAN2HTML, man2html, no)
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/fix-client-gfx_st=
ate-initialisation.patch b/meta-oe/recipes-graphics/directfb/directfb/fix-c=
lient-gfx_state-initialisation.patch
> new file mode 100644
> index 0000000..57a9b0d
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/fix-client-gfx_state-ini=
tialisation.patch
> @@ -0,0 +1,38 @@
> +From 8e53c0b9cedb62b82e2b7680d793d433b647ae20 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Mon, 13 Jun 2016 13:32:44 -0700
> +Subject: [PATCH] fix client->gfx_state initialisation
> +
> +Shortly before the DirectFB 1.7.7 release, an optimisation was added
> +to CoreGraphicsStateClient_Init() to avoid creating an extended
> +Graphics State object if it will not later be required:
> +
> +  4d422fb Client: Create extended Graphics State object when needed for =
later usage
> +
> +Unfortunately the client->gfx_state variable used to track the
> +extended Graphics State object is not initialised, which can lead to
> +crashes etc due to creation of the Graphics State object erroneously
> +being skipped.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + src/core/CoreGraphicsStateClient.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/core/CoreGraphicsStateClient.cpp b/src/core/CoreGraphic=
sStateClient.cpp
> +index 5d46f0e..5007755 100644
> +--- a/src/core/CoreGraphicsStateClient.cpp
> ++++ b/src/core/CoreGraphicsStateClient.cpp
> +@@ -364,6 +364,7 @@ CoreGraphicsStateClient_Init( CoreGraphicsStateClien=
t *client,
> +      client->renderer  =3D NULL;
> +      client->requestor =3D NULL;
> +      client->throttle  =3D NULL;
> ++     client->gfx_state =3D NULL;
> +=20
> +      if (dfb_config->task_manager) {
> +           if (dfb_config->call_nodirect) {
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/fusion.patch b/me=
ta-oe/recipes-graphics/directfb/directfb/fusion.patch
> new file mode 100644
> index 0000000..1f81a67
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/fusion.patch
> @@ -0,0 +1,36 @@
> +directfb: Fix for hangs in direct_test, fusion_skirmish on exit
> +
> +Upstream-Status: Pending
> +Signed-off-by: Lauren Post <lauren.post@freescale.com>
> +
> +--- a/lib/fusion/fusion.c	2013-01-18 22:57:11.000000000 +0800
> ++++ b/lib/fusion/fusion.c	2013-07-04 10:42:56.502699119 +0800
> +@@ -2853,9 +2853,14 @@
> +           direct_mutex_lock( &world->event_dispatcher_mutex );
> +=20
> +           while (1) {
> +-               if (!world->event_dispatcher_buffers)
> ++               if (!world->event_dispatcher_buffers){
> +                     direct_waitqueue_wait( &world->event_dispatcher_con=
d, &world->event_dispatcher_mutex );
> +-
> ++                    if (world->dispatch_stop) {
> ++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORI=
NG (dispatch_stop!)\n" );
> ++                         direct_mutex_unlock( &world->event_dispatcher_=
mutex );
> ++                         return NULL;
> ++                    }
> ++               }
> +                buf =3D (FusionEventDispatcherBuffer *)world->event_disp=
atcher_buffers;
> +                D_MAGIC_ASSERT( buf, FusionEventDispatcherBuffer );
> +=20
> +@@ -2872,6 +2877,11 @@
> + //D_INFO("waiting...\n");
> +                     D_ASSERT( buf->read_pos =3D=3D buf->write_pos );
> +                     direct_waitqueue_wait( &world->event_dispatcher_con=
d, &world->event_dispatcher_mutex );
> ++		      if (world->dispatch_stop) {
> ++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORI=
NG (dispatch_stop!)\n" );
> ++                         direct_mutex_unlock( &world->event_dispatcher_=
mutex );
> ++                         return NULL;
> ++                    }
> +                }
> +=20
> +                buf =3D (FusionEventDispatcherBuffer *)world->event_disp=
atcher_buffers;
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/union-sigval.patc=
h b/meta-oe/recipes-graphics/directfb/directfb/union-sigval.patch
> new file mode 100644
> index 0000000..29f45c7
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/union-sigval.patch
> @@ -0,0 +1,19 @@
> +This patch is taken from gentoo musl overlay
> +sigval_t is glibc only construct, we use a union of sigval
> +which pretty much is same effect as sigval_t
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c Direct=
FB-1.7.6/lib/direct/os/linux/glibc/system.c
> +--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c	2014-07-15 02=
:54:58.000000000 -0400
> ++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c	2015-07-18 16:55:3=
5.077989166 -0400
> +@@ -111,7 +111,7 @@
> + void
> + direct_trap( const char *domain, int sig )
> + {
> +-     sigval_t val;
> ++     union sigval val;
> +=20
> +      if (direct_config->delay_trap_ms) {
> +           D_LOG( Direct_Trap, VERBOSE, "NOT RAISING signal %d from %s, =
waiting for %dms... attach gdb --pid=3D%d\n", sig, domain, direct_config->d=
elay_trap_ms, getpid() );
> diff --git a/meta-oe/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX=
_RECURSIVE.patch b/meta-oe/recipes-graphics/directfb/directfb/use-PTHREAD_M=
UTEX_RECURSIVE.patch
> new file mode 100644
> index 0000000..ac48f68
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURS=
IVE.patch
> @@ -0,0 +1,116 @@
> +Remove use of DIRECT_RECURSIVE_MUTEX_INITIALIZER its not portable
> +use portable way to initialize recursive mutex using pthread_once() and =
direct_recursive_mutex_init()
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Index: DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/lib/direct/os/linux/glibc/mutex.h
> ++++ DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
> +@@ -46,7 +46,6 @@ struct __D_DirectMutex {
> + /**********************************************************************=
************************************************/
> +=20
> + #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITI=
ALIZER }
> +-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_M=
UTEX_INITIALIZER_NP }
> +=20
> + #endif
> +=20
> +Index: DirectFB-1.7.7/lib/direct/trace.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/lib/direct/trace.c
> ++++ DirectFB-1.7.7/lib/direct/trace.c
> +@@ -89,8 +89,15 @@ struct __D_DirectTraceBuffer {
> + /**********************************************************************=
****************************/
> +=20
> + static DirectLink  *buffers;
> +-static DirectMutex  buffers_lock =3D DIRECT_RECURSIVE_MUTEX_INITIALIZER=
(buffers_lock);
> +=20
> ++static pthread_once_t buffers_lock_init_once =3D PTHREAD_ONCE_INIT;
> ++static DirectMutex buffers_lock;
> ++
> ++static void
> ++buffers_lock_init( void )
> ++{
> ++     direct_recursive_mutex_init(&buffers_lock);
> ++}
> + /**********************************************************************=
****************************/
> +=20
> + __dfb_no_instrument_function__
> +@@ -113,6 +120,7 @@ get_trace_buffer( void )
> +=20
> +           D_MAGIC_SET( buffer, DirectTraceBuffer );
> +=20
> ++          pthread_once(&buffers_lock_init_once, buffers_lock_init);
> +           direct_mutex_lock( &buffers_lock );
> +           direct_list_append( &buffers, &buffer->link );
> +           direct_mutex_unlock( &buffers_lock );
> +@@ -138,8 +146,14 @@ typedef struct {
> + } SymbolTable;
> +=20
> + static DirectLink  *tables      =3D NULL;
> +-static DirectMutex  tables_lock =3D DIRECT_RECURSIVE_MUTEX_INITIALIZER(=
tables_lock);
> ++static pthread_once_t tables_lock_init_once =3D PTHREAD_ONCE_INIT;
> ++static DirectMutex tables_lock;
> +=20
> ++static void
> ++tables_lock_init( void )
> ++{
> ++     direct_recursive_mutex_init(&tabless_lock);
> ++}
> +=20
> + __dfb_no_instrument_function__
> + static void
> +@@ -370,6 +384,7 @@ direct_trace_lookup_symbol( const char *
> +      Symbol      *symbol;
> +      SymbolTable *table;
> +=20
> ++     pthread_once(&tables_lock_init_once, tables_lock_init);
> +      direct_mutex_lock( &tables_lock );
> +=20
> +      table =3D find_table( filename );
> +@@ -514,6 +529,7 @@ direct_trace_print_stacks()
> +      DirectTraceBuffer *b;
> +      DirectTraceBuffer *buffer =3D get_trace_buffer();
> +=20
> ++     pthread_once(&buffers_lock_init_once, buffers_lock_init);
> +      direct_mutex_lock( &buffers_lock );
> +=20
> +      if (buffer && buffer->level)
> +@@ -611,6 +627,7 @@ direct_trace_free_buffer( DirectTraceBuf
> +      D_MAGIC_ASSERT( buffer, DirectTraceBuffer );
> +=20
> +      if (buffer->thread) {
> ++          pthread_once(&buffers_lock_init_once, buffers_lock_init);
> +           direct_mutex_lock( &buffers_lock );
> +           direct_list_remove( &buffers, &buffer->link );
> +           direct_mutex_unlock( &buffers_lock );
> +Index: DirectFB-1.7.7/src/directfb.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- DirectFB-1.7.7.orig/src/directfb.c
> ++++ DirectFB-1.7.7/src/directfb.c
> +@@ -99,6 +99,15 @@ const unsigned int directfb_micro_versio
> + const unsigned int directfb_binary_age    =3D DIRECTFB_BINARY_AGE;
> + const unsigned int directfb_interface_age =3D DIRECTFB_INTERFACE_AGE;
> +=20
> ++static pthread_once_t lock_init_once =3D PTHREAD_ONCE_INIT;
> ++static DirectMutex lock;
> ++
> ++static void
> ++lock_init( void )
> ++{
> ++     direct_recursive_mutex_init(&lock);
> ++}
> ++
> + const char *
> + DirectFBCheckVersion( unsigned int required_major,
> +                       unsigned int required_minor,
> +@@ -215,8 +224,7 @@ DirectFBCreate( IDirectFB **interface_pt
> +      if (dfb_config->remote.host)
> +           return CreateRemote( dfb_config->remote.host, dfb_config->rem=
ote.port, interface_ptr );
> +=20
> +-     static DirectMutex lock =3D DIRECT_RECURSIVE_MUTEX_INITIALIZER(loc=
k);
> +-
> ++     pthread_once(&lock_init_once, lock_init);
> +      direct_mutex_lock( &lock );
> +=20
> +      if (!dfb_config->no_singleton && idirectfb_singleton) {
> diff --git a/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb b/meta-o=
e/recipes-graphics/directfb/directfb_1.7.7.bb
> new file mode 100644
> index 0000000..c6c070e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb
> @@ -0,0 +1,8 @@
> +require directfb.inc
> +
> +RV =3D "1.7-7"
> +
> +LEAD_SONAME =3D "libdirectfb-1.7.so.0"
> +
> +SRC_URI[md5sum] =3D "152cf1863b1a3a28aa1370e9053440bf"
> +SRC_URI[sha256sum] =3D "b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c7=
47d3fbc52f8027a3"
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jn7xmil5xbx5zn75
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleDoBcACgkQN1Ujt2V2gBxt3wCeOLY3yvjRs5Q0xVVX35JL8hEp
+98AnjNLgrkgyuDqBBT0cEb4D4H/CtJg
=hCZK
-----END PGP SIGNATURE-----

--jn7xmil5xbx5zn75--
