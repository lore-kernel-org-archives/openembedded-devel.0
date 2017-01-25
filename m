Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6C7E71E52
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:02:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so43344057wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=q3Utitz5kUyPxwVPz3icRKBa2IIVNdixuKj5/du7ahQ=;
	b=ipQLUVilxZBFDMYdSjVjMX8BiCvb873Gk6rSzzOCkId4K/ROvDvqV28nX12EnA4fto
	hSjzgz56SZuEySHmTR/fBCS4AapPUMzqPVVCcHEz0CazF3LXqhcwDFPf0vumPEqVESsd
	u8RXOP6KvOcMlj3mOzEvl1W7wD9Ip3Ys570X1A+eNxUUqYeG+RiedT6bpC6CG2q9OtVw
	suYI+rOsFGlXY31YCcHdJJTeipv4aWZsKWcK/bfXofWQYPeUp5i9WFcbdxTLTuNqTW5W
	J42oszn74qnDjI0/L+2fhcCxeEQgqxkgGpjaygoluZtOLWAct6GhedchHig8VqJLnSGh
	8VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=q3Utitz5kUyPxwVPz3icRKBa2IIVNdixuKj5/du7ahQ=;
	b=sAXgJ71PvlZ2+xh4OkpbKbnhCT+FuDHSJ8lXQg/tAYTbGazASxOLrxtdVpVZqtW7ie
	1hi55NwbSeKTGqD6xX0GV1iHgs/KkyZzZuZvianQPNP/uwOq0jZZS+qbBxrUTqlTIeVv
	6jBCldXXqCxdL5WuLIax9Qv04GwjxSiBUKCluw83uZtHXzTXwrgi0S1TkjkmbUpt6v+q
	O4dH/dXTdGemGB/q7J1LUgkPdrbF0NpaVggyuf3zYm1Oimbe7d4ys5xBP8HwnJhMtQYI
	5bz3jMjl4F/9OxqtKZ4hxnwfKGAy8T5LApFEFvVTkbq0Bf+0A2Kv5TU/2iclaqFNVhAB
	D1xw==
X-Gm-Message-State: AIkVDXLhrZ9G8ql0DTXzuwEDNmbszPqXhzkx2D1vjnOiAUuL3h8/uXiRiGhRRmFj4DYZqw==
X-Received: by 10.28.142.16 with SMTP id q16mr22507956wmd.78.1485360125612;
	Wed, 25 Jan 2017 08:02:05 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e16sm25810209wra.36.2017.01.25.08.02.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 08:02:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 17:02:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170125160207.GF3260@jama>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
MIME-Version: 1.0
In-Reply-To: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Wed, 25 Jan 2017 16:02:08 -0000
X-Groupsio-MsgNum: 64853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline

--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2017 at 10:30:27AM +0200, Samuli Piippo wrote:
> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> the contents of an environment value when qmake is run instead of when
> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> for qmake to find them. configure's setBootstrapVariable function needs
> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>=20
> qt.conf generation for qtbase recipes is not needed, as configure will
> generate its own version based on configure arguments. Skip running
> qmake, since configure is now automatically invoked when it's run in
> qtbase's root folder.
>=20
> Update PACKAGECONFIGs for qtbase to match current configure options.
>=20
> The new Qt configuration system [1] can be used with a new variable
> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> arguments.
>=20
> Merge the two qtwayland recipes to one that supports all three targets
> (target, native, nativesdk) without need for additional patch.
>=20
> Recipes for new Qt modules: QtSCXML, QtNetworkAuth

It also adds qtgamepad and removes qtdeclarative-render2d

I'll update commit message in master-next.

> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>=20
> Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  classes/qmake5.bbclass                             |   4 -
>  classes/qmake5_base.bbclass                        |  96 ++++---
>  .../packagegroup-qt5-toolchain-target.bb           |   1 -
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |  93 +-----
>  .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  30 +-
>  recipes-qt/qt5/qt3d_git.bb                         |  27 +-
>  recipes-qt/qt5/qt5-git.inc                         |   6 +-
>  recipes-qt/qt5/qt5.inc                             |   4 +
>  recipes-qt/qt5/qtbase-native_git.bb                |  31 +-
>  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 314 ++++-----------=
------
>  ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  36 ---
>  .../0003-Add-external-hostbindir-option.patch      | 154 +---------
>  ...le-Fix-pkgconfig-and-libtool-replacements.patch |  10 +-
>  .../0006-QOpenGLPaintDevice-sub-area-support.patch | 154 ----------
>  ...Invert-conditional-for-defining-QT_SOCKLE.patch |  32 ---
>  ...configure-paths-for-target-qmake-properly.patch |  18 +-
>  ...-unknown-features-instead-of-erroring-out.patch |  28 ++
>  ...EGL-libraries-from-pkgconfig-and-defaults.patch |  95 -------
>  ...external-hostbindir-option-for-native-sdk.patch | 131 ---------
>  .../qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch  |  33 ---
>  recipes-qt/qt5/qtbase_git.bb                       |  90 ++----
>  recipes-qt/qt5/qtcanvas3d_git.bb                   |   8 +-
>  recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
>  recipes-qt/qt5/qtconnectivity_git.bb               |  11 +-
>  recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
>  recipes-qt/qt5/qtdeclarative-render2d_git.bb       |  12 -
>  .../0001-qmltestexample-fix-link.patch             |  72 -----
>  ...omparison-fix-QCoreApplication-has-not-be.patch |  25 --
>  ...crashes-in-QtQml-code-related-to-dead-sto.patch |  44 ---
>  recipes-qt/qt5/qtdeclarative_git.bb                |  16 +-
>  recipes-qt/qt5/qtenginio_git.bb                    |   3 +-
>  recipes-qt/qt5/qtgamepad_git.bb                    |  17 ++
>  recipes-qt/qt5/qtgraphicaleffects_git.bb           |  10 +-
>  ...ats.pro-Make-the-dependencies-determinist.patch |  28 --
>  recipes-qt/qt5/qtimageformats_git.bb               |  26 +-
>  recipes-qt/qt5/qtlocation_git.bb                   |  27 +-
>  ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  56 ----
>  recipes-qt/qt5/qtmultimedia_git.bb                 |  22 +-
>  recipes-qt/qt5/qtnetworkauth_git.bb                |  13 +
>  recipes-qt/qt5/qtquick1_git.bb                     |   4 +-
>  recipes-qt/qt5/qtquickcontrols2_git.bb             |   6 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb              |   8 +-
>  recipes-qt/qt5/qtscript_git.bb                     |   2 +-
>  ...Use-external-host-bin-path-for-cmake-file.patch |  28 ++
>  recipes-qt/qt5/qtscxml_git.bb                      |  22 ++
>  recipes-qt/qt5/qtsensors_git.bb                    |  10 +-
>  recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
>  recipes-qt/qt5/qtserialport_git.bb                 |  10 +-
>  recipes-qt/qt5/qtsvg_git.bb                        |   8 +-
>  ...w-to-build-only-lrelease-lupdate-lconvert.patch | 158 -----------
>  recipes-qt/qt5/qttools_git.bb                      |   7 +-
>  recipes-qt/qt5/qttranslations_git.bb               |   2 +-
>  recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   3 +-
>  recipes-qt/qt5/qtwayland-native_git.bb             |  32 ---
>  ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 ----------
>  ...-qtwaylandscanner-tool-to-the-native-side.patch |  29 --
>  ...yland-include-server-buffer-only-when-bui.patch |  27 --
>  recipes-qt/qt5/qtwayland_git.bb                    |  55 ++--
>  recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
>  recipes-qt/qt5/qtwebengine_git.bb                  |  26 +-
>  recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
>  recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
>  recipes-qt/qt5/qtwebsockets_git.bb                 |   8 +-
>  recipes-qt/qt5/qtx11extras_git.bb                  |  10 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
>  65 files changed, 437 insertions(+), 1965 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-=
qt.conf-from-the-outside-u.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-are=
a-support.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditio=
nal-for-defining-QT_SOCKLE.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0009-Disable-all-unknown-featur=
es-instead-of-erroring-out.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from=
-pkgconfig-and-defaults.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-op=
tion-for-native-sdk.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENG=
L.patch
>  delete mode 100644 recipes-qt/qt5/qtdeclarative-render2d_git.bb
>  delete mode 100644 recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-=
link.patch
>  delete mode 100644 recipes-qt/qt5/qtdeclarative/0002-qquickviewcompariso=
n-fix-QCoreApplication-has-not-be.patch
>  delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-=
in-QtQml-code-related-to-dead-sto.patch
>  create mode 100644 recipes-qt/qt5/qtgamepad_git.bb
>  delete mode 100644 recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro=
-Make-the-dependencies-determinist.patch
>  delete mode 100644 recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effo=
rt-to-GStreamer-1.0.patch
>  create mode 100644 recipes-qt/qt5/qtnetworkauth_git.bb
>  create mode 100644 recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-pat=
h-for-cmake-file.patch
>  create mode 100644 recipes-qt/qt5/qtscxml_git.bb
>  delete mode 100644 recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrele=
ase-lupdate-lconvert.patch
>  delete mode 100644 recipes-qt/qt5/qtwayland-native_git.bb
>  delete mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylan=
dIntegration-if-some-Qt5-feat.patch
>  delete mode 100644 recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandsc=
anner-tool-to-the-native-side.patch
>  delete mode 100644 recipes-qt/qt5/qtwayland/0001-examples-wayland-includ=
e-server-buffer-only-when-bui.patch
>=20
> diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
> index 2b43f2e..1a960e8 100644
> --- a/classes/qmake5.bbclass
> +++ b/classes/qmake5.bbclass
> @@ -17,7 +17,3 @@ do_install() {
>  do_install_class-native() {
>      qmake5_base_native_do_install
>  }
> -
> -do_install_class-nativesdk() {
> -    qmake5_base_nativesdk_do_install
> -}
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 70facca..50e5a30 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -30,27 +30,29 @@ EXTRA_OEMAKE =3D " \
>      OE_QMAKE_INCDIR_QT=3D'${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}=
' \
>  "
> =20
> -OE_QMAKESPEC =3D "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFOR=
M_NATIVE}"
> -OE_XQMAKESPEC =3D "${QMAKE_MKSPEC_PATH}/mkspecs/${OE_QMAKE_PLATFORM}"
>  OE_QMAKE_QMAKE =3D "${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake"
> -OE_QMAKE_COMPILER =3D "${CC}"
> -OE_QMAKE_CC =3D "${CC}"
> -OE_QMAKE_CFLAGS =3D "${CFLAGS}"
> -OE_QMAKE_CXX =3D "${CXX}"
> -OE_QMAKE_CXXFLAGS =3D "${CXXFLAGS}"
> -OE_QMAKE_LINK =3D "${CXX}"
> -OE_QMAKE_LDFLAGS =3D "${LDFLAGS}"
> -OE_QMAKE_AR =3D "${AR}"
> -OE_QMAKE_STRIP =3D "echo"
> -OE_QMAKE_WAYLAND_SCANNER =3D "${STAGING_BINDIR_NATIVE}/wayland-scanner"
> -
> -# this one needs to be exported, because qmake reads it from shell env
> -export QT_CONF_PATH =3D "${WORKDIR}/qt.conf"
> +export OE_QMAKE_COMPILER =3D "${CC}"
> +export OE_QMAKE_CC =3D "${CC}"
> +export OE_QMAKE_CFLAGS =3D "${CFLAGS}"
> +export OE_QMAKE_CXX =3D "${CXX}"
> +export OE_QMAKE_CXXFLAGS =3D "${CXXFLAGS}"
> +export OE_QMAKE_LINK =3D "${CXX}"
> +export OE_QMAKE_LDFLAGS =3D "${LDFLAGS}"
> +export OE_QMAKE_AR =3D "${AR}"
> +export OE_QMAKE_STRIP =3D "echo"
> +export OE_QMAKE_WAYLAND_SCANNER =3D "${STAGING_BINDIR_NATIVE}/wayland-sc=
anner"
> +OE_QMAKE_QTCONF_PATH =3D "${WORKDIR}/qt.conf"
> +export OE_QMAKE_QTCONF =3D "-qtconf ${OE_QMAKE_QTCONF_PATH}"
> =20
>  inherit qmake5_paths remove-libtool
> =20
>  do_generate_qt_config_file() {
> -    cat > ${QT_CONF_PATH} <<EOF
> +    generate_qt_config_file_paths
> +    generate_qt_config_file_effective_paths
> +}
> +
> +generate_qt_config_file_paths() {
> +    cat > ${OE_QMAKE_QTCONF_PATH} <<EOF
>  [Paths]
>  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
>  Headers =3D ${OE_QMAKE_PATH_HEADERS}
> @@ -70,12 +72,21 @@ Tests =3D ${OE_QMAKE_PATH_TESTS}
>  HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
>  HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
>  HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
> -HostSpec =3D ${OE_QMAKESPEC}
> -TartgetSpec =3D ${OE_XQMAKESPEC}=20
> +HostSpec =3D ${OE_QMAKE_PLATFORM_NATIVE}
> +TargetSpec =3D ${OE_QMAKE_PLATFORM}
>  ExternalHostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
>  Sysroot =3D ${STAGING_DIR_TARGET}
>  EOF
>  }
> +
> +generate_qt_config_file_effective_paths() {
> +    cat >> ${OE_QMAKE_QTCONF_PATH} <<EOF
> +[EffectivePaths]
> +HostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
> +HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
> +HostPrefix =3D ${STAGING_DIR_NATIVE}${prefix_native}
> +EOF
> +}
>  #
>  # Allows to override following values (as in version 5.0.1)
>  # Prefix The default prefix for all paths.
> @@ -151,11 +162,16 @@ qmake5_base_do_configure () {
>          bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
>      fi
> =20
> +    if [ ! -z "${EXTRA_QMAKEVARS_CONFIGURE}" ]; then
> +        QMAKE_VARSUBST_CONFIGURE=3D"${EXTRA_QMAKEVARS_CONFIGURE}"
> +        bbnote "qmake configure substitution: '${EXTRA_QMAKEVARS_CONFIGU=
RE}'"
> +    fi
> +
>      # for config.tests to read this
>      export QMAKE_MAKE_ARGS=3D"${EXTRA_OEMAKE}"
> =20
> -    CMD=3D"${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTP=
UT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSU=
BST_POST"
> -    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${O=
E_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POS=
T || die "Error calling $CMD"
> +    CMD=3D"${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${=
OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PR=
OFILES $QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE"
> +    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${OE_QMAK=
E_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES =
$QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE || die "Error calling $CM=
D"
>  }
> =20
>  qmake5_base_native_do_install() {
> @@ -166,37 +182,37 @@ qmake5_base_native_do_install() {
>      fi
>  }
> =20
> -qmake5_base_nativesdk_do_install() {
> -    # Fix install paths for all
> -    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGIN=
G_DIR_HOST},(INSTALL_ROOT),g"
> -
> -    oe_runmake install INSTALL_ROOT=3D${D}
> -    if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
> -        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgc=
onfig/Qt5*.pc
> +qmake5_base_fix_install() {
> +    STAGING_PATH=3D$1
> +    if [ -d ${D}${STAGING_PATH} ] ; then
> +        echo "Some files are installed in wrong directory ${D}${STAGING_=
PATH}"
> +        cp -ra ${D}${STAGING_PATH}/* ${D}
> +        rm -rf ${D}${STAGING_PATH}
> +        # remove empty dirs
> +        TMP=3D`dirname ${D}${STAGING_PATH}`
> +        while test ${TMP} !=3D ${D}; do
> +            rmdir ${TMP}
> +            TMP=3D`dirname ${TMP}`;
> +        done
>      fi
>  }
> =20
>  qmake5_base_do_install() {
>      # Fix install paths for all
>      find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGIN=
G_DIR_TARGET},(INSTALL_ROOT),g"
> +    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGIN=
G_DIR_HOST},(INSTALL_ROOT),g"
> +    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGIN=
G_DIR_NATIVE},(INSTALL_ROOT),g"
> =20
>      oe_runmake install INSTALL_ROOT=3D${D}
> =20
>      # everything except HostData and HostBinaries is prefixed with sysro=
ot value,
>      # but we cannot remove sysroot override, because that's useful for p=
kg-config etc
> -    # In some cases like QtQmlDevTools in qtdeclarative, the sed above d=
oes not work,
> -    # fix them manually
> -    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
> -        echo "Some files are installed in wrong directory ${D}${STAGING_=
DIR_TARGET}"
> -        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> -        rm -rf ${D}${STAGING_DIR_TARGET}
> -        # remove empty dirs
> -        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> -        while test ${TMP} !=3D ${D}; do
> -            rmdir ${TMP}
> -            TMP=3D`dirname ${TMP}`;
> -        done
> -    fi
> +    # concurrent builds may cause qmake to regenerate Makefiles and over=
ride the above
> +    # sed changes. If that happens, move files manually to correct locat=
ion.
> +    qmake5_base_fix_install ${STAGING_DIR_TARGET}
> +    qmake5_base_fix_install ${STAGING_DIR_HOST}
> +    qmake5_base_fix_install ${STAGING_DIR_NATIVE}
> +
>      if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
>          sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgc=
onfig/Qt5*.pc
>      fi
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.b=
b b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index 25bc530..1521dbf 100755
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -53,7 +53,6 @@ RDEPENDS_${PN} +=3D " \
>      qttranslations-qtconnectivity \
>      qtdeclarative-dev \
>      qtdeclarative-mkspecs \
> -    qtdeclarative-plugins \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qml=
plugins', '', d)} \
>      qtdeclarative-tools \
>      qtdeclarative-staticdev \
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index dce78fc..7d2ce58 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -27,21 +27,17 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> -    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>      file://0008-configure-paths-for-target-qmake-properly.patch \
> -    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
> +    file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch \
>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
>      file://0011-Always-build-uic.patch \
> -    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
> =20
>  # CMake's toolchain configuration of nativesdk-qtbase
> @@ -58,10 +54,11 @@ FILES_${PN}-tools-dev =3D " \
>      ${FILES_SOLIBSDEV} ${libdir}/*.la \
>      ${libdir}/*.prl \
>      ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
> +    ${OE_QMAKE_PATH_LIBS}/*.prl \
>  "
> =20
>  FILES_${PN}-tools-staticdev =3D " \
> -    ${libdir}/libQt5Bootstrap.a \
> +    ${OE_QMAKE_PATH_LIBS}/*.a \
>  "
> =20
>  FILES_${PN}-tools-dbg =3D " \
> @@ -95,71 +92,10 @@ QT_CONFIG_FLAGS +=3D " \
>  OE_QMAKE_PATH_HOST_DATA =3D "${libdir}${QT_DIR_NAME}"
>  OE_QMAKE_PATH_HOST_LIBS =3D "${libdir}"
> =20
> -do_generate_qt_config_file() {
> -    cat > ${QT_CONF_PATH} <<EOF
> -[Paths]
> -Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> -Libraries =3D ${OE_QMAKE_PATH_LIBS}
> -ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
> -Data =3D ${OE_QMAKE_PATH_DATA}
> -Binaries =3D ${OE_QMAKE_PATH_BINS}
> -LibraryExecutables =3D ${OE_QMAKE_PATH_LIBEXECS}
> -Plugins =3D ${OE_QMAKE_PATH_PLUGINS}
> -Imports =3D ${OE_QMAKE_PATH_IMPORTS}
> -Qml2Imports =3D ${OE_QMAKE_PATH_QML}
> -Translations =3D ${OE_QMAKE_PATH_TRANSLATIONS}
> -Documentation =3D ${OE_QMAKE_PATH_DOCS}
> -Settings =3D ${OE_QMAKE_PATH_SETTINGS}
> -Examples =3D ${OE_QMAKE_PATH_EXAMPLES}
> -Tests =3D ${OE_QMAKE_PATH_TESTS}
> -HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
> -HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
> -HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
> -HostSpec =3D ${OE_QMAKESPEC}
> -TartgetSpec =3D ${OE_XQMAKESPEC}
> -ExternalHostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
> -Sysroot =3D
> -EOF
> -}
> -
> -do_generate_qt_config_file_append() {
> -    cat >> ${QT_CONF_PATH} <<EOF
> -
> -[EffectivePaths]
> -Prefix=3D..
> -EOF
> -}
> -
> -# qtbase is exception, we need to use mkspecs from ${S}
> -QMAKE_MKSPEC_PATH =3D "${B}"
> -
> -# qtbase is exception, configure script is using our get(X)QEvalMakeConf=
 and setBootstrapEvalVariable functions to read it from shell
> -export OE_QMAKE_COMPILER
> -export OE_QMAKE_CC
> -export OE_QMAKE_CFLAGS
> -export OE_QMAKE_CXX
> -export OE_QMAKE_CXXFLAGS
> -export OE_QMAKE_LINK
> -export OE_QMAKE_LDFLAGS
> -export OE_QMAKE_AR
> -export OE_QMAKE_STRIP
> -
> -# another exception is that we need to run bin/qmake, because EffectiveP=
aths are relative to qmake location
> -OE_QMAKE_QMAKE_ORIG :=3D "${OE_QMAKE_QMAKE}"
> -OE_QMAKE_QMAKE =3D "bin/qmake"
> -
>  do_configure() {
> -    # we need symlink in path relative to source, because
> -    # EffectivePaths:Prefix is relative to qmake location
> -    if [ ! -e ${B}/bin/qmake ]; then
> -        mkdir -p ${B}/bin
> -        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
> -    fi
> -
>      ${S}/configure -v \
>          -opensource -confirm-license \
> -        -sysroot ${STAGING_DIR_NATIVE} \
> +        -sysroot ${STAGING_DIR_TARGET} \
>          -no-gcc-sysroot \
>          -system-zlib \
>          -dbus-runtime \
> @@ -193,33 +129,22 @@ do_configure() {
>          -testsdir ${OE_QMAKE_PATH_TESTS} \
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
>          -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
> +        -host-option CROSS_COMPILE=3D${HOST_PREFIX} \
>          -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
>          -no-glib \
>          -no-iconv \
>          -silent \
>          -nomake examples \
>          -nomake tests \
> -        -nomake libs \
>          -no-compile-examples \
>          -no-rpath \
> -        -platform ${OE_QMAKESPEC} \
> -        -xplatform linux-oe-g++ \
> +        -platform ${OE_QMAKE_PLATFORM_NATIVE} \
> +        -xplatform ${OE_QMAKE_PLATFORM} \
>          ${QT_CONFIG_FLAGS}
> -
> -    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configur=
ing qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFAR=
GS}"
>  }
> =20
>  do_install() {
> -    # Fix install paths for all
> -    find . -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_D=
IR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> -
> -    oe_runmake install INSTALL_ROOT=3D${D}
> -
> -    install -m 755 ${B}/bin/qmake-target ${D}${OE_QMAKE_PATH_HOST_BINS}/=
qmake
> -
> -    # for modules which are still using syncqt and call qtPrepareTool(QM=
AKE_SYNCQT, syncqt)
> -    # e.g. qt3d, qtwayland
> -    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> +    qmake5_base_do_install
> =20
>      # remove things unused in nativesdk, we need the headers and libs
>      rm -rf ${D}${datadir} \
> @@ -262,4 +187,4 @@ fakeroot do_generate_qt_environment_file() {
> =20
>  addtask generate_qt_environment_file after do_install before do_package
> =20
> -SRCREV =3D "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
> +SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/re=
cipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> index bb337fd..b19f963 100644
> --- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> +++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> @@ -1,23 +1,24 @@
> -From befe1fd63c485b8d10d1b9f1eca3368f3ee0042b Mon Sep 17 00:00:00 2001
> +From 64f46f5399627430f9ce1a888fb9212b33977231 Mon Sep 17 00:00:00 2001
>  From: Samuli Piippo <samuli.piippo@theqtcompany.com>
>  Date: Wed, 10 Feb 2016 09:02:09 +0200
>  Subject: [PATCH] Allow a tools-only build
> =20
>  ---
> - qt3d.pro | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> + qt3d.pro                                  | 7 ++++++-
> + src/3rdparty/assimp/assimp_dependency.pri | 2 +-
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> =20
>  diff --git a/qt3d.pro b/qt3d.pro
> -index a26e76d..016fb30 100644
> +index 2cc347a..81cdeef 100644
>  --- a/qt3d.pro
>  +++ b/qt3d.pro
>  @@ -1,4 +1,4 @@
> --requires(contains(QT_CONFIG, opengl))
> -+!tools-only:requires(contains(QT_CONFIG, opengl))
> +-requires(qtConfig(opengl))
> ++!tools-only:requires(qtConfig(opengl))
>  =20
> - load(configure)
> - qtCompileTest(assimp)
> -@@ -17,3 +17,8 @@ load(qt_parts)
> + CONFIG +=3D examples_need_tools
> + load(qt_parts)
> +@@ -14,3 +14,8 @@ load(qt_parts)
>  =20
>   OTHER_FILES +=3D \
>       sync.profile
> @@ -26,3 +27,14 @@ index a26e76d..016fb30 100644
>  +    sub_tools.depends -=3D sub_src
>  +    SUBDIRS =3D sub_tools
>  +}
> +diff --git a/src/3rdparty/assimp/assimp_dependency.pri b/src/3rdparty/as=
simp/assimp_dependency.pri
> +index 8ba2d9a..e973d93 100644
> +--- a/src/3rdparty/assimp/assimp_dependency.pri
> ++++ b/src/3rdparty/assimp/assimp_dependency.pri
> +@@ -1,5 +1,5 @@
> + QT_FOR_CONFIG +=3D 3dcore-private
> +-qtConfig(system-assimp):!if(cross_compile:host_build) {
> ++!tools-only:qtConfig(system-assimp):!if(cross_compile:host_build) {
> +     QMAKE_USE_PRIVATE +=3D assimp
> + } else {
> +     include(assimp.pri)
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 9708ec9..f39208a 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -3,9 +3,9 @@ require qt5-git.inc
> =20
>  LICENSE =3D "LGPL-3.0 | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv3;md5=3D3dcffeed712d3c916f9a2d9135703aff \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> -    file://LICENSE.GPL;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.LGPLv3;md5=3D8211fde12cc8a4e2477602f5953f5b71 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> +    file://LICENSE.GPL;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> @@ -18,15 +18,22 @@ SRC_URI +=3D " \
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG_class-native ??=3D "tools-only"
>  PACKAGECONFIG_class-nativesdk ??=3D "tools-only"
> -PACKAGECONFIG[tools-only] =3D "CONFIG+=3Dtools-only"
> +PACKAGECONFIG[tools-only] =3D ""
> +PACKAGECONFIG[system-assimp] =3D "-feature-system-assimp,-no-feature-sys=
tem-assimp,assimp"
> +PACKAGECONFIG[qtgamepad] =3D ",,qtgamepad"
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
> -FILES_${PN}-qmlplugins +=3D " \
> -    ${OE_QMAKE_PATH_QML}/*/*/*.bez \
> -    ${OE_QMAKE_PATH_QML}/*/*/*.obj \
> -"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tools-o=
nly', 'CONFIG+=3Dtools-only QMAKE_USE_PRIVATE+=3Dzlib', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtgamep=
ad', 'CONFIG+=3DOE_QTGAMEPAD_ENABLED', '', d)}"
> +
> +do_configure_prepend() {
> +    # disable qtgamepad test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/^\(qtHaveModule(gamepad)\)/OE_QTGAMEPAD_ENABLED:\1/' -i \
> +         ${S}/src/input/frontend/frontend.pri \
> +         ${S}/src/quick3d/imports/input/importsinput.pro
> +}
> =20
> -SRCREV =3D "c3fdb888fbd94de0f6b7b1a6859cba8132ecc93d"
> +SRCREV =3D "440589a0747d9668fec3ff924b390d75be5c6733"
> =20
>  BBCLASSEXTEND +=3D "native nativesdk"
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index e1e25ba..f864953 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -2,8 +2,8 @@
>  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> =20
>  QT_MODULE ?=3D "${BPN}"
> -QT_MODULE_BRANCH ?=3D "5.7"
> -QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH}"
> +QT_MODULE_BRANCH ?=3D "5.8"
> +QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH};nobranch=3D1"
> =20
>  # each module needs to define valid SRCREV
>  SRC_URI =3D " \
> @@ -12,4 +12,4 @@ SRC_URI =3D " \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -PV =3D "5.7.0+git${SRCPV}"
> +PV =3D "5.8.0+git${SRCPV}"
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index b066dde..90d7896 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -6,7 +6,9 @@ inherit qmake5
>  PACKAGECONFIG_OPENSSL ?=3D "openssl"
> =20
>  PACKAGECONFIG[examples] =3D ""
> +PACKAGECONFIG[tests] =3D ""
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'example=
s', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tests',=
 'QT_BUILD_PARTS+=3Dtests', '', d)}"
> =20
>  # we don't want conflicts with qt4
>  OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"
> @@ -103,11 +105,13 @@ FILES_${PN}-qmlplugins =3D " \
>      ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*.qml \
>      ${OE_QMAKE_PATH_QML}/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*.png \
>      ${OE_QMAKE_PATH_QML}/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*/*.qml \
>      ${OE_QMAKE_PATH_QML}/*/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*/*.png \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*/*/images \
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index 4da5640..ba1be2c 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -22,33 +22,22 @@ require qt5-git.inc
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> -    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>      file://0008-configure-paths-for-target-qmake-properly.patch \
> -    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
> +    file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch \
>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
>      file://0011-Always-build-uic.patch \
> -    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
> =20
>  CLEANBROKEN =3D "1"
> =20
> -QT_CONF_PATH =3D "${B}/qt.conf"
> -
> -do_generate_qt_config_file() {
> -    :
> -}
> -
>  PACKAGECONFIG_CONFARGS =3D " \
> -    -prefix ${prefix} \
>      -sysroot ${STAGING_DIR_NATIVE} \
>      -no-gcc-sysroot \
>      -system-zlib \
> @@ -68,11 +57,15 @@ PACKAGECONFIG_CONFARGS =3D " \
>      -verbose \
>      -release \
>      -prefix ${OE_QMAKE_PATH_PREFIX} \
> +    -hostprefix ${OE_QMAKE_PATH_PREFIX} \
>      -bindir ${OE_QMAKE_PATH_BINS} \
> +    -hostbindir ${OE_QMAKE_PATH_BINS} \
>      -libdir ${OE_QMAKE_PATH_LIBS} \
> +    -hostlibdir ${OE_QMAKE_PATH_LIBS} \
>      -headerdir ${OE_QMAKE_PATH_HEADERS} \
>      -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
>      -datadir ${OE_QMAKE_PATH_DATA} \
> +    -hostdatadir ${QMAKE_MKSPEC_PATH_NATIVE} \
>      -docdir ${OE_QMAKE_PATH_DOCS} \
>      -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
>      -no-glib \
> @@ -84,20 +77,8 @@ PACKAGECONFIG_CONFARGS =3D " \
>      -platform linux-oe-g++ \
>  "
> =20
> -# qtbase is exception, configure script is using our get(X)QEvalMakeConf=
 and setBootstrapEvalVariable functions to read it from shell
> -export OE_QMAKE_COMPILER
> -export OE_QMAKE_CC
> -export OE_QMAKE_CFLAGS
> -export OE_QMAKE_CXX
> -export OE_QMAKE_CXXFLAGS
> -export OE_QMAKE_LINK
> -export OE_QMAKE_LDFLAGS
> -export OE_QMAKE_AR
> -export OE_QMAKE_STRIP
> -
>  do_configure_prepend() {
>      MAKEFLAGS=3D"${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-l=
icense ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONF=
IG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
> -    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configur=
ing qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFAR=
GS}"
>  }
> =20
>  do_install() {
> @@ -123,4 +104,4 @@ do_install() {
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
>  }
> =20
> -SRCREV =3D "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
> +SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index b28ca8b..df2016e 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -1,4 +1,4 @@
> -From d6c75f788e15fb552eacb08359698a1342a97f20 Mon Sep 17 00:00:00 2001
> +From 2784921c40d0b523c75e613e48b7fd1e90ba3ef1 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Mon, 15 Apr 2013 04:29:32 +0200
>  Subject: [PATCH] Add linux-oe-g++ platform
> @@ -7,176 +7,53 @@ Subject: [PATCH] Add linux-oe-g++ platform
>    shell environment, because it's easier for qt recipes to export
>    *FLAGS or CC specific for given recipe
> =20
> -* configure: add getQEvalMakeConf and getXQEvalMakeConf
> -  Allow expansion of $(...) references from qmake.conf to generate
> -  qmake environment from shell environment as exported by qmake5_base
> -
> -* configure: don't export SYSTEM_VARIABLES to .qmake.vars
> -  linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LI=
NK is
> -  causing issues as we need g++ to be used as linker
> +* configure: extend setBootstrapVariable to convert $$(...) operator
> +  to $(...) operator to work in qmake's Makefiles
> =20
>  * configure.prf: Allow to add extra arguments to make
>    sometimes we would like to add -e or define some variable and respect =
it from both
>    Makefiles used in configure tests and also Makefiles to build the appl=
ication
> =20
> -* OE_QMAKE_CXX in order to allow compiler version check to succeed
> -  which allows WebKit to be enabled.
> -
> -* Other variables in order to let config.tests to use our -platform
> -  settings
> -
> -* Add setBootstrapEvalVariable to bootstrap qmake with our environment
> -  too, this allows us to use -platform linux-oe-g++ also for native
> -  recipe
> -
> -* disable gdb_dwarf_index
> -  * qmake is trying to call native gdb and we don't depend on gdb-native
> -    (or even provide gdb-native)
> -  * fixes errors like this:
> -    /bin/sh: gdb: command not found
> -    /bin/sh: line 0: test: -gt: unary operator expected
> -    which are not fatal, but still misleading in do_configure output
> -
> -* add -target suffix to qmake built in qtbase configure, this way we can
> -  use qmake from qtbase-native, but then include qmake built for target
> -  in qtbase-tools package (smilarly for nativesdk-qtbase).
> -
>  Upstream-Status: Inappropriate [embedded specific]
>                   too OE specific, probably cannot be upstreamed
> =20
>  Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
> - configure                            |  55 ++++++++++++-------
> - mkspecs/features/configure.prf       |   4 +-
> - mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
> - mkspecs/linux-oe-g++/qplatformdefs.h | 100 ++++++++++++++++++++++++++++=
+++++++
> - 4 files changed, 181 insertions(+), 20 deletions(-)
> + configure                            |  2 +-
> + mkspecs/features/configure.prf       |  4 ++--
> + mkspecs/features/qt_functions.prf    |  2 +-
> + mkspecs/linux-oe-g++/qmake.conf      | 43 +++++++++++++++++++++++++++++=
+++++++
> + mkspecs/linux-oe-g++/qplatformdefs.h |  1 +
> + 5 files changed, 48 insertions(+), 4 deletions(-)
>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> =20
>  diff --git a/configure b/configure
> -index 0ba0c31..052872e 100755
> +index 789ba4c..59cce01 100755
>  --- a/configure
>  +++ b/configure
> -@@ -333,6 +333,16 @@ getQMakeConf()
> -     getSingleQMakeVariable "$1" "$specvals"
> - }
> -=20
> -+# OE qmake.conf is reading some variables from shell env
> -+# read them from qmake.conf, replace qmake () syntax with shell and eval
> -+getQEvalMakeConf()
> -+{
> -+    VAL=3D`getQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/p=
g'`
> -+    EVAL=3D`eval "echo ${VAL}"`
> -+#    echo "Running getQEvalMakeConf: var=3D'$1', val=3D'`getQMakeConf \=
"$1\"`, val-sed=3D'$VAL', eval=3D'$EVAL'" >&2
> -+    eval "echo ${VAL}"
> -+}
> -+
> - getXQMakeConf()
> +@@ -1624,7 +1624,7 @@ fi
> + # is where the resulting variable is written to
> + setBootstrapVariable()
>   {
> -     if [ -z "$xspecvals" ]; then
> -@@ -357,6 +367,16 @@ testXConfig()
> -     esac
> - }
> -=20
> -+# OE qmake.conf is reading some variables from shell env
> -+# read them from qmake.conf, replace qmake () syntax with shell and eval
> -+getXQEvalMakeConf()
> -+{
> -+    VAL=3D`getXQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/=
pg'`
> -+    EVAL=3D`eval "echo ${VAL}"`
> -+#    echo "Running getXQEvalMakeConf: var=3D'$1', val=3D'`getXQMakeConf=
 \"$1\"`, val-sed=3D'$VAL', eval=3D'$EVAL'" >&2
> -+    eval "echo ${VAL}"
> -+}
> -+
> - compilerSupportsFlag()
> - {
> -     cat >conftest.cpp <<EOF
> -@@ -578,24 +598,14 @@ fi
> - # initalize variables
> - #----------------------------------------------------------------------=
---------
> -=20
> --SYSTEM_VARIABLES=3D"AR RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS L=
DFLAGS"
> --for varname in $SYSTEM_VARIABLES; do
> -+# Export all OE variables for qmake.conf from shell env to QMakeVars
> -+OE_VARIABLES=3D"AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONF=
IG STRIP"
> -+for varname in $OE_VARIABLES; do
> -     qmakevarname=3D"${varname}"
> --    qmakecmdargs=3D""
> --    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
> --    if [ "${varname}" =3D "LDFLAGS" ]; then
> --        qmakevarname=3D"LFLAGS"
> --    elif [ "${varname}" =3D "LD" ]; then
> --        qmakevarname=3D"LINK"
> --    elif [ "${varname}" =3D "AR" ]; then
> --        # QMAKE_AR needs to be set to "/path/to/ar cqs" but the
> --        # environment variable will be set to the command only so we
> --        # need to append " cqs" for autoconf compatibility
> --        qmakecmdargs=3D" cqs"
> --    fi
> -     cmd=3D`echo \
> --'if [ -n "\$'${varname}'" ]; then
> --    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}${qmakecmdargs}'"
> -+'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
> -+    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
> -+#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=3D\"\$OE_QMAKE_'$=
{varname}'\"" >&2
> - fi'`
> -     eval "$cmd"
> - done
> -@@ -3443,7 +3453,7 @@ if [ "$XPLATFORM_MAC" =3D "yes" ]; then
> -     [ "$CFG_GTK" =3D "auto" ] && CFG_GTK=3Dno
> - fi
> -=20
> --QMAKE_CONF_COMPILER=3D`getXQMakeConf QMAKE_CXX`
> -+QMAKE_CONF_COMPILER=3D`getXQEvalMakeConf QMAKE_CXX`
> -=20
> - TEST_COMPILER=3D$QMAKE_CONF_COMPILER
> -=20
> -@@ -3494,7 +3504,7 @@ if [ "$XPLATFORM_ANDROID" =3D "yes" ] ; then
> -     fi
> - fi
> -=20
> --TEST_COMPILER_CXXFLAGS=3D`getXQMakeConf QMAKE_CXXFLAGS`
> -+TEST_COMPILER_CXXFLAGS=3D`getXQEvalMakeConf QMAKE_CXXFLAGS`
> -=20
> - GCC_MACHINE_DUMP=3D
> - case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=3D$($TEST_COMPILER -dum=
pmachine);; esac
> -@@ -3893,6 +3903,14 @@ setBootstrapVariable()
> -     getQMakeConf "$1" | echo ${2-$1} =3D `if [ -n "$3" ]; then sed "$3"=
; else cat; fi` >> "$mkfile"
> +-    getQMakeConf "$1" | echo ${2-$1} =3D `if [ -n "$3" ]; then sed "$3"=
; else cat; fi` >> "$mkfile"
> ++    getQMakeConf "$1" | sed 's:\$\$(:\$(:' | echo ${2-$1} =3D `if [ -n =
"$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
>   }
>  =20
> -+# OE qmake.conf is reading some variables from shell env
> -+# read them from qmake.conf, replace qmake () syntax with shell and eval
> -+setBootstrapEvalVariable()
> -+{
> -+    getQEvalMakeConf "$1" | echo ${2-$1} =3D `if [ -n "$3" ]; then sed =
"$3"; else cat; fi` >> "$mkfile"
> -+}
> -+
> -+
>   # build qmake
> - if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> -     echo "Creating qmake..."
> -@@ -3986,6 +4004,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> -             EXEEXT=3D
> -             ;;
> -         esac
> -+        [ "$QT_CROSS_COMPILE" =3D "yes" ] && EXEEXT=3D-target
> -         if [ "$BUILD_ON_MAC" =3D "yes" ]; then
> -             echo "COCOA_LFLAGS =3D-framework Foundation -framework Core=
Services" >>"$mkfile"
> -             echo "CARBON_LFLAGS =3D-framework ApplicationServices" >>"$=
mkfile"
>  diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure=
=2Eprf
> -index a890c7f..151630c 100644
> +index f275e3a..5aa15f5 100644
>  --- a/mkspecs/features/configure.prf
>  +++ b/mkspecs/features/configure.prf
> -@@ -71,14 +71,14 @@ defineTest(qtCompileTest) {
> +@@ -37,14 +37,14 @@ defineTest(qtCompileTest) {
>       }
>  =20
>       # Clean up after previous run
>  -    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base=
 $$QMAKE_MAKE distclean")
>  +    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base=
 $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
>  =20
> -     mkpath($$test_out_dir)|error("Aborting.")
> +     mkpath($$test_out_dir)|error()
>  =20
>       !isEmpty (QMAKE_QTCONF): qtconfarg =3D -qtconf $$QMAKE_QTCONF
>  =20
> @@ -186,157 +63,72 @@ index a890c7f..151630c 100644
>               log("yes$$escape_expand(\\n)")
>               msg =3D "test $$1 succeeded"
>               write_file($$QMAKE_CONFIG_LOG, msg, append)
> +diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_fun=
ctions.prf
> +index 708815d..097ac49 100644
> +--- a/mkspecs/features/qt_functions.prf
> ++++ b/mkspecs/features/qt_functions.prf
> +@@ -67,7 +67,7 @@ defineTest(qtHaveModule) {
> + defineTest(qtPrepareTool) {
> +     cmd =3D $$eval(QT_TOOL.$${2}.binary)
> +     isEmpty(cmd) {
> +-        cmd =3D $$[QT_HOST_BINS]/$$2
> ++        cmd =3D $$[QT_HOST_BINS/get]/$$2
> +         exists($${cmd}.pl) {
> +             $${1}_EXE =3D $${cmd}.pl
> +             cmd =3D perl -w $$system_path($${cmd}.pl)
>  diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmak=
e.conf
>  new file mode 100644
> -index 0000000..311ba04
> +index 0000000..c1837e6
>  --- /dev/null
>  +++ b/mkspecs/linux-oe-g++/qmake.conf
> -@@ -0,0 +1,42 @@
> +@@ -0,0 +1,43 @@
>  +#
>  +# qmake configuration for linux-g++ with modifications for building wit=
h OpenEmbedded
>  +#
>  +
> -+MAKEFILE_GENERATOR	=3D UNIX
> ++MAKEFILE_GENERATOR =3D UNIX
>  +CONFIG +=3D incremental
>  +QMAKE_INCREMENTAL_STYLE =3D sublib
>  +
>  +include(../common/linux.conf)
>  +
>  +# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
> -+QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
> -+QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
> -+QMAKE_WAYLAND_SCANNER =3D $(OE_QMAKE_WAYLAND_SCANNER)
> ++QMAKE_AR              =3D $$(OE_QMAKE_AR) cqs
> ++QMAKE_STRIP           =3D $$(OE_QMAKE_STRIP)
> ++QMAKE_WAYLAND_SCANNER =3D $$(OE_QMAKE_WAYLAND_SCANNER)
>  +
>  +include(../common/gcc-base-unix.conf)
>  +
>  +# *FLAGS from gcc-base.conf
> -+QMAKE_CFLAGS                +=3D $(OE_QMAKE_CFLAGS)
> -+QMAKE_CXXFLAGS              +=3D $(OE_QMAKE_CXXFLAGS)
> -+QMAKE_LFLAGS                +=3D $(OE_QMAKE_LDFLAGS)
> ++QMAKE_CFLAGS                +=3D $$(OE_QMAKE_CFLAGS)
> ++QMAKE_CXXFLAGS              +=3D $$(OE_QMAKE_CXXFLAGS)
> ++QMAKE_LFLAGS                +=3D $$(OE_QMAKE_LDFLAGS)
>  +
>  +include(../common/g++-unix.conf)
>  +
>  +# tc settings from g++-base.conf
> -+QMAKE_COMPILER =3D $(OE_QMAKE_COMPILER) gcc
> -+QMAKE_CC       =3D $(OE_QMAKE_CC)
> -+QMAKE_CXX      =3D $(OE_QMAKE_CXX)
> ++QMAKE_COMPILER =3D $$(OE_QMAKE_COMPILER) gcc
> ++QMAKE_CC       =3D $$(OE_QMAKE_CC)
> ++QMAKE_CXX      =3D $$(OE_QMAKE_CXX)
>  +
> -+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $(OE_QMAKE_CFLAGS)
> ++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $$(OE_QMAKE_CFLAGS)
>  +
> -+QMAKE_LINK         =3D $(OE_QMAKE_LINK)
> -+QMAKE_LINK_SHLIB   =3D $(OE_QMAKE_LINK)
> -+QMAKE_LINK_C       =3D $(OE_QMAKE_LINK)
> -+QMAKE_LINK_C_SHLIB =3D $(OE_QMAKE_LINK)
> ++QMAKE_LINK         =3D $$(OE_QMAKE_LINK)
> ++QMAKE_LINK_SHLIB   =3D $$(OE_QMAKE_LINK)
> ++QMAKE_LINK_C       =3D $$(OE_QMAKE_LINK)
> ++QMAKE_LINK_C_SHLIB =3D $$(OE_QMAKE_LINK)
>  +
>  +# for the SDK
> -+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
> ++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $$(OE_QMAKE_QT_CONFIG)
>  +
>  +include(../oe-device-extra.pri)
>  +
> ++load(device_config)
>  +load(qt_config)
>  diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
>  new file mode 100644
> -index 0000000..dd12003
> +index 0000000..5d22fb4
>  --- /dev/null
>  +++ b/mkspecs/linux-oe-g++/qplatformdefs.h
> -@@ -0,0 +1,100 @@
> -+/**********************************************************************=
******
> -+**
> -+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
> -+** Contact: http://www.qt-project.org/legal
> -+**
> -+** This file is part of the qmake spec of the Qt Toolkit.
> -+**
> -+** $QT_BEGIN_LICENSE:LGPL$
> -+** Commercial License Usage
> -+** Licensees holding valid commercial Qt licenses may use this file in
> -+** accordance with the commercial license agreement provided with the
> -+** Software or, alternatively, in accordance with the terms contained in
> -+** a written agreement between you and Digia.  For licensing terms and
> -+** conditions see http://qt.digia.com/licensing.  For further informati=
on
> -+** use the contact form at http://qt.digia.com/contact-us.
> -+**
> -+** GNU Lesser General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU Less=
er
> -+** General Public License version 2.1 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.LGPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU Lesser General Public License version 2.1 requirements
> -+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> -+**
> -+** In addition, as a special exception, Digia gives you certain additio=
nal
> -+** rights.  These rights are described in the Digia Qt LGPL Exception
> -+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
> -+**
> -+** GNU General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU
> -+** General Public License version 3.0 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.GPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU General Public License version 3.0 requirements will =
be
> -+** met: http://www.gnu.org/copyleft/gpl.html.
> -+**
> -+**
> -+** $QT_END_LICENSE$
> -+**
> -+***********************************************************************=
*****/
> -+
> -+#ifndef QPLATFORMDEFS_H
> -+#define QPLATFORMDEFS_H
> -+
> -+// Get Qt defines/settings
> -+
> -+#include "qglobal.h"
> -+
> -+// Set any POSIX/XOPEN defines at the top of this file to turn on speci=
fic APIs
> -+
> -+// 1) need to reset default environment if _BSD_SOURCE is defined
> -+// 2) need to specify POSIX thread interfaces explicitly in glibc 2.0
> -+// 3) it seems older glibc need this to include the X/Open stuff
> -+#ifndef _GNU_SOURCE
> -+#  define _GNU_SOURCE
> -+#endif
> -+
> -+#include <unistd.h>
> -+
> -+
> -+// We are hot - unistd.h should have turned on the specific APIs we req=
uested
> -+
> -+#include <features.h>
> -+#include <pthread.h>
> -+#include <dirent.h>
> -+#include <fcntl.h>
> -+#include <grp.h>
> -+#include <pwd.h>
> -+#include <signal.h>
> -+
> -+#include <sys/types.h>
> -+#include <sys/ioctl.h>
> -+#include <sys/ipc.h>
> -+#include <sys/time.h>
> -+#include <sys/shm.h>
> -+#include <sys/socket.h>
> -+#include <sys/stat.h>
> -+#include <sys/wait.h>
> -+#include <netinet/in.h>
> -+#ifndef QT_NO_IPV6IFNAME
> -+#include <net/if.h>
> -+#endif
> -+
> -+#define QT_USE_XOPEN_LFS_EXTENSIONS
> -+#include "../common/posix/qplatformdefs.h"
> -+
> -+#undef QT_SOCKLEN_T
> -+
> -+#if defined(__GLIBC__) && (__GLIBC__ >=3D 2)
> -+#define QT_SOCKLEN_T            socklen_t
> -+#else
> -+#define QT_SOCKLEN_T            int
> -+#endif
> -+
> -+#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >=3D 500)
> -+#define QT_SNPRINTF		::snprintf
> -+#define QT_VSNPRINTF		::vsnprintf
> -+#endif
> -+
> -+#endif // QPLATFORMDEFS_H
> +@@ -0,0 +1 @@
> ++#include "../linux-g++/qplatformdefs.h"
> diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf=
-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-t=
o-set-qt.conf-from-the-outside-u.patch
> deleted file mode 100644
> index 699e385..0000000
> --- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-t=
he-outside-u.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From e5f8607cfa1d2bcc798686cdf7c87ea0c6577d30 Mon Sep 17 00:00:00 2001
> -From: Holger Freyther <zecke@selfish.org>
> -Date: Wed, 26 Sep 2012 17:22:30 +0200
> -Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside usi=
ng the
> - environment
> -
> -Allow to set a qt.conf from the outside using the environment. This allo=
ws
> -to inject new prefixes and other paths into qmake. This is needed when u=
sing
> -the same qmake binary to build qt/x11 and qt/embedded
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -  again very OE specific to read everything from environment (reusing th=
e same
> -  qmake from sstate and replacing all configured paths in it with qt.con=
f from
> -  environment).
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/corelib/global/qlibraryinfo.cpp | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/ql=
ibraryinfo.cpp
> -index 4582001..ff65ef9 100644
> ---- a/src/corelib/global/qlibraryinfo.cpp
> -+++ b/src/corelib/global/qlibraryinfo.cpp
> -@@ -163,7 +163,10 @@ void QLibrarySettings::load()
> -=20
> - QSettings *QLibraryInfoPrivate::findConfiguration()
> - {
> --    QString qtconfig =3D QStringLiteral(":/qt/etc/qt.conf");
> -+    QByteArray config =3D getenv("QT_CONF_PATH");
> -+    QString qtconfig =3D QFile::decodeName(config);
> -+    if(!QFile::exists(qtconfig))
> -+        qtconfig =3D QStringLiteral(":/qt/etc/qt.conf");
> -     if (QFile::exists(qtconfig))
> -         return new QSettings(qtconfig, QSettings::IniFormat);
> - #ifdef QT_BUILD_QMAKE
> diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.pa=
tch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> index 381cde2..8224171 100644
> --- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> +++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> @@ -1,165 +1,23 @@
> -From c1dc6165d6a085f162ed32ef5697f645019f9ee0 Mon Sep 17 00:00:00 2001
> +From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 6 Apr 2013 13:15:07 +0200
>  Subject: [PATCH] Add -external-hostbindir option
> =20
> -* when cross-compiling it's sometimes useful to use existing tools from =
machine
> -  (or in OpenEmbedded built with separate native recipe) when building f=
or target
> -
> -* this way we can skip bootstraping tools we already have
> -
> -* qt_functions: temporary remove isEmpty check
> -* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
> -* isEmpty works correctly only with qmake variables (e.g. $$FOO -
> -  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
> -
>  * cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host =
binaries
> =20
> -Upstream-Status: Pending
> -  is a lot better for upstreaming (and it was already sort of approved by
> -  Oswald) but in 5.2.0 I've noticed that he added something similar for
> -  android builds
> +Upstream-Status: Inappropriate [OE specific]
> =20
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Simon Busch <morphis@gravedo.de>
>  Signed-off-by: Jonathan Liu <net147@gmail.com>
> =20
> -Conflicts:
> -        configure
> -
>  Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
>  ---
> - configure                                   | 14 ++++++++++++++
> - mkspecs/features/qt_functions.prf           |  6 +++++-
> - mkspecs/features/qt_tool.prf                |  4 +++-
> - qtbase.pro                                  | 16 ++++++++++++++++
> - src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
> - src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
> - src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
> - 7 files changed, 44 insertions(+), 8 deletions(-)
> + src/corelib/Qt5CoreConfigExtras.cmake.in    | 6 +++---
> + src/dbus/Qt5DBusConfigExtras.cmake.in       | 4 ++--
> + src/widgets/Qt5WidgetsConfigExtras.cmake.in | 2 +-
> + 3 files changed, 6 insertions(+), 6 deletions(-)
> =20
> -diff --git a/configure b/configure
> -index 052872e..1fcbb3a 100755
> ---- a/configure
> -+++ b/configure
> -@@ -834,6 +834,7 @@ QT_HOST_BINS=3D
> - QT_HOST_LIBS=3D
> - QT_HOST_DATA=3D
> - QT_EXT_PREFIX=3D
> -+QT_EXTERNAL_HOST_BINS=3D
> -=20
> - #flags for SQL drivers
> - QT_CFLAGS_PSQL=3D
> -@@ -953,6 +954,7 @@ while [ "$#" -gt 0 ]; do
> -     -testsdir| \
> -     -hostdatadir| \
> -     -hostbindir| \
> -+    -external-hostbindir| \
> -     -hostlibdir| \
> -     -extprefix| \
> -     -sysroot| \
> -@@ -1185,6 +1187,9 @@ while [ "$#" -gt 0 ]; do
> -     extprefix)
> -         QT_EXT_PREFIX=3D"$VAL"
> -         ;;
> -+    external-hostbindir)
> -+        QT_EXTERNAL_HOST_BINS=3D"$VAL"
> -+        ;;
> -     pkg-config)
> -         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
> -             CFG_PKGCONFIG=3D"$VAL"
> -@@ -2447,6 +2452,10 @@ Installation options:
> -     -hostdatadir <dir> . Data used by qmake will be installed to <dir>
> -                          (default HOSTPREFIX)
> -=20
> -+    -external-hostbindir <dir> Use external host executables instead of=
 building them
> -+                         (not used by defaut)
> -+
> -+
> - Configure options:
> -=20
> -  The defaults (*) are usually acceptable. A plus (+) denotes a default =
value
> -@@ -3209,6 +3218,11 @@ fi
> - # command line and environment validation
> - #----------------------------------------------------------------------=
---------
> -=20
> -+# default is empty, don't call makeabs if it is empty
> -+if [ ! -z "$QT_EXTERNAL_HOST_BINS" ]; then
> -+    QT_EXTERNAL_HOST_BINS=3D`"$relpath/config.tests/unix/makeabs" "$QT_=
EXTERNAL_HOST_BINS"`
> -+fi
> -+
> - # update QT_CONFIG to show our current predefined configuration
> - CFG_QCONFIG_PATH=3D$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
> - case "$CFG_QCONFIG" in
> -diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_fun=
ctions.prf
> -index 54641ce..7d7baa4 100644
> ---- a/mkspecs/features/qt_functions.prf
> -+++ b/mkspecs/features/qt_functions.prf
> -@@ -71,7 +71,11 @@ defineTest(qtHaveModule) {
> - defineTest(qtPrepareTool) {
> -     cmd =3D $$eval(QT_TOOL.$${2}.binary)
> -     isEmpty(cmd) {
> --        cmd =3D $$[QT_HOST_BINS]/$$2
> -+        QT_EXTERNAL_HOST_BINS =3D $$[QT_EXTERNAL_HOST_BINS]
> -+        isEmpty(QT_EXTERNAL_HOST_BINS): \
> -+            cmd =3D $$[QT_HOST_BINS]/$$2
> -+        else: \
> -+            cmd =3D $$[QT_EXTERNAL_HOST_BINS]/$$2
> -         exists($${cmd}.pl) {
> -             $${1}_EXE =3D $${cmd}.pl
> -             cmd =3D perl -w $$system_path($${cmd}.pl)
> -diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
> -index bdeb59c..b8c539f 100644
> ---- a/mkspecs/features/qt_tool.prf
> -+++ b/mkspecs/features/qt_tool.prf
> -@@ -14,10 +14,12 @@ load(qt_app)
> - CONFIG +=3D console
> - DEFINES *=3D QT_USE_QSTRINGBUILDER
> -=20
> -+QT_EXTERNAL_HOST_BINS =3D $$[QT_EXTERNAL_HOST_BINS]
> -+
> - # If we are doing a prefix build, create a "module" pri which enables
> - # qtPrepareTool() to work with the non-installed build.
> - # Non-bootstrapped tools always need this because of the environment se=
tup.
> --!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(=
HOST_QT_TOOLS)) {
> -+!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(=
HOST_QT_TOOLS)):isEmpty(QT_EXTERNAL_HOST_BINS) {
> -     isEmpty(MODULE):MODULE =3D $$TARGET
> -=20
> -     load(qt_build_paths)
> -diff --git a/qtbase.pro b/qtbase.pro
> -index 11cff9e..ec03669 100644
> ---- a/qtbase.pro
> -+++ b/qtbase.pro
> -@@ -38,6 +38,19 @@ CONFIG -=3D qt
> -=20
> - ### installations ####
> -=20
> -+QT_EXTERNAL_HOST_BINS =3D $$[QT_EXTERNAL_HOST_BINS]
> -+
> -+#qmake
> -+qmake.path =3D $$[QT_HOST_BINS]
> -+qmake.files =3D $$OUT_PWD/bin/qmake
> -+!isEmpty(QT_EXTERNAL_HOST_BINS) {
> -+   qmake.files =3D $$[QT_EXTERNAL_HOST_BINS]/qmake
> -+}
> -+equals(QMAKE_HOST.os, Windows) {
> -+   qmake.files =3D $${qmake.files}.exe
> -+}
> -+INSTALLS +=3D qmake
> -+
> - #licheck
> - licheck.path =3D $$[QT_HOST_BINS]
> - licheck.files =3D $$PWD/bin/$$QT_LICHECK
> -@@ -51,6 +64,9 @@ INSTALLS +=3D fixqt4headers
> - #syncqt
> - syncqt.path =3D $$[QT_HOST_BINS]
> - syncqt.files =3D $$PWD/bin/syncqt.pl
> -+!isEmpty(QT_EXTERNAL_HOST_BINS) {
> -+   syncqt.files =3D $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
> -+}
> - INSTALLS +=3D syncqt
> -=20
> - # If we are doing a prefix build, create a "module" pri which enables
>  diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5C=
oreConfigExtras.cmake.in
>  index a5ed8b2..0e11a1e 100644
>  --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libto=
ol-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-=
and-libtool-replacements.patch
> index e24d475..c105488 100644
> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> +++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> @@ -1,4 +1,4 @@
> -From d83234c35de8f52ce3bf6eb262ad8e6af467ac34 Mon Sep 17 00:00:00 2001
> +From bf1498618415e7b1e57b54881b1e56d74f2cdf6b Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 27 Apr 2013 23:15:37 +0200
>  Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
> @@ -68,7 +68,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
>   2 files changed, 14 insertions(+), 1 deletion(-)
> =20
>  diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
> -index 71e96b4..0d7535c 100644
> +index 0c5f080..a6e4f09 100644
>  --- a/mkspecs/features/qt.prf
>  +++ b/mkspecs/features/qt.prf
>  @@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
> @@ -89,13 +89,13 @@ index 71e96b4..0d7535c 100644
>  +}
>  +
>   QT_PLUGIN_VERIFY =3D DEPLOYMENT_PLUGIN
> - contains(QT_CONFIG, static) {
> + qtConfig(static) {
>       QT_PLUGIN_VERIFY +=3D QTPLUGIN
>  diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common=
=2Eprf
> -index b367bc1..209cc43 100644
> +index e754a17..4c1530e 100644
>  --- a/mkspecs/features/qt_common.prf
>  +++ b/mkspecs/features/qt_common.prf
> -@@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
> +@@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
>           lib_replace.replace =3D
>       } else {
>           lib_replace.match =3D $$rplbase/lib
> diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-suppo=
rt.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.p=
atch
> deleted file mode 100644
> index c58b1d9..0000000
> --- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -From f207997b59f1381cf3523521209cb435b1a73f25 Mon Sep 17 00:00:00 2001
> -From: Jani Hautakangas <jani.hautakangas@ixonos.com>
> -Date: Thu, 16 May 2013 09:52:07 +0300
> -Subject: [PATCH] QOpenGLPaintDevice sub-area support
> -
> -Allows creating QOpenGLPaintDevice targetting sub-area
> -of binded framebuffer.
> -
> -Upstream-Status: Pending
> -
> -Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
> - src/gui/opengl/qopenglpaintdevice.h         |  2 ++
> - src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
> - src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
> - src/gui/opengl/qopenglpaintengine_p.h       |  1 +
> - src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
> - 6 files changed, 23 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qope=
nglpaintdevice.cpp
> -index 75f09d6..17d7155 100644
> ---- a/src/gui/opengl/qopenglpaintdevice.cpp
> -+++ b/src/gui/opengl/qopenglpaintdevice.cpp
> -@@ -141,6 +141,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, i=
nt height)
> - {
> - }
> -=20
> -+QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int hei=
ght)
> -+    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
> -+{
> -+    d_ptr->offset =3D QPoint(x,y);
> -+}
> -+
> - /*!
> -     \internal
> -  */
> -@@ -222,6 +228,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
> -     return d_ptr->ctx;
> - }
> -=20
> -+QPoint QOpenGLPaintDevice::offset() const
> -+{
> -+    return d_ptr->offset;
> -+}
> -+
> - /*!
> -     Returns the pixel size of the paint device.
> -=20
> -diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopeng=
lpaintdevice.h
> -index dffa68c..66a1e3d 100644
> ---- a/src/gui/opengl/qopenglpaintdevice.h
> -+++ b/src/gui/opengl/qopenglpaintdevice.h
> -@@ -59,12 +59,14 @@ public:
> -     QOpenGLPaintDevice();
> -     explicit QOpenGLPaintDevice(const QSize &size);
> -     QOpenGLPaintDevice(int width, int height);
> -+    QOpenGLPaintDevice(int x, int y, int width, int height);
> -     virtual ~QOpenGLPaintDevice();
> -=20
> -     int devType() const { return QInternal::OpenGL; }
> -     QPaintEngine *paintEngine() const;
> -=20
> -     QOpenGLContext *context() const;
> -+    QPoint offset() const;
> -     QSize size() const;
> -     void setSize(const QSize &size);
> -     void setDevicePixelRatio(qreal devicePixelRatio);
> -diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qope=
nglpaintdevice_p.h
> -index 78e6b7a..6630461 100644
> ---- a/src/gui/opengl/qopenglpaintdevice_p.h
> -+++ b/src/gui/opengl/qopenglpaintdevice_p.h
> -@@ -71,6 +71,7 @@ public:
> -=20
> - public:
> -     QSize size;
> -+    QPoint offset;
> -     QOpenGLContext *ctx;
> -=20
> -     qreal dpmx;
> -diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qope=
nglpaintengine.cpp
> -index d93871c..be2bee9 100644
> ---- a/src/gui/opengl/qopenglpaintengine.cpp
> -+++ b/src/gui/opengl/qopenglpaintengine.cpp
> -@@ -2084,7 +2084,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *p=
dev)
> -     for (int i =3D 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
> -         d->vertexAttributeArraysEnabledState[i] =3D false;
> -=20
> -+    const QPoint offset =3D d->device->offset();
> -     const QSize sz =3D d->device->size();
> -+    d->x =3D offset.x();
> -+    d->y =3D offset.y();
> -     d->width =3D sz.width();
> -     d->height =3D sz.height();
> -     d->mode =3D BrushDrawingMode;
> -@@ -2171,7 +2174,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
> -         d->device->ensureActiveTarget();
> -=20
> -         d->transferMode(BrushDrawingMode);
> --        d->funcs.glViewport(0, 0, d->width, d->height);
> -+        d->funcs.glViewport(d->x, d->y, d->width, d->height);
> -         d->needsSync =3D false;
> -         d->shaderManager->setDirty();
> -         d->syncGlState();
> -@@ -2213,6 +2216,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipSciss=
orTest()
> -     if (bounds =3D=3D QRect(0, 0, width, height)) {
> -         funcs.glDisable(GL_SCISSOR_TEST);
> -     } else {
> -+        bounds =3D QRect(bounds.x(), bounds.y(), bounds.width(), bounds=
=2Eheight());
> -         funcs.glEnable(GL_SCISSOR_TEST);
> -         setScissor(bounds);
> -     }
> -@@ -2221,12 +2225,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipSci=
ssorTest()
> -=20
> - void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
> - {
> --    const int left =3D rect.left();
> -+    const int left =3D rect.left() + x;
> -     const int width =3D rect.width();
> -     int bottom =3D height - (rect.top() + rect.height());
> -     if (device->paintFlipped()) {
> -         bottom =3D rect.top();
> -     }
> -+    bottom +=3D y;
> -     const int height =3D rect.height();
> -=20
> -     funcs.glScissor(left, bottom, width, height);
> -diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qope=
nglpaintengine_p.h
> -index c9f3282..7c0616b 100644
> ---- a/src/gui/opengl/qopenglpaintengine_p.h
> -+++ b/src/gui/opengl/qopenglpaintengine_p.h
> -@@ -270,6 +270,7 @@ public:
> -     QOpenGL2PaintEngineEx* q;
> -     QOpenGLEngineShaderManager* shaderManager;
> -     QOpenGLPaintDevice* device;
> -+    int x, y;
> -     int width, height;
> -     QOpenGLContext *ctx;
> -     EngineMode mode;
> -diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/openg=
l/qopengltextureglyphcache.cpp
> -index 9a7b1eb..6f301f8 100644
> ---- a/src/gui/opengl/qopengltextureglyphcache.cpp
> -+++ b/src/gui/opengl/qopengltextureglyphcache.cpp
> -@@ -403,7 +403,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int=
 width, int height)
> -     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
> -=20
> -     if (pex !=3D 0) {
> --        funcs->glViewport(0, 0, pex->width, pex->height);
> -+        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
> -         pex->updateClipScissorTest();
> -     } else {
> -         if (m_vao.isCreated()) {
> diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for=
-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-co=
nditional-for-defining-QT_SOCKLE.patch
> deleted file mode 100644
> index 4ea4061..0000000
> --- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defini=
ng-QT_SOCKLE.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 7ab6ff7ba20a3173c10a76814d3c9ed312c80627 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 8 Jun 2015 13:59:25 -0700
> -Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLE=
N_T
> -
> -This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
> -only when its glibc < 2 and not also for the libraries which may define
> -it as per standards but are not glibc, e.g. musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
> -index dd12003..8623651 100644
> ---- a/mkspecs/linux-oe-g++/qplatformdefs.h
> -+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
> -@@ -86,10 +86,10 @@
> -=20
> - #undef QT_SOCKLEN_T
> -=20
> --#if defined(__GLIBC__) && (__GLIBC__ >=3D 2)
> --#define QT_SOCKLEN_T            socklen_t
> --#else
> -+#if defined(__GLIBC__) && (__GLIBC__ < 2)
> - #define QT_SOCKLEN_T            int
> -+#else
> -+#define QT_SOCKLEN_T            socklen_t
> - #endif
> -=20
> - #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >=3D 500)
> diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-=
properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmak=
e-properly.patch
> index bac1841..6d64e6b 100644
> --- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properl=
y.patch
> +++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properl=
y.patch
> @@ -1,4 +1,4 @@
> -From 0f4ab3e27938002134e8f3f9eb12cf9c50b2ab95 Mon Sep 17 00:00:00 2001
> +From cc926956758bf8170c4e49c66e1066524b43f65f Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Fri, 13 Nov 2015 12:36:11 +0100
>  Subject: [PATCH] configure paths for target qmake properly
> @@ -19,11 +19,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 19 insertions(+), 4 deletions(-)
> =20
>  diff --git a/configure b/configure
> -index f49a674..d30d0ca 100755
> +index 8b33c5b..1df248f 100755
>  --- a/configure
>  +++ b/configure
> -@@ -3792,8 +3792,13 @@ if [ "$CFG_COMPILE_EXAMPLES" =3D "yes" ]; then
> -     QMAKE_CONFIG=3D"$QMAKE_CONFIG compile_examples"
> +@@ -1545,8 +1545,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
> +     fi
>   fi
>  =20
>  -shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> @@ -38,7 +38,7 @@ index f49a674..d30d0ca 100755
>  =20
>   QT_CONFIGURE_STR_OFF=3D0
>  =20
> -@@ -3826,7 +3831,11 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
> +@@ -1579,7 +1584,11 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
>  =20
>   QT_CONFIGURE_STR_OFFSETS=3D
>   QT_CONFIGURE_STRS=3D
> @@ -51,7 +51,7 @@ index f49a674..d30d0ca 100755
>   addConfStr "$QT_REL_HOST_BINS"
>   addConfStr "$QT_REL_HOST_LIBS"
>   addConfStr "$QT_REL_HOST_DATA"
> -@@ -3838,6 +3847,12 @@ addConfStr "$shortspec"
> +@@ -1591,6 +1600,12 @@ addConfStr "$shortspec"
>   #----------------------------------------------------------------------=
---------
>   [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/=
global"
>  =20
> @@ -62,9 +62,9 @@ index f49a674..d30d0ca 100755
>  +fi
>  +
>   cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> - /* License Info */
> - static const char qt_configure_licensee_str          [256 + 12] =3D "qt=
_lcnsuser=3D$Licensee";
> -@@ -3850,7 +3865,7 @@ static const char qt_configure_installation       =
   [12+11]    =3D "qt_instdate=3D2
> + /* Installation date */
> + static const char qt_configure_installation          [12+11]    =3D "qt=
_instdate=3D2012-12-20";
> +@@ -1599,7 +1614,7 @@ static const char qt_configure_installation       =
   [12+11]    =3D "qt_instdate=3D2
>   static const char qt_configure_prefix_path_str       [512 + 12] =3D "qt=
_prfxpath=3D$QT_INSTALL_PREFIX";
>   #ifdef QT_BUILD_QMAKE
>   static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D "qt=
_epfxpath=3D$QT_EXT_PREFIX";
> diff --git a/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-inst=
ead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-=
features-instead-of-erroring-out.patch
> new file mode 100644
> index 0000000..cb9de79
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-=
erroring-out.patch
> @@ -0,0 +1,28 @@
> +From 9eb81e3bdeda4f90e5f2942400aef38b51a356bd Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Mon, 24 Oct 2016 09:45:18 +0300
> +Subject: [PATCH] Disable all unknown features instead of erroring out
> +
> +Task-number: QTBUG-56656
> +Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
> +---
> + mkspecs/features/qt_configure.prf | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_con=
figure.prf
> +index e8fa0c6..0ca5670 100644
> +--- a/mkspecs/features/qt_configure.prf
> ++++ b/mkspecs/features/qt_configure.prf
> +@@ -1009,7 +1009,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
> +                     error("Expression '$$1' is accessing field '$$var' =
of non-local feature $${feature}.")
> +                 return($$result)
> +             }
> +-            error("Unknown feature object $${feature} in expression '$$=
{1}'.")
> ++            warning("Unknown feature object $${feature} in expression '=
$${1}'.")
> ++            result =3D false
> +         }
> +         !qtConfCheckFeature($$feature): \
> +             error("Expression '$$1' is accessing non-emitted feature $$=
{feature}.")
> +--=20
> +1.9.1
> +
> diff --git a/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgcon=
fig-and-defaults.patch b/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-f=
rom-pkgconfig-and-defaults.patch
> deleted file mode 100644
> index 23d0ab3..0000000
> --- a/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and=
-defaults.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From 91b87aed0a2a96b0d6b54757ea13c75ee648a9b0 Mon Sep 17 00:00:00 2001
> -From: Julien Gueytat <contact@jgueytat.fr>
> -Date: Wed, 27 Apr 2016 19:24:39 +0200
> -Subject: [PATCH] Reorder EGL libraries from pkgconfig and defaults:
> -
> -https://bugreports.qt.io/browse/QTBUG-50838
> -https://bugreports.qt.io/browse/QTBUG-52739
> -
> -The modification is the less intrusive possible. It only swaps LIBS and =
QMAKE_LIBS_EGL.
> -The reason behind that was that for the RaspberryPi:
> - *  -lEGL -GLESv2 can link
> - *  -lGLESv2 -lEGL can't
> -
> -Adding -lEGL -lGLESv2 and then -lEGL gives -lGLESv2 -lEGL ... the librar=
ies swaped.
> -
> -Signed-off-by: Julien Gueytat <contact@jgueytat.fr>
> ----
> - config.tests/qpa/egl/egl.pro               |  5 ++++-
> - config.tests/qpa/eglfs-brcm/eglfs-brcm.pro | 12 +++++++-----
> - configure                                  | 16 ++++++++++++++--
> - 3 files changed, 25 insertions(+), 8 deletions(-)
> -
> -diff --git a/config.tests/qpa/egl/egl.pro b/config.tests/qpa/egl/egl.pro
> -index b5396da..828b674 100644
> ---- a/config.tests/qpa/egl/egl.pro
> -+++ b/config.tests/qpa/egl/egl.pro
> -@@ -5,6 +5,9 @@ for(p, QMAKE_LIBDIR_EGL) {
> - }
> -=20
> - !isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH +=3D $$QMAKE_INCDIR_EGL
> --!isEmpty(QMAKE_LIBS_EGL): LIBS +=3D $$QMAKE_LIBS_EGL
> -+
> -+BACKUP_LIBS =3D $$LIBS
> -+!isEmpty(QMAKE_LIBS_EGL): LIBS =3D $$QMAKE_LIBS_EGL
> -+LIBS +=3D $$BACKUP_LIBS
> -=20
> - CONFIG -=3D qt
> -diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/q=
pa/eglfs-brcm/eglfs-brcm.pro
> -index d8b1c3e..06f7241 100644
> ---- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
> -+++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
> -@@ -1,11 +1,13 @@
> - SOURCES =3D eglfs-brcm.cpp
> -=20
> --CONFIG -=3D qt
> --
> --INCLUDEPATH +=3D $$QMAKE_INCDIR_EGL
> --
> - for(p, QMAKE_LIBDIR_EGL) {
> -     LIBS +=3D -L$$p
> - }
> -=20
> --LIBS +=3D -lEGL -lGLESv2 -lbcm_host
> -+INCLUDEPATH +=3D $$QMAKE_INCDIR_EGL
> -+
> -+BACKUP_LIBS =3D $$LIBS
> -+LIBS =3D -lEGL -lGLESv2 -lbcm_host
> -+LIBS +=3D $$BACKUP_LIBS
> -+
> -+CONFIG -=3D qt
> -diff --git a/configure b/configure
> -index d30d0ca..14f348c 100755
> ---- a/configure
> -+++ b/configure
> -@@ -5891,7 +5891,9 @@ if [ "$CFG_EGL" !=3D "no" ]; then
> -         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
> -         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
> -         QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | se=
d -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
> --    fi       # detect EGL support
> -+    fi
> -+   =20
> -+    # detect EGL support
> -     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
> -         CFG_EGL=3Dyes
> -         if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_L=
IBS_EGL; then
> -@@ -5914,8 +5916,18 @@ fi
> - if [ "$CFG_EGLFS" !=3D "no" ]; then
> -     if [ "$XPLATFORM_QNX" =3D "no" ] && [ "$CFG_OPENGL" !=3D "no" ]; th=
en
> -         CFG_EGLFS=3D"$CFG_EGL"
> -+
> -+        if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null=
; then
> -+            QMAKE_INCDIR_EGL=3D`$PKG_CONFIG --cflags-only-I egl 2>/dev/=
null | sed -e 's,^-I,,g' -e 's, -I, ,g'`
> -+            QMAKE_LIBS_EGL=3D`$PKG_CONFIG --libs egl 2>/dev/null`
> -+            QMAKE_CFLAGS_EGL=3D`$PKG_CONFIG --cflags egl 2>/dev/null`
> -+            QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
> -+            QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
> -+            QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " =
| sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
> -+        fi
> -+
> -         # Detect eglfs backends.
> --        if compileTest qpa/eglfs-brcm "eglfs-brcm"; then
> -+        if compileTest qpa/eglfs-brcm "eglfs-brcm" $QMAKE_CFLAGS_EGL $Q=
MAKE_LIBS_EGL; then
> -             CFG_EGLFS_BRCM=3Dyes
> -         else
> -             CFG_EGLFS_BRCM=3Dno
> diff --git a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-fo=
r-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-opt=
ion-for-native-sdk.patch
> deleted file mode 100644
> index 1ab8abe..0000000
> --- a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-nativ=
e-sdk.patch
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -From cb66a3193b1b1b8b402548b615c3675c4adcf13a Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 6 Apr 2013 13:15:07 +0200
> -Subject: [PATCH] Add -external-hostbindir option for native(sdk)
> -
> -* when cross-compiling it's sometimes useful to use existing tools from =
machine
> -  (or in OpenEmbedded built with separate native recipe) when building f=
or target
> -
> -* this way we can skip bootstraping tools we already have
> -
> -* qt_functions: temporary remove isEmpty check
> -* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
> -* isEmpty works correctly only with qmake variables (e.g. $$FOO -
> -  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
> -
> -* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host =
binaries
> -
> -Upstream-Status: Pending
> -  is a lot better for upstreaming (and it was already sort of approved by
> -  Oswald) but in 5.2.0 I've noticed that he added something similar for
> -  android builds
> -
> -Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -Signed-off-by: Simon Busch <morphis@gravedo.de>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Conflicts:
> -        tools/configure/configureapp.cpp
> ----
> - configure                           |  1 +
> - qmake/property.cpp                  |  1 +
> - src/corelib/global/qlibraryinfo.cpp |  3 ++-
> - src/corelib/global/qlibraryinfo.h   |  1 +
> - tools/configure/configureapp.cpp    | 11 +++++++++++
> - 5 files changed, 16 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure b/configure
> -index 14f348c..61f22e8 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3839,6 +3839,7 @@ fi
> - addConfStr "$QT_REL_HOST_BINS"
> - addConfStr "$QT_REL_HOST_LIBS"
> - addConfStr "$QT_REL_HOST_DATA"
> -+addConfStr "$QT_EXTERNAL_HOST_BINS"
> - addConfStr "$shortxspec"
> - addConfStr "$shortspec"
> -=20
> -diff --git a/qmake/property.cpp b/qmake/property.cpp
> -index 9ee08f4..e6ecf92 100644
> ---- a/qmake/property.cpp
> -+++ b/qmake/property.cpp
> -@@ -63,6 +63,7 @@ static const struct {
> -     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
> -     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
> -     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
> -+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, =
true },
> -     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
> -     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
> - };
> -diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/ql=
ibraryinfo.cpp
> -index ff65ef9..3726831 100644
> ---- a/src/corelib/global/qlibraryinfo.cpp
> -+++ b/src/corelib/global/qlibraryinfo.cpp
> -@@ -381,7 +381,7 @@ QLibraryInfo::isDebugBuild()
> -  */
> -=20
> - static const struct {
> --    char key[19], value[13];
> -+    char key[21], value[13];
> - } qtConfEntries[] =3D {
> -     { "Prefix", "." },
> -     { "Documentation", "doc" }, // should be ${Data}/doc
> -@@ -406,6 +406,7 @@ static const struct {
> -     { "HostBinaries", "bin" },
> -     { "HostLibraries", "lib" },
> -     { "HostData", "." },
> -+    { "ExternalHostBinaries", "" },
> -     { "TargetSpec", "" },
> -     { "HostSpec", "" },
> -     { "HostPrefix", "" },
> -diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlib=
raryinfo.h
> -index 362d47d..a2326e2 100644
> ---- a/src/corelib/global/qlibraryinfo.h
> -+++ b/src/corelib/global/qlibraryinfo.h
> -@@ -87,6 +87,7 @@ public:
> -         HostBinariesPath,
> -         HostLibrariesPath,
> -         HostDataPath,
> -+        ExternalHostBinariesPath,
> -         TargetSpecPath,
> -         HostSpecPath,
> -         HostPrefixPath,
> -diff --git a/tools/configure/configureapp.cpp b/tools/configure/configur=
eapp.cpp
> -index 0fa205b..2921e2b 100644
> ---- a/tools/configure/configureapp.cpp
> -+++ b/tools/configure/configureapp.cpp
> -@@ -1219,6 +1219,13 @@ void Configure::parseCmdLine()
> -             dictionary[ "QT_EXT_PREFIX" ] =3D configCmdLine.at(i);
> -         }
> -=20
> -+        else if (configCmdLine.at(i) =3D=3D "-external-hostbindir") {
> -+            ++i;
> -+            if (i =3D=3D argCount)
> -+                break;
> -+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] =3D configCmdLine.at(=
i);
> -+        }
> -+
> -         else if (configCmdLine.at(i) =3D=3D "-make-tool") {
> -             ++i;
> -             if (i =3D=3D argCount)
> -@@ -4171,6 +4178,9 @@ void Configure::generateQConfigCpp()
> -=20
> -     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
> -         dictionary["QT_REL_HOST_DATA"] =3D haveHpx ? "." : dictionary["=
QT_REL_INSTALL_ARCHDATA"];
> -+   =20
> -+    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
> -+        dictionary["QT_EXTERNAL_HOST_BINS"] =3D haveHpx ? "bin" : dicti=
onary["QT_REL_INSTALL_BINS"];
> -=20
> -     confStringOff =3D 0;
> -     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
> -@@ -4190,6 +4200,7 @@ void Configure::generateQConfigCpp()
> -     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
> -     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
> -     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
> -+    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
> -     addConfStr(1, targSpec);
> -     addConfStr(1, hostSpec);
> -=20
> diff --git a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch=
 b/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
> deleted file mode 100644
> index 7b681dc..0000000
> --- a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 2e176e3d10535e4fdaa6ecc919538f66f4a2930d Mon Sep 17 00:00:00 2001
> -From: Andy Nichols <andy.nichols@qt.io>
> -Date: Mon, 11 Jul 2016 09:18:33 +0200
> -Subject: QWidgetBackingStore: Fix build with QT_NO_OPENGL
> -
> -A define moved out of the #ifndef QT_NO_OPENGL scope.
> -
> -Change-Id: I41c943b97f165b5171581e01f3a4b2d3fb25747e
> -Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ----
> - src/widgets/kernel/qwidgetbackingstore.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/widgets/kernel/qwidgetbackingstore.cpp b/src/widgets/ke=
rnel/qwidgetbackingstore.cpp
> -index 32aabce..242e625 100644
> ---- a/src/widgets/kernel/qwidgetbackingstore.cpp
> -+++ b/src/widgets/kernel/qwidgetbackingstore.cpp
> -@@ -67,7 +67,9 @@ QT_BEGIN_NAMESPACE
> -
> - extern QRegion qt_dirtyRegion(QWidget *);
> -
> -+#ifndef QT_NO_OPENGL
> - Q_GLOBAL_STATIC(QPlatformTextureList, qt_dummy_platformTextureList)
> -+#endif
> -
> - /**
> -  * Flushes the contents of the \a backingStore into the screen area of =
\a widget.
> ---
> -cgit v1.0-4-g1e03
> -
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 223383d..c9005a8 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -17,16 +17,12 @@ LIC_FILES_CHKSUM =3D " \
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> -    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>      file://0008-configure-paths-for-target-qmake-properly.patch \
> -    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
> +    file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch \
> -    file://0013-Fix-build-with-QT_NO_OPENGL.patch \
>  "
> =20
>  DEPENDS +=3D "qtbase-native"
> @@ -43,16 +39,15 @@ RDEPENDS_${PN}-tools +=3D "perl"
> =20
>  PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'gl', '', d)}"
>  PACKAGECONFIG_FB ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb=
', 'directfb', '', d)}"
> -PACKAGECONFIG_X11 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
xcb xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb', '', d)}"
> +PACKAGECONFIG_X11 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
xcb xrender xinput2 glib xkb xkbcommon-evdev', '', d)}"
>  PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
> -PACKAGECONFIG_MULTIMEDIA ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'pulseaudio', '', d)}"
>  PACKAGECONFIG_DISTRO ?=3D ""
>  # Either release or debug, can be overridden in bbappends
>  PACKAGECONFIG_RELEASE ?=3D "release"
>  # This is in qt5.inc, because qtwebkit-examples are using it to enable c=
a-certificates dependency
>  # PACKAGECONFIG_OPENSSL ?=3D "openssl"
> -PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs"
> +PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs freetype"
> =20
>  PACKAGECONFIG ?=3D " \
>      ${PACKAGECONFIG_RELEASE} \
> @@ -63,34 +58,37 @@ PACKAGECONFIG ?=3D " \
>      ${PACKAGECONFIG_X11} \
>      ${PACKAGECONFIG_FONTS} \
>      ${PACKAGECONFIG_SYSTEM} \
> -    ${PACKAGECONFIG_MULTIMEDIA} \
>      ${PACKAGECONFIG_DISTRO} \
>  "
> =20
>  PACKAGECONFIG[release] =3D "-release,-debug"
>  PACKAGECONFIG[debug] =3D ""
>  PACKAGECONFIG[developer] =3D "-developer-build"
> +PACKAGECONFIG[qml-debug] =3D "-qml-debug,-no-qml-debug"
>  PACKAGECONFIG[sm] =3D "-sm,-no-sm"
>  PACKAGECONFIG[tests] =3D "-make tests,-nomake tests"
>  PACKAGECONFIG[examples] =3D "-make examples -compile-examples,-nomake ex=
amples"
>  PACKAGECONFIG[tools] =3D "-make tools,-nomake tools"
>  # only for completeness, configure will add libs even if you try to expl=
icitly remove it
> -PACKAGECONFIG[libs] =3D "-make libs,-nomake libs"
> +PACKAGECONFIG[libs] =3D "-make libs"
>  # accessibility is required to compile qtquickcontrols
>  PACKAGECONFIG[accessibility] =3D "-accessibility,-no-accessibility"
>  PACKAGECONFIG[glib] =3D "-glib,-no-glib,glib-2.0"
>  # use either system freetype or bundled freetype, if you disable freetyp=
e completely
>  # fontdatabases/basic/qbasicfontdatabase.cpp will fail to build and syst=
em freetype
>  # works only together with fontconfig
> -PACKAGECONFIG[freetype] =3D "-system-freetype,-freetype,freetype"
> +PACKAGECONFIG[freetype] =3D "-system-freetype,-qt-freetype,freetype"
>  PACKAGECONFIG[harfbuzz] =3D "-system-harfbuzz,-no-harfbuzz,harfbuzz"
>  PACKAGECONFIG[jpeg] =3D "-system-libjpeg,-no-libjpeg,jpeg"
>  PACKAGECONFIG[libpng] =3D "-system-libpng,-no-libpng,libpng"
> +PACKAGECONFIG[gif] =3D "-gif,-no-gif"
> +PACKAGECONFIG[ico] =3D "-ico,-no-ico"
>  PACKAGECONFIG[zlib] =3D "-system-zlib,-qt-zlib,zlib"
>  PACKAGECONFIG[pcre] =3D "-system-pcre,-qt-pcre,pcre"
>  PACKAGECONFIG[eglfs] =3D "-eglfs,-no-eglfs,drm"
>  PACKAGECONFIG[gl] =3D "-opengl desktop,,virtual/libgl"
>  PACKAGECONFIG[gles2] =3D "-opengl es2,,virtual/libgles2 virtual/egl"
> +PACKAGECONFIG[no-opengl] =3D "-no-opengl"
>  PACKAGECONFIG[tslib] =3D "-tslib,-no-tslib,tslib"
>  PACKAGECONFIG[cups] =3D "-cups,-no-cups,cups"
>  PACKAGECONFIG[dbus] =3D "-dbus,-no-dbus,dbus"
> @@ -104,14 +102,8 @@ PACKAGECONFIG[sql-tds] =3D "-sql-tds,-no-sql-tds"
>  PACKAGECONFIG[sql-db2] =3D "-sql-db2,-no-sql-db2"
>  PACKAGECONFIG[sql-sqlite2] =3D "-sql-sqlite2,-no-sql-sqlite2,sqlite"
>  PACKAGECONFIG[sql-sqlite] =3D "-sql-sqlite -system-sqlite,-no-sql-sqlite=
,sqlite3"
> -PACKAGECONFIG[xcursor] =3D "-xcursor,-no-xcursor,libxcursor"
>  PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"
> -PACKAGECONFIG[xfixes] =3D "-xfixes,-no-xfixes,libxfixes"
> -PACKAGECONFIG[xrandr] =3D "-xrandr,-no-xrandr,libxrandr"
>  PACKAGECONFIG[xrender] =3D "-xrender,-no-xrender,libxrender"
> -PACKAGECONFIG[xshape] =3D "-xshape,-no-xshape"
> -PACKAGECONFIG[xsync] =3D "-xsync,-no-xsync"
> -PACKAGECONFIG[openvg] =3D "-openvg,-no-openvg"
>  PACKAGECONFIG[iconv] =3D "-iconv,-no-iconv,virtual/libiconv"
>  PACKAGECONFIG[xkb] =3D "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[xkbcommon-evdev] =3D "-xkbcommon-evdev,-no-xkbcommon-evdev=
,libxkbcommon,xkeyboard-config"
> @@ -122,14 +114,12 @@ PACKAGECONFIG[fontconfig] =3D "-fontconfig,-no-font=
config,fontconfig"
>  PACKAGECONFIG[gtk] =3D "-gtk,-no-gtk,gtk+"
>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
> -PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"
> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,drm virtual/egl"
> +PACKAGECONFIG[gbm] =3D "-gbm,-no-gbm,virtual/mesa"
>  # needed for qtwebkit
>  PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"
>  PACKAGECONFIG[udev] =3D "-libudev,-no-libudev,udev"
>  PACKAGECONFIG[openssl] =3D "-openssl,-no-openssl,openssl,libssl"
> -PACKAGECONFIG[alsa] =3D "-alsa,-no-alsa,alsa-lib"
> -PACKAGECONFIG[pulseaudio] =3D "-pulseaudio,-no-pulseaudio,pulseaudio"
>  PACKAGECONFIG[widgets] =3D "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] =3D "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] =3D "-libinput,-no-libinput,libinput"
> @@ -144,44 +134,10 @@ QT_CONFIG_FLAGS +=3D " \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
> =20
> -do_generate_qt_config_file_append() {
> -    cat >> ${QT_CONF_PATH} <<EOF
> -
> -[EffectivePaths]
> -Prefix=3D..
> -EOF
> -}
> -
> -# qtbase is exception, we need to use mkspecs from ${S}
> -QMAKE_MKSPEC_PATH =3D "${B}"
> -
> -# another exception is that we need to run bin/qmake, because EffectiveP=
aths are relative to qmake location
> -OE_QMAKE_QMAKE_ORIG :=3D "${OE_QMAKE_QMAKE}"
> -OE_QMAKE_QMAKE =3D "bin/qmake"
> -
> -# qtbase is exception, configure script is using our get(X)QEvalMakeConf=
 and setBootstrapEvalVariable functions to read it from shell
> -export OE_QMAKE_COMPILER
> -export OE_QMAKE_CC
> -export OE_QMAKE_CFLAGS
> -export OE_QMAKE_CXX
> -export OE_QMAKE_CXXFLAGS
> -export OE_QMAKE_LINK
> -export OE_QMAKE_LDFLAGS
> -export OE_QMAKE_AR
> -export OE_QMAKE_STRIP
> -
>  do_configure() {
> -    # we need symlink in path relative to source, because
> -    # EffectivePaths:Prefix is relative to qmake location
> -    if [ ! -e ${B}/bin/qmake ]; then
> -        mkdir -p ${B}/bin
> -        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
> -    fi
> -
>      ${S}/configure -v \
>          -opensource -confirm-license \
>          -sysroot ${STAGING_DIR_TARGET} \
> -        -no-gcc-sysroot \
>          -prefix ${OE_QMAKE_PATH_PREFIX} \
>          -bindir ${OE_QMAKE_PATH_BINS} \
>          -libdir ${OE_QMAKE_PATH_LIBS} \
> @@ -197,37 +153,29 @@ do_configure() {
>          -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
>          -testsdir ${OE_QMAKE_PATH_TESTS} \
>          -examplesdir ${OE_QMAKE_PATH_EXAMPLES} \
> +        -hostprefix ${OE_QMAKE_PATH_HOST_PREFIX} \
> +        -hostlibdir ${OE_QMAKE_PATH_HOST_LIBS} \
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
>          -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
>          -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
> -        -platform ${OE_QMAKESPEC} \
> +        -platform ${OE_QMAKE_PLATFORM_NATIVE} \
>          -xplatform linux-oe-g++ \
>          ${QT_CONFIG_FLAGS}
> -
> -    qmake5_base_do_configure
>  }
> =20
>  do_install_append() {
>      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device=
-extra.pri: No such file or directory"
>      touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> =20
> -    install -m 0755 ${B}/bin/qmake-target ${D}${OE_QMAKE_PATH_QT_BINS}/q=
make
> -
> -    # Remove example.pro file as it is useless
> -    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
> -
> -    # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-=
ios-clang/rename_main.sh:#!/bin/bash
> -    # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no provi=
ders in its RDEPENDS [file-rdeps]
> -    rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
> -    # and this one has /bin/bash shebang, but checkbashisms doesn't show=
 any reason for it
> -    sed -i 's@^#!/bin/bash$@#!/bin/sh@g' ${D}/${OE_QMAKE_PATH_QT_ARCHDAT=
A}/mkspecs/features/data/mac/objc_namespace.sh
> -
>      # Replace host paths with qmake built-in properties
> -    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX=
]|g' \
> +    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX=
/get]|g' \
>          -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
>          ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
>  }
> =20
> +# mkspecs have mac specific scripts that depend on perl and bash
> +INSANE_SKIP_${PN}-mkspecs +=3D "file-rdeps"
> +
>  RRECOMMENDS_${PN}-plugins +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'libx11-locale', '', d)}"
> =20
> -SRCREV =3D "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
> +SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d=
_git.bb
> index 8cf316b..3ca6647 100644
> --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> @@ -3,11 +3,11 @@ require qt5-git.inc
> =20
>  LICENSE =3D "LGPL-3.0 | GPL-3.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS =3D "qtdeclarative"
> =20
> -SRCREV =3D "1568c60d2a0d1758acfeec9f002af7ff5b4d28ee"
> +SRCREV =3D "5962967a3712ee711fd9ab58da664a3eb0acb24e"
> diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git=
=2Ebb
> index 21f6f13..1369dee 100644
> --- a/recipes-qt/qt5/qtcharts_git.bb
> +++ b/recipes-qt/qt5/qtcharts_git.bb
> @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia"
> =20
> -SRCREV =3D "03a6177a3223f928a5f329c8b1fc4d5fe376deed"
> +SRCREV =3D "057b3e2d6a96b42b890a0d007a8801d260c3de48"
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index 67f882a..de7764d 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -19,13 +19,8 @@ DEPENDS +=3D "qtbase qtdeclarative"
>  inherit bluetooth
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez', '', d)}"
> -PACKAGECONFIG[bluez] =3D "CONFIG+=3DOE_BLUEZ_ENABLED,,${BLUEZ}"
> +PACKAGECONFIG[bluez] =3D "-feature-bluez,-no-feature-bluez,${BLUEZ}"
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
> -do_configure_prepend() {
> -    # disable bluez test if it isn't enabled by PACKAGECONFIG
> -    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez=
)/g' ${S}/qtconnectivity.pro
> -}
> -
> -SRCREV =3D "8755a1f2460fa523782e27b6ca7a430a0176ac61"
> +SRCREV =3D "1afb57ed92a25bbc000ea4c4d7662cb8b9e267ee"
> diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis=
3d_git.bb
> index 50a0bcc..7d6a51f 100644
> --- a/recipes-qt/qt5/qtdatavis3d_git.bb
> +++ b/recipes-qt/qt5/qtdatavis3d_git.bb
> @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
> =20
> -SRCREV =3D "d6a8da66dc3c141621c9be4b7509a6e43c60e15c"
> +SRCREV =3D "a78f8d6bef57dd4283094a52551705ee02909970"
> diff --git a/recipes-qt/qt5/qtdeclarative-render2d_git.bb b/recipes-qt/qt=
5/qtdeclarative-render2d_git.bb
> deleted file mode 100644
> index cb2ee8b..0000000
> --- a/recipes-qt/qt5/qtdeclarative-render2d_git.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require qt5.inc
> -require qt5-git.inc
> -
> -LICENSE =3D "GPL-3.0 | The-Qt-Company-TPLA-2.4"
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LICENSE.PREVIEW.COMMERCIAL;md5=3Dc458c2ae1b463cca5219eaee54f6=
287e \
> -"
> -
> -DEPENDS +=3D "qtbase qtdeclarative"
> -
> -SRCREV =3D "13a6c51f26128015c0a3c335bdae676b46df6ed6"
> diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.pa=
tch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
> deleted file mode 100644
> index b71e3a4..0000000
> --- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From 0d742f34ef91fb4e35c68b1274f68daef594f0c3 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> -Date: Sun, 26 May 2013 14:26:19 +0200
> -Subject: [PATCH] qmltestexample: fix link
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -else we get :
> -ld: warning: libQt5Quick.so.5, needed by libQt5QuickTest.so, not found
> -
> -Upstream-Status: Inappropriate
> -
> -Change-Id: I63088ff73bec6a8559dfae132f8bd40b62487450
> -Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - examples/qmltest/qmltest/qmltest.pro   | 2 +-
> - tests/auto/qml/qjsengine/qjsengine.pro | 2 +-
> - tests/auto/qmltest/qmltest.pro         | 1 +
> - tools/qmltestrunner/qmltestrunner.pro  | 2 +-
> - 4 files changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qml=
test/qmltest.pro
> -index b5893c5..1b00e6c 100644
> ---- a/examples/qmltest/qmltest/qmltest.pro
> -+++ b/examples/qmltest/qmltest/qmltest.pro
> -@@ -14,7 +14,7 @@ TESTDATA +=3D tst_basic.qml tst_item.qml
> - # This code exists solely for the purpose of building this example
> - # inside the examples/ hierarchy.
> -=20
> --QT +=3D qml qmltest
> -+QT +=3D qml qmltest quick
> -=20
> - macx: CONFIG -=3D app_bundle
> -=20
> -diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjs=
engine/qjsengine.pro
> -index c9d78e2..5861613 100644
> ---- a/tests/auto/qml/qjsengine/qjsengine.pro
> -+++ b/tests/auto/qml/qjsengine/qjsengine.pro
> -@@ -1,6 +1,6 @@
> - CONFIG +=3D testcase
> - TARGET =3D tst_qjsengine
> --QT +=3D  qml qml-private widgets testlib gui-private
> -+QT +=3D  qml qml-private widgets testlib gui-private quick
> - macx:CONFIG -=3D app_bundle
> - SOURCES +=3D tst_qjsengine.cpp
> - RESOURCES +=3D qjsengine.qrc
> -diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest=
=2Epro
> -index 52fd6bf..843cae6 100644
> ---- a/tests/auto/qmltest/qmltest.pro
> -+++ b/tests/auto/qmltest/qmltest.pro
> -@@ -4,6 +4,7 @@ CONFIG +=3D qmltestcase
> - CONFIG +=3D console
> - SOURCES +=3D tst_qmltest.cpp
> -=20
> -+QT +=3D quick
> -=20
> - importFiles.files =3D borderimage  buttonclick  createbenchmark  events=
  qqmlbinding selftests
> -=20
> -diff --git a/tools/qmltestrunner/qmltestrunner.pro b/tools/qmltestrunner=
/qmltestrunner.pro
> -index 1bb913e..56f2dd5 100644
> ---- a/tools/qmltestrunner/qmltestrunner.pro
> -+++ b/tools/qmltestrunner/qmltestrunner.pro
> -@@ -1,6 +1,6 @@
> - SOURCES +=3D main.cpp
> -=20
> --QT +=3D qml qmltest
> -+QT +=3D qml qmltest quick
> - CONFIG +=3D no_import_scan
> -=20
> - load(qt_tool)
> diff --git a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-Q=
CoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0002-qquick=
viewcomparison-fix-QCoreApplication-has-not-be.patch
> deleted file mode 100644
> index d0d0f8e..0000000
> --- a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApp=
lication-has-not-be.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 6b1cef42f828cd2374739aa7e3b3800d579315d6 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Thu, 31 Mar 2016 19:38:58 -0400
> -Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
> - declared error
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow=
=2Eh b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> -index 5b86c93..e77514e 100644
> ---- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> -+++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> -@@ -44,6 +44,7 @@
> - #include <QWidget>
> - #include <QQuickWidget>
> - #include <QQuickView>
> -+#include <QCoreApplication>
> -=20
> - QT_FORWARD_DECLARE_CLASS(QRadioButton)
> - QT_FORWARD_DECLARE_CLASS(QCheckBox)
> diff --git a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQm=
l-code-related-to-dead-sto.patch b/recipes-qt/qt5/qtdeclarative/0003-Workar=
ound-crashes-in-QtQml-code-related-to-dead-sto.patch
> deleted file mode 100644
> index d3ee42e..0000000
> --- a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-=
related-to-dead-sto.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From fcc2c95421710f98c7b2dec73e2c8b0d9164bc9b Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Wed, 24 Aug 2016 11:18:37 +1000
> -Subject: [PATCH] Workaround crashes in QtQml code related to dead-store
> - elimination
> -
> -When compiled in release mode with GCC 6, QtQml may crash.
> -This is because the C++ compiler is more aggressive about dead-store
> -elimination in situations where a memory store to a location precedes
> -the construction of an object at that memory location.
> -
> -The QV4::MemoryManager::allocate{Managed,Object} functions allocate
> -memory and write to it before the caller does a placement new to
> -construct an object in the same memory. The compiler considers these
> -writes before the constructor as "dead stores" and eliminates them.
> -
> -The -fno-lifetime-dse compiler flag is added to disable this more
> -aggressive dead-store eliminiation optimization.
> -
> -This is a temporary workaround until a proper solution is found.
> -
> -Upstream-Status: Accepted
> -
> -Task-number: QTBUG-55482
> -Change-Id: I7dbae6e9e613e53ce5fb25957c449bc6657803b5
> -Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - src/qml/qml.pro | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/qml/qml.pro b/src/qml/qml.pro
> -index f4862a1..651afa6 100644
> ---- a/src/qml/qml.pro
> -+++ b/src/qml/qml.pro
> -@@ -18,7 +18,7 @@ exists("qqml_enable_gcov") {
> -=20
> - greaterThan(QT_GCC_MAJOR_VERSION, 5) {
> -     # Our code is bad. Temporary workaround.
> --    QMAKE_CXXFLAGS +=3D -fno-delete-null-pointer-checks
> -+    QMAKE_CXXFLAGS +=3D -fno-delete-null-pointer-checks -fno-lifetime-d=
se
> - }
> -=20
> - QMAKE_DOCS =3D $$PWD/doc/qtqml.qdocconf
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdecla=
rative_git.bb
> index 2633be7..a620a00 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -16,14 +16,6 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRC_URI +=3D " \
> -    file://0001-qmltestexample-fix-link.patch \
> -    file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.pat=
ch \
> -    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.pat=
ch \
> -"
> -
> -EXTRA_OEMAKE +=3D "QMAKE_SYNCQT=3D${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/sy=
ncqt"
> -
>  PACKAGECONFIG ??=3D "qtxmlpatterns"
>  PACKAGECONFIG[qtxmlpatterns] =3D ",,qtxmlpatterns"
> =20
> @@ -31,13 +23,15 @@ do_configure_prepend() {
>      # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
>      sed -e 's/^\(qtHaveModule(xmlpatterns)\)/OE_QTXMLPATTERNS_ENABLED:\1=
/' -i ${S}/src/imports/imports.pro
>      sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|=
\1/' -i ${S}/tests/auto/quick/quick.pro
> +}
> =20
> -    #set the path for syncqt properly
> -    echo "QT_TOOL.syncqt.binary =3D \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS=
}/syncqt\"" > ${B}/.qmake.cache
> +do_install_append_class-nativesdk() {
> +    # qml files not needed in nativesdk
> +    rm -rf ${D}${OE_QMAKE_PATH_QML}
>  }
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpa=
tterns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
> =20
> -SRCREV =3D "d48b397cc79265e80c8437888f9ded0b0364e418"
> +SRCREV =3D "fffb997e192a72b4dcd66edc2fbad5473dd359f3"
> =20
>  BBCLASSEXTEND =3D+ "native nativesdk"
> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_g=
it.bb
> index e77d358..2f32a88 100644
> --- a/recipes-qt/qt5/qtenginio_git.bb
> +++ b/recipes-qt/qt5/qtenginio_git.bb
> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
> =20
> -SRCREV =3D "cedca298f081e1c1cdac615eed6171fe687f35e2"
> +QT_MODULE_BRANCH =3D "dev"
> +SRCREV =3D "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
> =20
>  do_install_append() {
>      if ls ${D}${libdir}/pkgconfig/Enginio.pc >/dev/null 2>/dev/null; then
> diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_g=
it.bb
> new file mode 100644
> index 0000000..6abf8b7
> --- /dev/null
> +++ b/recipes-qt/qt5/qtgamepad_git.bb
> @@ -0,0 +1,17 @@
> +require qt5.inc
> +require qt5-git.inc
> +
> +LICENSE =3D "GPL-3.0 | LGPL-3.0 | The-Qt-Company-Commercial"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +"
> +
> +DEPENDS +=3D "qtbase qtxmlpatterns qtdeclarative"
> +
> +PACKAGECONFIG ??=3D "sdl2"
> +PACKAGECONFIG[sdl2] =3D "-feature-sdl2,-no-feature-sdl2,libsdl2"
> +
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> +
> +SRCREV =3D "13bbe6ea378d127b9b1d70e2858e41e86e754dc7"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qt=
graphicaleffects_git.bb
> index 6c62a68..f4b43e7 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> @@ -4,13 +4,13 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> @@ -19,4 +19,4 @@ DEPENDS +=3D "qtdeclarative"
> =20
>  RDEPENDS_${PN}-dev =3D ""
> =20
> -SRCREV =3D "d3023be0d839440ac046adf2af75d9e4306dd5ef"
> +SRCREV =3D "1583bb5569cfc50141d879107a46146d5ccccf28"
> diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-t=
he-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtim=
ageformats.pro-Make-the-dependencies-determinist.patch
> deleted file mode 100644
> index 03432c9..0000000
> --- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-depe=
ndencies-determinist.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 7eb3fddc70871048f170211a88194c8cdeeca4dd Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Mon, 4 Aug 2014 19:19:05 +0200
> -Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - qtimageformats.pro | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/qtimageformats.pro b/qtimageformats.pro
> -index 8382e5c..63d13ce 100644
> ---- a/qtimageformats.pro
> -+++ b/qtimageformats.pro
> -@@ -1,9 +1,9 @@
> - requires(qtHaveModule(gui))
> -=20
> - load(configure)
> --qtCompileTest(jasper)
> --qtCompileTest(libmng)
> --qtCompileTest(libtiff)
> --qtCompileTest(libwebp)
> -+OE_JASPER_ENABLED:qtCompileTest(jasper)
> -+OE_LIBMNG_ENABLED:qtCompileTest(libmng)
> -+OE_LIBTIFF_ENABLED:qtCompileTest(libtiff)
> -+OE_LIBWEBP_ENABLED:qtCompileTest(libwebp)
> -=20
> - load(qt_parts)
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimag=
eformats_git.bb
> index 7f8179e..3725441 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -4,32 +4,26 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> -ALLOW_EMPTY_${PN} =3D "1"
> -
> -SRC_URI +=3D "file://0001-qtimageformats.pro-Make-the-dependencies-deter=
minist.patch"
> =20
>  PACKAGECONFIG ?=3D "libtiff"
>  # Currently we don't have recipe for libmng, but lock it anyway so qtima=
geformats stay deterministic even when libmng is introduced
> -PACKAGECONFIG[jasper] =3D ",,jasper"
> -PACKAGECONFIG[libmng] =3D ",,libmng"
> -PACKAGECONFIG[libtiff] =3D ",,tiff"
> -PACKAGECONFIG[libwebp] =3D ",,libwebp"
> +PACKAGECONFIG[jasper] =3D ",CONFIG+=3Ddone_config_jasper,jasper"
> +PACKAGECONFIG[libmng] =3D ",CONFIG+=3Ddone_config_libmng,libmng"
> +PACKAGECONFIG[libtiff] =3D ",CONFIG+=3Ddone_config_libtiff,tiff"
> +PACKAGECONFIG[libwebp] =3D ",CONFIG+=3Ddone_config_libwebp,libwebp"
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libmng'=
, 'CONFIG+=3DOE_LIBMNG_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'jasper'=
, 'CONFIG+=3DOE_JASPER_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libtiff=
', 'CONFIG+=3DOE_LIBTIFF_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libwebp=
', 'CONFIG+=3DOE_LIBWEBP_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
> -SRCREV =3D "d4401c9f519dfe82c38fe9ded674e454655f1866"
> +SRCREV =3D "cd2de115c6216ad747cf4803e65a4ce4af220795"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation=
_git.bb
> index 7a9ecb4..f25d57e 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -3,30 +3,21 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Excepti=
on-1.1 | LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS +=3D "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
> =20
>  PACKAGECONFIG ??=3D ""
> -# older geoclue 0.x is needed
> -PACKAGECONFIG[geoclue] =3D "OE_GEOCLUE_ENABLED,,gconf geoclue"
> -PACKAGECONFIG[gypsy] =3D "OE_GYPSY_ENABLED,,gconf gypsy"
> +# older geoclue 0.12.99 is needed
> +PACKAGECONFIG[geoclue] =3D ",,geoclue"
> +PACKAGECONFIG[gypsy] =3D "-feature-gypsy,-no-feature-gypsy,gconf gypsy"
> =20
> -do_configure_prepend() {
> -    # disable geoclue tests if it isn't enabled by PACKAGECONFIG
> -    sed -i -e 's/^\(qtCompileTest(geoclue)\)/OE_GEOCLUE_ENABLED:\1/' ${S=
}/qtlocation.pro
> -    sed -i -e 's/^\(qtCompileTest(geoclue-satellite)\)/OE_GEOCLUE_ENABLE=
D:\1/' ${S}/qtlocation.pro
> -    # disable gypsy test if it isn't enabled by PACKAGECONFIG
> -    sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qt=
location.pro
> -}
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'geoclue=
', 'CONFIG+=3DOE_GEOCLUE_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gypsy',=
 'CONFIG+=3DOE_GYPSY_ENABLED', '', d)}"
> -
> -SRCREV =3D "4e1008b4ac1eea776585ca41a6a3db127cf500ff"
> +SRCREV =3D "41cc347040226d2c5c16b9df001d03f2724b87e5"
> diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-G=
Streamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effor=
t-to-GStreamer-1.0.patch
> deleted file mode 100644
> index fa6b585..0000000
> --- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreame=
r-1.0.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 26fd6cf787a7a413d54205b8b42d16a63ed5d36a Mon Sep 17 00:00:00 2001
> -From: Yoann Lopes <yoann.lopes@digia.com>
> -Date: Thu, 31 Oct 2013 15:06:30 +0100
> -Subject: [PATCH] Initial porting effort to GStreamer 1.0.
> -
> -* It's already included in 5.5 with this commit:
> -  commit 108dda7a90bd0f0337358b0db47ae55acd16dea6
> -  Author: Yoann Lopes <yoann.lopes@theqtcompany.com>
> -  Date:   Thu Nov 20 17:54:18 2014 +0100
> -  GStreamer: port to 1.0.
> -* here we restore only the done_config_gstreamer variable
> -  to explicitly disable it from OE build
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - qtmultimedia.pro | 26 ++++++++++++++------------
> - 1 file changed, 14 insertions(+), 12 deletions(-)
> -
> -diff --git a/qtmultimedia.pro b/qtmultimedia.pro
> -index 98bb315..287887f 100644
> ---- a/qtmultimedia.pro
> -+++ b/qtmultimedia.pro
> -@@ -17,19 +17,21 @@ win32 {
> -     contains(QT_CONFIG, alsa):qtCompileTest(alsa)
> -     contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
> -=20
> --    isEmpty(GST_VERSION) {
> --        contains(QT_CONFIG, gstreamer-0.10) {
> --            GST_VERSION =3D 0.10
> --        } else: contains(QT_CONFIG, gstreamer-1.0) {
> --            GST_VERSION =3D 1.0
> -+    !done_config_gstreamer {
> -+        isEmpty(GST_VERSION) {
> -+            contains(QT_CONFIG, gstreamer-0.10) {
> -+                GST_VERSION =3D 0.10
> -+            } else: contains(QT_CONFIG, gstreamer-1.0) {
> -+                GST_VERSION =3D 1.0
> -+            }
> -+        }
> -+        cache(GST_VERSION, set)
> -+        !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
> -+            qtCompileTest(gstreamer_photography)
> -+            qtCompileTest(gstreamer_encodingprofiles)
> -+            qtCompileTest(gstreamer_appsrc)
> -+            qtCompileTest(linux_v4l)
> -         }
> --    }
> --    cache(GST_VERSION, set)
> --    !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
> --        qtCompileTest(gstreamer_photography)
> --        qtCompileTest(gstreamer_encodingprofiles)
> --        qtCompileTest(gstreamer_appsrc)
> --        qtCompileTest(linux_v4l)
> -     }
> -=20
> -     qtCompileTest(resourcepolicy)
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultim=
edia_git.bb
> index 245f106..7d3c3cc 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -18,25 +18,19 @@ DEPENDS +=3D "qtdeclarative"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',=
 'pulseaudio', '', d)}"
> -PACKAGECONFIG[alsa] =3D ",,alsa-lib"
> -PACKAGECONFIG[pulseaudio] =3D ",,pulseaudio"
> -PACKAGECONFIG[openal] =3D ",,openal-soft"
> -PACKAGECONFIG[gstreamer] =3D ",,gstreamer1.0 gstreamer1.0-plugins-base g=
streamer1.0-plugins-bad"
> -PACKAGECONFIG[gstreamer010] =3D ",,gstreamer gst-plugins-base gst-plugin=
s-bad"
> +PACKAGECONFIG[alsa] =3D "-alsa,-no-alsa,alsa-lib"
> +PACKAGECONFIG[pulseaudio] =3D "-pulseaudio,-no-pulseaudio,pulseaudio"
> +PACKAGECONFIG[openal] =3D "-feature-openal,-no-feature-openal,openal-sof=
t"
> +PACKAGECONFIG[gstreamer] =3D "-gstreamer 1.0,,gstreamer1.0 gstreamer1.0-=
plugins-base gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[gstreamer010] =3D "-gstreamer 0.10,,gstreamer gst-plugins-=
base gst-plugins-bad"
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'alsa', =
'', 'CONFIG+=3Ddone_config_alsa', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pulseau=
dio', '', 'CONFIG+=3Ddone_config_pulseaudio', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'openal'=
, '', 'CONFIG+=3Ddone_config_openal', d)}"
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
> -# Handles GStreamer support
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gstream=
er', 'GST_VERSION=3D1.0', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gstream=
er010', 'GST_VERSION=3D0.10', '', d)}"
>  # Disable GStreamer if completely disabled
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains_any('PACKAGECONFIG', 'gst=
reamer gstreamer010', '', 'CONFIG+=3Ddone_config_gstreamer', d)}"
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${@bb.utils.contains_any('PACKAGECONFIG'=
, 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
> =20
>  SRC_URI +=3D "\
> -    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>      file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
>  "
> =20
> -SRCREV =3D "1be4f74843b41f8bc1d1d64e83485f4eb864e8b4"
> +SRCREV =3D "544a8a4251ff9694780e563ddb6e4af1325e0115"
> diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetwo=
rkauth_git.bb
> new file mode 100644
> index 0000000..5657c86
> --- /dev/null
> +++ b/recipes-qt/qt5/qtnetworkauth_git.bb
> @@ -0,0 +1,13 @@
> +LICENSE =3D "BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-C=
ompany-Commercial"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +"
> +
> +require qt5.inc
> +require qt5-git.inc
> +
> +DEPENDS +=3D "qtbase"
> +
> +SRCREV =3D "ec7663382bc6382323f3261ab199ec2edbeb5e37"
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
=2Ebb
> index 4107c3a..e9b6185 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
>      file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> @@ -23,4 +22,5 @@ do_configure_prepend() {
>      sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):=
!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
>  }
> =20
> -SRCREV =3D "857fc5ec4644a6111ba8725e4e1a84dd5ea6bfca"
> +QT_MODULE_BRANCH =3D "dev"
> +SRCREV =3D "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtqu=
ickcontrols2_git.bb
> index 7271a19..42acb8a 100644
> --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> @@ -4,10 +4,10 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.LGPLv3;md5=3D8ba7f2099d17d636d5fcc8303bb17587 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv3;md5=3Da37e6cd7102174853307e03e6edc5f30 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>  "
> =20
>  DEPENDS +=3D "qtdeclarative"
> =20
> -SRCREV =3D "cc0ee8e4f3345023f1b85fc815739c0a75ea5686"
> +SRCREV =3D "6f7852a307c7ebbdb3b6efa00cbf7626b072bbc1"
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtqui=
ckcontrols_git.bb
> index 176035c..69f3d3b 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -4,12 +4,12 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -21,4 +21,4 @@ SRC_URI +=3D " \
>      file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.pat=
ch \
>  "
> =20
> -SRCREV =3D "37f8b753be1b16975220c8b611b17a428eafb9e9"
> +SRCREV =3D "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git=
=2Ebb
> index bee833d..3f8b64a 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "b8845794b95376e8be39dbdafca2c85b5ec4c195"
> +SRCREV =3D "c35df2ec0ee05351912e768d298a7c627dbdd1ef"
> diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-c=
make-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-fo=
r-cmake-file.patch
> new file mode 100644
> index 0000000..0b90a66
> --- /dev/null
> +++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-fi=
le.patch
> @@ -0,0 +1,28 @@
> +From 210049f0e53f7fb8e5c44325b13947add9618f89 Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Tue, 10 Jan 2017 15:28:26 +0200
> +Subject: [PATCH] Use external host bin path for cmake file
> +
> +Need to use ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} for cmake to find the
> +qscxmlc tool from correct sysroot path.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> +Change-Id: Idb814be705e9cbaad7f1e68b5d7cdb79c4b65008
> +---
> + src/scxml/Qt5ScxmlConfigExtras.cmake.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/scxml/Qt5ScxmlConfigExtras.cmake.in b/src/scxml/Qt5Scxm=
lConfigExtras.cmake.in
> +index edb320a..c2f8be8 100644
> +--- a/src/scxml/Qt5ScxmlConfigExtras.cmake.in
> ++++ b/src/scxml/Qt5ScxmlConfigExtras.cmake.in
> +@@ -40,7 +40,7 @@ if (NOT TARGET Qt5::qscxmlc)
> + !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
> +     set(imported_location \"${_qt5Scxml_install_prefix}/$${CMAKE_BIN_DI=
R}qscxmlc$$CMAKE_BIN_SUFFIX\")
> + !!ELSE
> +-    set(imported_location \"$${CMAKE_BIN_DIR}qscxmlc$$CMAKE_BIN_SUFFIX\=
")
> ++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qscxmlc=
$$CMAKE_BIN_SUFFIX\")
> + !!ENDIF
> +     _qt5_Scxml_check_file_exists(${imported_location})
> +=20
> diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
> new file mode 100644
> index 0000000..d69d00f
> --- /dev/null
> +++ b/recipes-qt/qt5/qtscxml_git.bb
> @@ -0,0 +1,22 @@
> +LICENSE =3D "LGPL-3.0 & BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0=
 | The-Qt-Company-Commercial"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> +    file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +"
> +
> +require qt5.inc
> +require qt5-git.inc
> +
> +DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
> +
> +SRCREV =3D "4704292500b98143eee9b0fb0b6a34a858ed1253"
> +
> +SRC_URI +=3D "file://0001-Use-external-host-bin-path-for-cmake-file.patc=
h"
> +
> +do_install_append_class-nativesdk() {
> +    # qml files not needed in nativesdk
> +    rm -rf ${D}${OE_QMAKE_PATH_QML}
> +}
> +
> +BBCLASSEXTEND =3D+ "native nativesdk"
> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_g=
it.bb
> index af45d89..93a0971 100644
> --- a/recipes-qt/qt5/qtsensors_git.bb
> +++ b/recipes-qt/qt5/qtsensors_git.bb
> @@ -3,14 +3,14 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -SRCREV =3D "e03c37077ea4841b9e0b591d29a34737d7d8dd32"
> +SRCREV =3D "1220a31e6c2f91b34b4a05773621dddab8c4315a"
> diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialb=
us_git.bb
> index 397ac4e..325d975 100644
> --- a/recipes-qt/qt5/qtserialbus_git.bb
> +++ b/recipes-qt/qt5/qtserialbus_git.bb
> @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtserialport"
> =20
> -SRCREV =3D "88554d068d287870740b842864a50604f53e8509"
> +SRCREV =3D "c8fe92ef54b2d310e8c8c143962fd6f43bf46c27"
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserial=
port_git.bb
> index d5f37d5..edecc04 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -5,14 +5,14 @@ require qt5-git.inc
>  # other qt* components use :/
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Excepti=
on-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3Dbb426f3367c4805d1e12fad05bd0b750 \
>      file://LICENSE.FDL;md5=3D3801d7932fdc07fd9efe89f9854a6caa \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "7346857f4f675f57572d54f15cfad9111af2abde"
> +SRCREV =3D "74aad2578ecb6739007449a06a54dd7abd64c85b"
> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> index 21e06ff..24a0d91 100644
> --- a/recipes-qt/qt5/qtsvg_git.bb
> +++ b/recipes-qt/qt5/qtsvg_git.bb
> @@ -3,13 +3,13 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "64ca369c7e3d61f0416bc1fd6a102f0c62924433"
> +SRCREV =3D "1b3a7ae14d25f1caa3f6bedad3cfeb7d83b3904e"
> diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lup=
date-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrele=
ase-lupdate-lconvert.patch
> deleted file mode 100644
> index 94cd048..0000000
> --- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lc=
onvert.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -From 68ecc4f25789321fc29ec9e4981fcfa27e706f1c Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.jansa@gmail.com>
> -Date: Wed, 11 Sep 2013 18:30:08 +0200
> -Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
> -
> -This is useful e.g. when cross compiling with OpenEmbedded where qtbase-=
native
> -is built without GUI support (no-png is set) and we still want to build
> -native lrelease + lupdate + lconvert tools.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - examples/examples.pro     |  3 ++-
> - src/designer/src/src.pro  | 18 ++++++++++--------
> - src/linguist/linguist.pro |  2 +-
> - src/src.pro               | 16 +++++++++-------
> - tests/auto/auto.pro       | 24 +++++++++++++-----------
> - 5 files changed, 35 insertions(+), 28 deletions(-)
> -
> -diff --git a/examples/examples.pro b/examples/examples.pro
> -index 69365d1..da7b38b 100644
> ---- a/examples/examples.pro
> -+++ b/examples/examples.pro
> -@@ -1,4 +1,5 @@
> - TEMPLATE =3D subdirs
> --qtHaveModule(widgets): SUBDIRS +=3D help designer linguist uitools assi=
stant
> -+!linguistonly:qtHaveModule(widgets): SUBDIRS +=3D help designer assista=
nt
> -+qtHaveModule(widgets): SUBDIRS +=3D linguist uitools
> -=20
> - winrt: SUBDIRS -=3D assistant designer
> -diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
> -index 6915e34..3ff2eca 100644
> ---- a/src/designer/src/src.pro
> -+++ b/src/designer/src/src.pro
> -@@ -1,13 +1,15 @@
> - TEMPLATE =3D subdirs
> -=20
> --SUBDIRS =3D \
> --    uiplugin \
> --    uitools \
> --    lib \
> --    components \
> --    designer
> -+!linguistonly {
> -+    SUBDIRS =3D \
> -+        uiplugin \
> -+        lib \
> -+        components \
> -+        designer
> -+}
> -+SUBDIRS +=3D uitools
> -=20
> --contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
> -+!linguistonly:contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
> -=20
> - uitools.depends =3D uiplugin
> - lib.depends =3D uiplugin
> -@@ -15,7 +17,7 @@ components.depends =3D lib
> - designer.depends =3D components
> - plugins.depends =3D lib
> -=20
> --qtNomakeTools( \
> -+!linguistonly:qtNomakeTools( \
> -     lib \
> -     components \
> -     designer \
> -diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
> -index 3a70580..a977878 100644
> ---- a/src/linguist/linguist.pro
> -+++ b/src/linguist/linguist.pro
> -@@ -3,7 +3,7 @@ SUBDIRS  =3D \
> -     lrelease \
> -     lupdate \
> -     lconvert
> --!no-png:qtHaveModule(widgets): SUBDIRS +=3D linguist
> -+!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS +=3D linguist
> -=20
> - qtNomakeTools( \
> -     linguist \
> -diff --git a/src/src.pro b/src/src.pro
> -index 387d54f..56b7d0c 100644
> ---- a/src/src.pro
> -+++ b/src/src.pro
> -@@ -4,19 +4,21 @@ qtHaveModule(widgets) {
> -     no-png {
> -         message("Some graphics-related tools are unavailable without PN=
G support")
> -     } else {
> --        SUBDIRS =3D assistant \
> -+        !linguistonly {
> -+            SUBDIRS =3D assistant \
> -                   pixeltool \
> --                  qtestlib \
> --                  designer
> -+                  qtestlib
> -+        }
> -+        SUBDIRS +=3D designer
> -=20
> -         linguist.depends =3D designer
> -     }
> - }
> -=20
> - SUBDIRS +=3D linguist \
> --    qdoc \
> -     qtplugininfo
> --if(!android|android_app):!ios: SUBDIRS +=3D qtpaths
> -+!linguistonly: SUBDIRS +=3D  qdoc
> -+if(!android|android_app):!ios:!linguistonly: SUBDIRS +=3D qtpaths
> -=20
> - mac {
> -     SUBDIRS +=3D macdeployqt
> -@@ -26,11 +28,11 @@ android {
> -     SUBDIRS +=3D androiddeployqt
> - }
> -=20
> --qtHaveModule(dbus): SUBDIRS +=3D qdbus
> -+!linguistonly:qtHaveModule(dbus): SUBDIRS +=3D qdbus
> -=20
> - win32|winrt:SUBDIRS +=3D windeployqt
> - winrt:SUBDIRS +=3D winrtrunner
> --qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS +=3D qtdiag
> -+!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBD=
IRS +=3D qtdiag
> -=20
> - qtNomakeTools( \
> -     pixeltool \
> -diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
> -index 20b5fec..8a42d1f 100644
> ---- a/tests/auto/auto.pro
> -+++ b/tests/auto/auto.pro
> -@@ -1,15 +1,17 @@
> - TEMPLATE=3Dsubdirs
> --SUBDIRS=3D\
> --    linguist \
> --    qhelpcontentmodel \
> --    qhelpenginecore \
> --    qhelpgenerator \
> --    qhelpindexmodel \
> --    qhelpprojectdata \
> --    cmake \
> --    installed_cmake \
> --    qtdiag \
> --    windeployqt
> -+!linguistonly {
> -+    SUBDIRS=3D\
> -+        linguist \
> -+        qhelpcontentmodel \
> -+        qhelpenginecore \
> -+        qhelpgenerator \
> -+        qhelpindexmodel \
> -+        qhelpprojectdata \
> -+        cmake \
> -+        installed_cmake \
> -+        qtdiag \
> -+        windeployqt
> -+}
> -=20
> - installed_cmake.depends =3D cmake
> -=20
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> index 56c1205..a2b01be 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D " \
>  DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
> =20
>  SRC_URI +=3D " \
> -    file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
>      file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
>      file://0003-add-noqtwebkit-configuration.patch \
>      file://0004-linguist-tools-cmake-allow-overriding-the-location-f.pat=
ch \
> @@ -27,14 +26,10 @@ FILES_${PN}-tools +=3D "${datadir}${QT_DIR_NAME}/phra=
sebooks"
>  FILES_${PN}-examples =3D "${datadir}${QT_DIR_NAME}/examples"
> =20
>  PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG_class-native ??=3D "linguistonly"
> -PACKAGECONFIG_class-nativesdk ??=3D "linguistonly"
> -PACKAGECONFIG[linguistonly] =3D ""
>  PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtwebki=
t', '', 'CONFIG+=3Dnoqtwebkit', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'linguis=
tonly', 'CONFIG+=3Dlinguistonly', '', d)}"
> =20
> -SRCREV =3D "0597b535f82d3458a1db1828c5e5f725bbcf59fd"
> +SRCREV =3D "30c10900adecca55faa1d59c2f0caac74b1f9df6"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttran=
slations_git.bb
> index 2a37d14..53ab199 100644
> --- a/recipes-qt/qt5/qttranslations_git.bb
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -114,4 +114,4 @@ FILES_${PN}-qt =3D " \
>      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
>  "
> =20
> -SRCREV =3D "2209b3fd6a56bfc44da5369c4fbd345bbca31777"
> +SRCREV =3D "c0ae29b2328922f16cb2305f8579c2a869c871b0"
> diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtv=
irtualkeyboard_git.bb
> index 7e2f445..08914b1 100644
> --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> @@ -33,6 +33,7 @@ PACKAGECONFIG[lang-ko_KR] =3D "CONFIG+=3Dlang-ko_KR"
>  PACKAGECONFIG[lang-nb_NO] =3D "CONFIG+=3Dlang-nb_NO"
>  PACKAGECONFIG[lang-pl_PL] =3D "CONFIG+=3Dlang-pl_PL"
>  PACKAGECONFIG[lang-pt_PT] =3D "CONFIG+=3Dlang-pt_PT"
> +PACKAGECONFIG[lang-ro_RO] =3D "CONFIG+=3Dlang-ro_RO"
>  PACKAGECONFIG[lang-ru_RU] =3D "CONFIG+=3Dlang-ru_RU"
>  PACKAGECONFIG[lang-sv_SE] =3D "CONFIG+=3Dlang-sv_SE"
>  PACKAGECONFIG[lang-zh_CN] =3D "CONFIG+=3Dlang-zh_CN"
> @@ -48,4 +49,4 @@ FILES_${PN} +=3D "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboa=
rd/lipi_toolkit"
> =20
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qt=
xmlpatterns"
> =20
> -SRCREV =3D "626e78c9660cff063e1f9370538b5a424631571c"
> +SRCREV =3D "cfa4ab4cbf13971d4b71ee920353822755a3bf31"
> diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwa=
yland-native_git.bb
> deleted file mode 100644
> index 1149aa5..0000000
> --- a/recipes-qt/qt5/qtwayland-native_git.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -require qt5-native.inc
> -require qt5-git.inc
> -
> -LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
=2E0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company=
-Commercial )"
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> -    file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> -    file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
> -    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -"
> -
> -DEPENDS =3D "qtbase-native wayland-native"
> -
> -SRC_URI +=3D " \
> -    file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.pat=
ch \
> -    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.pat=
ch \
> -"
> -
> -do_configure() {
> -    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S}/src/qtwaylandscan=
ner
> -}
> -
> -do_install() {
> -    oe_runmake install INSTALL_ROOT=3D${D}
> -}
> -
> -SRCREV =3D "a172672484b9496819e588b51ac2ff9fb4a21941"
> diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegr=
ation-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-o=
f-QWaylandIntegration-if-some-Qt5-feat.patch
> deleted file mode 100644
> index d173e67..0000000
> --- a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-i=
f-some-Qt5-feat.patch
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D <=
dachaac@gmail.com>
> -Date: Sun, 18 Sep 2016 11:51:59 +0300
> -Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 feature=
s are
> - disabled.
> -
> -QPlatformIntegration's interface methods are disabled based on QT_NO_OPE=
NGL,
> -QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> -QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> -QtWayland.
> ----
> - src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
> - src/client/qwaylandintegration_p.h | 12 ++++++++++++
> - 2 files changed, 30 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandint=
egration.cpp
> -index 39fff53..481e3d6 100644
> ---- a/src/client/qwaylandintegration.cpp
> -+++ b/src/client/qwaylandintegration.cpp
> -@@ -39,7 +39,9 @@
> - #include "qwaylandinputcontext_p.h"
> - #include "qwaylandshmbackingstore_p.h"
> - #include "qwaylandnativeinterface_p.h"
> -+#ifndef QT_NO_CLIPBOARD
> - #include "qwaylandclipboard_p.h"
> -+#endif
> - #include "qwaylanddnd_p.h"
> - #include "qwaylandwindowmanagerintegration_p.h"
> - #include "qwaylandscreen_p.h"
> -@@ -57,7 +59,9 @@
> - #include <QSocketNotifier>
> -=20
> - #include <qpa/qplatforminputcontextfactory_p.h>
> -+#ifndef QT_NO_ACCESSIBILITY
> - #include <qpa/qplatformaccessibility.h>
> -+#endif
> - #include <qpa/qplatforminputcontext.h>
> -=20
> - #include "qwaylandhardwareintegration_p.h"
> -@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
> -     , mNativeInterface(new QWaylandNativeInterface(this))
> - #ifndef QT_NO_ACCESSIBILITY
> -     , mAccessibility(new QPlatformAccessibility())
> --#else
> --    , mAccessibility(0)
> - #endif
> -     , mClientBufferIntegrationInitialized(false)
> -     , mServerBufferIntegrationInitialized(false)
> -@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
> - {
> -     initializeInputDeviceIntegration();
> -     mDisplay =3D new QWaylandDisplay(this);
> -+#ifndef QT_NO_CLIPBOARD
> -     mClipboard =3D new QWaylandClipboard(mDisplay);
> -+#endif
> -+#ifndef QT_NO_DRAGANDDROP
> -     mDrag =3D new QWaylandDrag(mDisplay);
> --
> -+#endif
> -     QString icStr =3D QPlatformInputContextFactory::requested();
> -     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisp=
lay))
> -                    : mInputContext.reset(QPlatformInputContextFactory::=
create(icStr));
> -@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
> -=20
> - QWaylandIntegration::~QWaylandIntegration()
> - {
> -+#ifndef QT_NO_DRAGANDDROP
> -     delete mDrag;
> -+#endif
> -+#ifndef QT_NO_CLIPBOARD
> -     delete mClipboard;
> -+#endif
> - #ifndef QT_NO_ACCESSIBILITY
> -     delete mAccessibility;
> - #endif
> -@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDa=
tabase() const
> -     return mFontDb;
> - }
> -=20
> -+#ifndef QT_NO_CLIPBOARD
> - QPlatformClipboard *QWaylandIntegration::clipboard() const
> - {
> -     return mClipboard;
> - }
> -+#endif
> -=20
> -+#ifndef QT_NO_DRAGANDDROP
> - QPlatformDrag *QWaylandIntegration::drag() const
> - {
> -     return mDrag;
> - }
> -+#endif
> -=20
> - QPlatformInputContext *QWaylandIntegration::inputContext() const
> - {
> -@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint =
hint) const
> -     return QPlatformIntegration::styleHint(hint);
> - }
> -=20
> -+#ifndef QT_NO_ACCESSIBILITY
> - QPlatformAccessibility *QWaylandIntegration::accessibility() const
> - {
> -     return mAccessibility;
> - }
> -+#endif
> -=20
> - QPlatformServices *QWaylandIntegration::services() const
> - {
> -diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandint=
egration_p.h
> -index 987d805..b50ad95 100644
> ---- a/src/client/qwaylandintegration_p.h
> -+++ b/src/client/qwaylandintegration_p.h
> -@@ -80,15 +80,21 @@ public:
> -=20
> -     QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
> -=20
> -+#ifndef QT_NO_CLIPBOARD
> -     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
> -+#endif
> -=20
> -+#ifndef QT_NO_DRAGANDDROP
> -     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
> -+#endif
> -=20
> -     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
> -=20
> -     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
> -=20
> -+#ifndef QT_NO_ACCESSIBILITY
> -     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
> -+#endif
> -=20
> -     QPlatformServices *services() const Q_DECL_OVERRIDE;
> -=20
> -@@ -117,12 +123,18 @@ private:
> -     void initializeInputDeviceIntegration();
> -=20
> -     QPlatformFontDatabase *mFontDb;
> -+#ifndef QT_NO_CLIPBOARD
> -     QPlatformClipboard *mClipboard;
> -+#endif
> -+#ifndef QT_NO_DRAGANDDROP
> -     QPlatformDrag *mDrag;
> -+#endif
> -     QWaylandDisplay *mDisplay;
> -     QPlatformNativeInterface *mNativeInterface;
> -     QScopedPointer<QPlatformInputContext> mInputContext;
> -+#ifndef QT_NO_ACCESSIBILITY
> -     QPlatformAccessibility *mAccessibility;
> -+#endif
> -     bool mClientBufferIntegrationInitialized;
> -     bool mServerBufferIntegrationInitialized;
> -     bool mShellIntegrationInitialized;
> ---=20
> -2.7.4
> -
> diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-t=
ool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qt=
waylandscanner-tool-to-the-native-side.patch
> deleted file mode 100644
> index 847ba06..0000000
> --- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-=
the-native-side.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 47457635603ddb484a479834a052699cce5b34a3 Mon Sep 17 00:00:00 2001
> -From: Simon Busch <morphis@gravedo.de>
> -Date: Fri, 19 Jul 2013 13:35:14 +0000
> -Subject: [PATCH] Install the qtwaylandscanner tool to the native side
> -
> -Upstream-Status: Inappropiate [configuration]
> -
> -Signed-off-by: Simon Busch <morphis@gravedo.de>
> ----
> - src/qtwaylandscanner/qtwaylandscanner.pro | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/qtwaylandscanner/qtwaylandscanner.pro b/src/qtwaylandsc=
anner/qtwaylandscanner.pro
> -index ac2d07b..7a46a24 100644
> ---- a/src/qtwaylandscanner/qtwaylandscanner.pro
> -+++ b/src/qtwaylandscanner/qtwaylandscanner.pro
> -@@ -1,6 +1,10 @@
> - option(host_build)
> -=20
> --SOURCES +=3D qtwaylandscanner.cpp
> -+TARGET =3D qtwaylandscanner$$qtPlatformTargetSuffix()
> -+CONFIG +=3D console warn_off
> -+QT =3D core
> -=20
> --load(qt_tool)
> -+SOURCES +=3D qtwaylandscanner.cpp
> -=20
> -+target.path =3D $$[QT_HOST_BINS]
> -+INSTALLS +=3D target
> diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-serve=
r-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayla=
nd-include-server-buffer-only-when-bui.patch
> deleted file mode 100644
> index a21c109..0000000
> --- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffe=
r-only-when-bui.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 733a85c14cb4ade510a0c78b32cd12cb2d70dbbd Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 22 Feb 2014 17:47:44 +0100
> -Subject: [PATCH] examples/wayland: include server-buffer only when build=
ing
> - with opengles2
> -
> -* it's using glBindBuffer in
> -  server-buffer/client/serverbufferrenderer.cpp
> -
> -Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - examples/wayland/wayland.pro | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
> -index 503190c..9943c52 100644
> ---- a/examples/wayland/wayland.pro
> -+++ b/examples/wayland/wayland.pro
> -@@ -10,4 +10,6 @@ qtHaveModule(quick) {
> -     SUBDIRS +=3D custom-extension
> - }
> -=20
> --SUBDIRS +=3D server-buffer
> -+contains(QT_CONFIG, opengles2) {
> -+    SUBDIRS +=3D server-buffer
> -+}
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index e315924..ec41922 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -16,37 +16,30 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> -#FIXME: xkb should be optional; we add it here to fix the build error wi=
thout it
> -#       (https://bugreports.qt.io/browse/QTBUG-54851)
>  PACKAGECONFIG ?=3D " \
> -    compositor-api \
> +    wayland-client \
> +    wayland-server \
>      wayland-egl \
> -    xkb \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx'=
, '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcomposite-egl xcomp=
osite-glx', '', d)} \
>  "
> -
> -PACKAGECONFIG[compositor-api] =3D "CONFIG+=3Dwayland-compositor"
> -PACKAGECONFIG[xcompositor] =3D "CONFIG+=3Dconfig_xcomposite CONFIG+=3Ddo=
ne_config_xcomposite,CONFIG+=3Ddone_config_xcomposite,libxcomposite"
> -PACKAGECONFIG[glx] =3D "CONFIG+=3Dconfig_glx CONFIG+=3Ddone_config_glx,C=
ONFIG+=3Ddone_config_glx,virtual/mesa"
> -PACKAGECONFIG[xkb] =3D "CONFIG+=3Dconfig_xkbcommon CONFIG+=3Ddone_config=
_xkbcommon,CONFIG+=3Ddone_config_xkbcommon,libxkbcommon xproto"
> -PACKAGECONFIG[wayland-egl] =3D "CONFIG+=3Dconfig_wayland_egl CONFIG+=3Dd=
one_config_wayland_egl,CONFIG+=3Ddone_config_wayland_egl,virtual/egl"
> -PACKAGECONFIG[brcm-egl] =3D "CONFIG+=3Dconfig_brcm_egl CONFIG+=3Ddone_co=
nfig_brcm_egl,CONFIG+=3Ddone_config_brcm_egl,virtual/egl"
> -PACKAGECONFIG[drm-egl] =3D "CONFIG+=3Dconfig_drm_egl_server CONFIG+=3Ddo=
ne_config_drm_egl_server,CONFIG+=3Ddone_config_drm_egl_server,libdrm virtua=
l/egl"
> -PACKAGECONFIG[libhybris-egl] =3D "CONFIG+=3Dconfig_libhybris_egl_server =
CONFIG+=3Ddone_config_libhybris_egl_server,CONFIG+=3Ddone_config_libhybris_=
egl_server,libhybris"
> -
> -EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> -
> -FILES_${PN}-plugins +=3D " \
> -    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
> -"
> -
> -FILES_${PN}-plugins-dbg +=3D " \
> -    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
> -"
> -
> -SRC_URI +=3D " \
> -    file://0001-examples-wayland-include-server-buffer-only-when-bui.pat=
ch \
> -    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.pat=
ch \
> -"
> -
> -SRCREV =3D "a172672484b9496819e588b51ac2ff9fb4a21941"
> +PACKAGECONFIG_class-native ?=3D ""
> +PACKAGECONFIG_class-nativesdk ?=3D ""
> +QMAKE_PROFILES_class-native =3D "${S}/src/qtwaylandscanner"
> +QMAKE_PROFILES_class-nativesdk =3D "${S}/src/qtwaylandscanner"
> +B_class-native =3D "${SEPB}/src/qtwaylandscanner"
> +B_class-nativesdk =3D "${SEPB}/src/qtwaylandscanner"
> +
> +PACKAGECONFIG[wayland-client] =3D "-feature-wayland-client,-no-feature-w=
ayland-client"
> +PACKAGECONFIG[wayland-server] =3D "-feature-wayland-server,-no-feature-w=
ayland-server"
> +PACKAGECONFIG[xcomposite-egl] =3D "-feature-xcomposite-egl,-no-feature-x=
composite-egl,libxcomposite"
> +PACKAGECONFIG[xcomposite-glx] =3D "-feature-xcomposite-glx,-no-feature-x=
composite-glx,virtual/mesa"
> +PACKAGECONFIG[wayland-egl] =3D "-feature-wayland-egl,-no-feature-wayland=
-egl,virtual/egl"
> +PACKAGECONFIG[wayland-brcm] =3D "-feature-wayland-brcm,-no-feature-wayla=
nd-brcm,virtual/egl"
> +PACKAGECONFIG[drm-egl-server] =3D "-feature-drm-egl-server,-no-feature-d=
rm-egl-server,libdrm virtual/egl"
> +PACKAGECONFIG[libhybris-egl-server] =3D "-feature-libhybris-egl-server,-=
no-feature-libhybris-egl-server,libhybris"
> +
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> +
> +SRCREV =3D "0e2a950895805457a45abe860bc91a7cc4ba405e"
> +
> +BBCLASSEXTEND =3D+ "native nativesdk"
> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebcha=
nnel_git.bb
> index 45ac814..d5f8685 100644
> --- a/recipes-qt/qt5/qtwebchannel_git.bb
> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> @@ -17,4 +17,4 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtdeclarative qtwebsockets"
> =20
> -SRCREV =3D "3836fd7d12777fc53836a72d6542d2fbf2f20ac9"
> +SRCREV =3D "e3ddde4b26a72d57beeeed4e2d3384896e3a399d"
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index 92d9362..5efc35d 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -20,14 +20,9 @@ DEPENDS +=3D " \
>      libdrm fontconfig pixman openssl pango cairo icu pciutils \
>      libcap \
>      gperf-native \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
>  "
> =20
> -# when qtbase is built with xcb enabled (default with x11 in DISTRO_FEAT=
URES),
> -# qtwebengine will have additional dependencies:
> -# contains(QT_CONFIG, xcb): REQUIRED_PACKAGES +=3D libdrm xcomposite xcu=
rsor xi xrandr xscrnsaver xtst
> -# xscreensaver isn't covered in qtbase DEPENDS
> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxscrnsa=
ver', '', d)}"
> -
>  DEPENDS +=3D "yasm-native"
>  EXTRA_QMAKEVARS_PRE +=3D "GYP_CONFIG+=3Duse_system_yasm"
> =20
> @@ -52,6 +47,7 @@ COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
>  COMPATIBLE_MACHINE_armv6 =3D "(.*)"
>  COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>  COMPATIBLE_MACHINE_armv7ve =3D "(.*)"
> +COMPATIBLE_MACHINE_aarch64 =3D "(.*)"
> =20
>  inherit qmake5
>  inherit gettext
> @@ -65,10 +61,6 @@ def gettext_oeconf(d):
>  require qt5.inc
>  require qt5-git.inc
> =20
> -# To avoid trouble start with not separated build directory
> -SEPB =3D "${S}"
> -B =3D "${SEPB}"
> -
>  export NINJA_PATH=3D"${STAGING_BINDIR_NATIVE}/ninja"
> =20
>  do_configure() {
> @@ -82,11 +74,11 @@ do_configure() {
>      export QMAKE_CACHE_EVAL=3D"${PACKAGECONFIG_CONFARGS}"
> =20
>      # Disable autodetection from sysroot:
> -    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/fal=
se:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/package=
sExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/fal=
se:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$=
package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
> +    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_libvpx:/f=
alse:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExis=
t(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist=
(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/fals=
e:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/fea=
tures/configure.prf
> =20
>      # qmake can't find the OE_QMAKE_* variables on it's own so directly =
passing them as
>      # arguments here
> -    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT=3D"${S}=
" \
> +    ${OE_QMAKE_QMAKE} ${OE_QMAKE_QTCONF} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
>          QMAKE_CXX=3D"${OE_QMAKE_CXX}" QMAKE_CC=3D"${OE_QMAKE_CC}" \
>          QMAKE_LINK=3D"${OE_QMAKE_LINK}" \
>          QMAKE_CFLAGS=3D"${OE_QMAKE_CFLAGS}" \
> @@ -110,7 +102,7 @@ RDEPENDS_${PN}-examples +=3D " \
>      qtdeclarative-qmlplugins \
>  "
> =20
> -QT_MODULE_BRANCH_CHROMIUM =3D "49-based"
> +QT_MODULE_BRANCH_CHROMIUM =3D "53-based"
> =20
>  SRC_URI +=3D " \
>      ${QT_GIT}/qtwebengine-chromium.git;name=3Dchromium;branch=3D${QT_MOD=
ULE_BRANCH_CHROMIUM};destsuffix=3Dgit/src/3rdparty \
> @@ -123,15 +115,11 @@ SRC_URI +=3D " \
>      file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.pat=
ch \
>  "
> =20
> -SRCREV_qtwebengine =3D "dbf7dd27428ff755444eac5e975cb69802ac9771"
> -# This is in git submodule, but we're using the latest in 49-based
> -# SRCREV_chromium =3D "c109a95a067af783e48f93d1cdeca870cda98878"
> -SRCREV_chromium =3D "29c16917b33c26ad32893fa05af971c6c6f50297"
> +SRCREV_qtwebengine =3D "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
> +SRCREV_chromium =3D "15d257fd921f37b32ef643225f21df0ea24c8302"
>  SRCREV =3D "${SRCREV_qtwebengine}"
> =20
>  SRCREV_FORMAT =3D "qtwebengine_chromium"
> =20
> -S =3D "${WORKDIR}/git"
> -
>  # WARNING: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc-=
r0 do_package_qa: QA Issue: ELF binary '/OE/build/oe-core/tmp-glibc/work/i5=
86-oe-linux/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc-r0=
/packages-split/qtwebengine/usr/lib/libQt5WebEngineCore.so.5.6.0' has reloc=
ations in .text [textrel]
>  INSANE_SKIP_${PN} +=3D "textrel"
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtw=
ebkit-examples_git.bb
> index e5075de..84b4d0b 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -17,4 +17,4 @@ DEPENDS +=3D "qtwebkit qtxmlpatterns"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
>  RDEPENDS_${PN}-examples +=3D "${@bb.utils.contains('PACKAGECONFIG_OPENSS=
L', 'openssl', 'ca-certificates', '', d)}"
> =20
> -SRCREV =3D "1ac4ee240214a0e36b504fa1bcbc0c716d50620f"
> +SRCREV =3D "f0898f83abdcacc8bd3bca3479884376b0963398"
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git=
=2Ebb
> index 78ca1f5..657d79c 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -83,4 +83,4 @@ PACKAGES_remove =3D "${PN}-examples-dev ${PN}-examples-=
staticdev ${PN}-examples-db
>  RUBY_SYS =3D "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',=
 'i386').replace('i686', 'i386') }"
>  export RUBYLIB=3D"${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NA=
TIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
> =20
> -SRCREV =3D "76e2732f013732461c09a1d6c6b4c77fcab1c0d0"
> +SRCREV =3D "74ac5b0f3489f9a08d083b6c9607c9d5c2d4afd2"
> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsoc=
kets_git.bb
> index 8c238db..043b394 100644
> --- a/recipes-qt/qt5/qtwebsockets_git.bb
> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> @@ -3,12 +3,12 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1=
 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3Dbb426f3367c4805d1e12fad05bd0b750 \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -SRCREV =3D "8d17ddfc2f62df56ac067bd0f9736c6e8d37aa97"
> +SRCREV =3D "afb3c58d035db1119666c8556c215187be4f64b8"
> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extr=
as_git.bb
> index 9a4d6d7..81c72ec 100644
> --- a/recipes-qt/qt5/qtx11extras_git.bb
> +++ b/recipes-qt/qt5/qtx11extras_git.bb
> @@ -3,14 +3,14 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Excepti=
on-1.1 | LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
> -    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
> +    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "bae8bfc7a811af2bf51b227cbf8467e50a2a149a"
> +SRCREV =3D "54cc3158acfc75d12338df3b678e013909e66f60"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpa=
tterns_git.bb
> index e4c3d7f..c7efaf3 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -16,6 +16,6 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "574d92a43e1fc5480a7f5f79cc6baf566a53349f"
> +SRCREV =3D "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
> =20
>  BBCLASSEXTEND =3D+ "native nativesdk"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIjLwQAKCRA3VSO3ZXaA
HJjSAJ94q3xruMrU6SLfm/UPYiqwRAUy9gCgoXb5q82gGJZTzBoIzbWWiJXLQ6I=
=OLEA
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
