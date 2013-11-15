Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 082616D72F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:19:42 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so456657eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 06:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oF/qyWZlYyf4KXTX/GCyGpZZzAIXPJPxFCt6lSxP6kc=;
	b=yDGlBocoIjgfb7/gM4fQ/LqGXCvT/8JCJSzEnAfrbbXBocc1XXDe/MpewPd+EJdeIC
	GQH+S2MlmMJbpltvoZ0JS+GSrvWY0kS4Tnx/oIHYguqZ7D+AO53Amfn4eUFpAu7Ls5OY
	9AS2XAsHAPGrEFhcyMRTp4YKYX4ayH+taWzrKff8dv0xBZLpq8D7WToexNqS2gDNt65r
	STO2ba28aOwCMNNb5x/xZ1WRON86VFMDTJflnqGED7xg5mHJHu51a8CnBq9iHMbH8h/K
	UHA6VAHN2Z5bh5AZ907pvLfcJv21ohoZAOOcP9EaxrMki/82aJ9HVM4BUftKB5Yt6HbR
	4NIQ==
X-Received: by 10.15.102.65 with SMTP id bq41mr333786eeb.79.1384525183856;
	Fri, 15 Nov 2013 06:19:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a6sm6823619eei.10.2013.11.15.06.19.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 06:19:42 -0800 (PST)
Date: Fri, 15 Nov 2013 15:20:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131115142008.GB31430@jama>
References: <1384474452-14955-1-git-send-email-philip@balister.org>
	<1384474452-14955-2-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1384474452-14955-2-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 2/2] gnuradio : Remove recipes. Now lives in meta-sdr.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2013 14:19:44 -0000
X-Groupsio-MsgNum: 47143
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline

--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2013 at 07:14:12PM -0500, Philip Balister wrote:
> https://github.com/balister/meta-sdr
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 ------------
>  .../gnuradio/0001-gr-trellis-Kill-docs-hard.patch  |  38 --------
>  .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 100 ---------------=
------
>  3 files changed, 196 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-b=
uildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-g=
r-trellis-Kill-docs-hard.patch
>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb

Applying: gnuradio : Remove recipes. Now lives in meta-sdr.
error:
meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-=
include-and-usr-lib-to-config.patch:
does not exist in index
error: patch failed:
meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb:1
error: meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb: patch does
not apply
Patch failed at 0001 gnuradio : Remove recipes. Now lives in meta-sdr.

But will apply it manually.

>=20
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys=
-don-t-add-usr-include-and-usr-lib-to-config.patch b/meta-oe/recipes-connec=
tivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to=
-config.patch
> deleted file mode 100644
> index 7caaf51..0000000
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-=
add-usr-include-and-usr-lib-to-config.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From a130153ae84d8bb5914879cef94df09f06825c10 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sat, 18 Jun 2011 11:25:36 +0200
> -Subject: [PATCH] buildsys: don't add /usr/include and /usr/lib to config=
ure tests for libusb
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - config/usrp_libusb.m4 |   13 -------------
> - 1 files changed, 0 insertions(+), 13 deletions(-)
> -
> -diff --git a/config/usrp_libusb.m4 b/config/usrp_libusb.m4
> -index cc3410f..b421820 100644
> ---- a/config/usrp_libusb.m4
> -+++ b/config/usrp_libusb.m4
> -@@ -117,10 +117,6 @@ AC_DEFUN([USRP_LIBUSB], [
> -       dnl configured to find this header.
> -       AC_LANG_PUSH(C)
> -       save_CPPFLAGS=3D"$CPPFLAGS"
> --      if test x$USB_INCLUDEDIR !=3D x; then
> --        USB_INCLUDES=3D"-I$USB_INCLUDEDIR"
> --        CPPFLAGS=3D"$USB_INCLUDES"
> --      fi
> -       AC_MSG_CHECKING([$libusb_name for header $usb_header])
> -       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> -         #include "$usb_header"
> -@@ -172,9 +168,6 @@ AC_DEFUN([USRP_LIBUSB], [
> -             *)
> -               AC_LANG_PUSH(C)
> -               save_CPPFLAGS=3D"$CPPFLAGS"
> --              if test x$USB_INCLUDEDIR !=3D x; then
> --                CPPFLAGS=3D"$USB_INCLUDES"
> --              fi
> -               save_LIBS=3D"$LIBS"
> -               LIBS=3D"$USB_LIBS"
> -               AC_MSG_CHECKING([$libusb_name for symbol usb_debug in lib=
rary $usb_lib_name])
> -@@ -217,9 +210,6 @@ AC_DEFUN([USRP_LIBUSB], [
> -     dnl final error checking, mostly to create #define's
> -     AC_LANG_PUSH(C)
> -     save_CPPFLAGS=3D"$CPPFLAGS"
> --    if test x$USB_INCLUDEDIR !=3D x; then
> --      CPPFLAGS=3D"$USB_INCLUDES"
> --    fi
> -     dnl Check for the header.
> -     AC_CHECK_HEADERS([$usb_header], [], [libusbok=3Dno])
> -     CPPFLAGS=3D"$save_CPPFLAGS"
> -@@ -231,9 +221,6 @@ AC_DEFUN([USRP_LIBUSB], [
> -       dnl check for the library (again)
> -       AC_LANG_PUSH(C)
> -       save_CPPFLAGS=3D"$CPPFLAGS"
> --      if test x$USB_INCLUDEDIR !=3D x; then
> --        CPPFLAGS=3D"$USB_INCLUDES"
> --      fi
> -       save_LIBS=3D"$LIBS"
> -       LIBS=3D"$USB_LIBS"
> -       AC_CHECK_LIB([$usb_lib_name], [$usb_lib_func], [], [
> ---=20
> -1.6.6.1
> -
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trell=
is-Kill-docs-hard.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/00=
01-gr-trellis-Kill-docs-hard.patch
> deleted file mode 100644
> index 38c3a10..0000000
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill=
-docs-hard.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 473342055e423384e2b17cc0957613299382fb79 Mon Sep 17 00:00:00 2001
> -From: Philip Balister <philip@balister.org>
> -Date: Mon, 17 Jun 2013 10:58:29 -0400
> -Subject: [PATCH] gr-trellis : Kill docs hard.
> -
> -Signed-off-by: Philip Balister <philip@balister.org>
> ----
> - gr-trellis/CMakeLists.txt | 7 -------
> - 1 file changed, 7 deletions(-)
> -
> -diff --git a/gr-trellis/CMakeLists.txt b/gr-trellis/CMakeLists.txt
> -index 16a3e7c..95e1420 100644
> ---- a/gr-trellis/CMakeLists.txt
> -+++ b/gr-trellis/CMakeLists.txt
> -@@ -50,12 +50,6 @@ if(ENABLE_GR_TRELLIS)
> - include(GrPackage)
> - CPACK_SET(CPACK_COMPONENT_GROUP_TRELLIS_DESCRIPTION "GNU Radio Trellis =
Blocks")
> -=20
> --CPACK_COMPONENT("trellis_docs"
> --    GROUP        "Trellis"
> --    DISPLAY_NAME "Documentation"
> --    DESCRIPTION  "Doxygen HTML and XML"
> --)
> --
> - CPACK_COMPONENT("trellis_runtime"
> -     GROUP        "Trellis"
> -     DISPLAY_NAME "Runtime"
> -@@ -95,7 +89,6 @@ CPACK_COMPONENT("trellis_swig"
> - # Add subdirectories
> - ########################################################################
> - add_subdirectory(src/lib)
> --add_subdirectory(doc)
> - if(ENABLE_PYTHON)
> -     add_subdirectory(grc)
> -     add_subdirectory(src/python)
> ---=20
> -1.7.11.7
> -
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta=
-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> deleted file mode 100644
> index 1a78575..0000000
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -DESCRIPTION =3D "GNU Radio"
> -URL =3D "http://gnuradio.org"
> -SECTION =3D  "apps"
> -LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> -
> -DEPENDS =3D "gsl fftwf python alsa-lib boost cppunit \
> -           swig-native python-numpy python-cheetah-native orc"
> -
> -#Available PACKAGECONFIG options are qt grc uhd
> -PACKAGECONFIG ??=3D "qtgui grc uhd"
> -
> -PACKAGECONFIG[uhd] =3D "-DENABLE_GR_UHD=3DON,-DENABLE_GR_UHD=3DOFF,uhd,"
> -PACKAGECONFIG[grc] =3D "-DENABLE_GRC=3DON,-DENABLE_GRC=3DOFF,python-pygt=
k python-cheetah, "
> -
> -PACKAGECONFIG[qtgui] =3D "-DENABLE_GR_QTGUI=3DON,-DENABLE_GR_QTGUI=3DOFF=
,qt4-x11-free qwt, "
> -
> -
> -inherit distutils-base cmake pkgconfig
> -
> -export BUILD_SYS
> -export HOST_SYS=3D"${MULTIMACH_TARGET_SYS}"
> -
> -RDEPENDS_${PN} =3D "python-core python-audio python-threading python-cod=
ecs \
> -                  python-lang python-textutils python-shell python-pickl=
e \
> -                  python-compiler python-pkgutil python-pydoc python-mma=
p \
> -                  python-netclient python-difflib \
> -                  python-pprint python-numpy  \
> -"
> -RDEPENDS_${PN}-grc =3D "python-pygtk python-lxml python-cheetah python-n=
etserver"
> -
> -C_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
> -
> -do_configure_prepend() {
> -    ${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S}/g=
r-vocoder/lib/generate_codebook -lm
> -    echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocoder/l=
ib/generate_codebook.txt
> -    echo "SET_PROPERTY(TARGET generate_codebook APPEND PROPERTY IMPORTED=
_CONFIGURATIONS RELEASE)" >>${S}/gr-vocoder/lib/generate_codebook.txt
> -    echo 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES IMPORTED_LO=
CATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")' >>${S}/gr-vocoder/=
lib/generate_codebook.txt
> -}
> -
> -do_compile_prepend() {
> -    cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-voco=
der/lib/codec2
> -}
> -
> -PACKAGES +=3D " \
> -    ${PN}-grc \
> -    ${PN}-examples \
> -"
> -
> -FILES_${PN}-grc =3D "${datadir}/gnuradio/grc"
> -FILES_${PN}-examples =3D "${datadir}/gnuradio/examples"
> -
> -FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio"
> -FILES_${PN} +=3D "${datadir}/gnuradio/modtool"
> -# The following needs fixing upstream
> -FILES_${PN} +=3D "${prefix}/etc/gnuradio"
> -
> -FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
> -                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
> -                    ${datadir}/gnuradio/examples/*/.debug \
> -"
> -
> -PV =3D "3.6.5"
> -
> -FILESPATHPKG_prepend =3D "gnuradio-git:"
> -
> -SRCREV =3D "a7b3a9339106aaba72195b693dfeaa98f194e0d5"
> -
> -# Make it easy to test against developer repos and branches
> -GIT_REPO =3D "gnuradio.git"
> -GIT_BRANCH =3D "master"
> -
> -SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH} \
> -           file://0001-gr-trellis-Kill-docs-hard.patch \
> -"
> -
> -S=3D"${WORKDIR}/git"
> -
> -OECMAKE_BUILDPATH =3D "${S}/build"
> -OECMAKE_SOURCEPATH =3D "${S}"
> -
> -EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
> -                 -DENABLE_GR_FCD=3DOFF \
> -                 -DENABLE_GR_WXGUI=3DOFF \
> -                 -DENABLE_GR_VIDEO_SDL=3DOFF \
> -                 -DENABLE_SPHINX=3DOFF -DENABLE_DOXYGEN=3DOFF \
> -                 -DIMPORT_EXECUTABLES=3D${S}/gr-vocoder/lib/generate_cod=
ebook.txt \
> -                 -DQT_HEADERS_DIR=3D${STAGING_INCDIR}/qt4 \
> -                 -DQT_QTCORE_INCLUDE_DIR=3D${STAGING_INCDIR}/qt4/QtCore \
> -                 -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
> -                 -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtCo=
re.so \
> -                 -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtGui=
=2Eso \
> -                 ${@base_contains('TUNE_FEATURES', 'neon', \
> -                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', d)}=
 \
> -"
> -
> -inherit distutils-base cmake pkgconfig
> -
> -EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
> -
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKGLZgACgkQN1Ujt2V2gBzANACgijQUDywVxJ6fYqLCoCtXkyKW
7RsAoJz7TGvtAj+ajqqvHMqcHdFOYusr
=2H5w
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
