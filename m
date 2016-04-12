Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD7565CB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:20:28 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f198so181025176wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hOeCtKBtYfwjeSnE3Ghu/ZX/Wmm+nGFM0syTwGHYCFs=;
	b=qRZR1V3ANkPcO1+0/5V/5tezGg1e255I8CEMbULEtCQzoPxdTyGYgERhEB+KyM0rWs
	VQI7BN2xtf15kuK3vueacHlFzqdH7rXWqIuBWO9sCVetMhOl93dnvQ4ZYDpE1MnMRYa2
	t/NlYsnT2xuDEvf5WtGZhib8zEvLCe98pX4blSdPG7GUHtNNAwv501rfAMsZkLyAq5wd
	c6ZHE/86QBsI/ISpckSxWTi0zm4uvEOFQkWJNQ12AB0Y5xPbB5FXyyRCYo7fgUJE2MMi
	vR8FT6NQHuCgRuwd9RH7WwZ6+RYDnPcpv3PomU/7s3gzRH++H+ZS9zrF1UPyl6jdK+qt
	M60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hOeCtKBtYfwjeSnE3Ghu/ZX/Wmm+nGFM0syTwGHYCFs=;
	b=asBOdP/bmWZc5HPfkIKytPvhN838ynFqRYkwQSRK1LFJOuJhjD9PQrsJBuxHIPGspv
	SFYNQ6vGOT+ZTkzKrMwaak0jxrtYSeWhuybhnoXzVK6YlbM0bQRDXCKwuARZfi5vRZr1
	FuytQDTznu599KfWLKOzyq7YAeT9j+SBy+wtzh6FWP2U1CWvu5XNy86dTv6zwf5mQv38
	rEI2TbCtAOKxW+IrLT7lmmG9F++/YNXORi0G2iu8VZMQbkpxJmVgr0UnAqBHPzr1ulIc
	lxyVfF8yMFc5Luwav1zjktvc4+EsCNM8ht5mvHK38tb6rWyjsmChKGFM6sU81eK0hV8c
	irdA==
X-Gm-Message-State: AOPr4FVEgRT7zYojpzJMzbRSZruxTtAN6+tBJYAB1bfi1jaZ6ZhyXz3m1JlpozKmg9LGEg==
X-Received: by 10.194.21.102 with SMTP id u6mr2698004wje.124.1460456429262;
	Tue, 12 Apr 2016 03:20:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i5sm32578252wjx.15.2016.04.12.03.20.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 03:20:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Apr 2016 12:22:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412102200.GD2564@jama>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH v2 01/31] qtbase-native: update sources to 5.6.0
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
X-List-Received-Date: Tue, 12 Apr 2016 10:20:29 -0000
X-Groupsio-MsgNum: 60966
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 10, 2016 at 09:41:00PM +0200, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

How did you pick these SRCREVs?

OE @ ~/projects/qt-project/qtbase $ git log --oneline 41706400f605524a5a995=
3714aa0cfbf811dba7e..d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b
d0cdc7a DirectFB: Fix build in C++98 mode
3bcc3037 fix non-git non-prefix shadow builds
ae2d11d Add changelog for 5.6.0
38944d6 Fix syncqt.pl not respecting #pragma qt_no_master_include in files =
with Windows line endings
469e293 Fix crash when a standard bus isn't available
bcdcde0 Doc: Simple CSS style: Convert font-sizes from px to pt
719623a Fix builds without session management.
e7bf0ed Add option to disable "session management by closing windows".


It's actually missing some changes which were included in previous SRCREV, =
I usually use latest in e.g. 5.6 branch
even when it sets the version for next release (e.g. 5.6.1).

OE @ ~/projects/qt-project/qtbase $ git log --oneline d0cdc7ad1e2728caf363a=
bf328b2ad81f2ed5a5b..41706400f605524a5a9953714aa0cfbf811dba7e | tee
4170640 QCocoaMenuItem: Use the right Objective C class forwarding macros
b6bc41f QMenu: Add delegate related notes to OS X-only API
1ffce57 Windows DirectWrite: Improve error messages for font engine creatio=
n.
a5ec716 unhack qt_install_headers vs. lib_bundle
5260c01 load qt_common in qt_helper_lib
1c87c3b remove dead code re CONFIG+=3Dgenerate_pbxbuild_makefile
9868d8a xcb: include <cmath>
13034e6 Make public headers compile with -Wzero-as-null-pointer-constant
3f4eba7 xcb: properly initialize size in millimeters if XRandR is not suppo=
rted
7cd23a7 xcb: Properly initialize available geometry when XRandR is missing
aa85ebc Android: Fix immersive mode
7906255 doc: Clean up old references to QApplication for GUI application
b20548f Windows QPA: Fix warnings as shown by Qt Creator's Clang based code=
 model.
342c909 Qt Quick: Fix selection when mixing line breaks and line wraps
fef629c Disable unneeded ligatures when letter spacing is set
67ced1d OpenGL: Fix for incorrect GL enum in getter
11cd090 Re-enable tst_QTreeView::setSortingEnabled on Windows.
8917cdf Windows QPA/font code: Fix warnings as shown by Qt Creator's Clang =
based code model.
bb8f01c QRasterPaintEngine::penChanged(): Assert on painter state.
5d2068b Prospective fix to stabilize tst_QMdiArea::subWindowActivated2()/xc=
b.
78ad8f2 xcb: Fix drag and drop between xcb screens
4889269 Fix quadratic behavior when converting from QVariant
03f1a69 Avoid size overflows when inserting into very large JSON objects
6342fb2 Bump version
cf47e2e Fix build when QMacStyle is disabled.
de82352 Wrap legacy APIs in a QT_MAC_DEPLOYMENT_TARGET_BELOW macro.
34472e9 QSqlDriver: use table prefix in WHERE clauses
ed4ef55 QtNetwork: Silence Clang on Windows.
42b39f9 Add source device information to qDebug output of QTouchEvent
049fad4 QWindow: Make screen warning more informative
9212727 QOpenGLExtensionMatcher: Fix possible use of unintialized memory
a3b8e35 QListView: fix skipping indexes in selectedIndexes().
5b72757 winrt: add logging to platform plugin
e7a06c9 winrt: Fix clipboard
ad16703 Update testdata
8b0dc80 winrt: Fix usage of testdata
6c7c34f winrt: Disable tests which connect to localhost
e19fc43 Merge "Merge remote-tracking branch 'origin/5.5' into 5.6" into ref=
s/staging/5.6
0d239d1 Merge remote-tracking branch 'origin/5.5' into 5.6
bfb47b3 Windows QPA: Fix the signature of the font enumeration callbacks.
5814164 Doc: Fixed Qt::TextWordBreak to Qt::TextWordWrap
018e670 OS X: Implement download folder display name query
c689bca Search for libsystemd first, fall back to libsystemd-journal
80bf4bf Merge remote-tracking branch 'origin/5.6.0' into 5.6
ac8a3b9 QtGui: Use QImage::constBits()/constScanLine() in non-const context=
s.
9915630 QPlatformWindow::screenForGeometry(): Use mapToGlobal().
966e893 Windows QPA: Prefer const-versions of API where applicable.
62984d8 Fix input pane usage on Windows 10 IoT Core
70fb36e docs: State that QMap::equal_range() returns an open-ended interval
707068b Remove Windows CE build hacks from QWindowsPipeWriter
3cf4c49 Document QWinOverlappedIoNotifier restrictions
448e9fd Enable NRVO in QJsonObject::keys()
8dc5536 QtGui: Avoid rgba64->rgba32 conversion on every pixel in gradient
2ee7541 Optionally force delivery of TUIO pseudo touch events
3fa7035 Fixed bug preventing parsing of unbundled TUIO messages
5d8354e Autotest: Enable make check on rhel 7.1
4fc070a QLocale: Use QVariant::toStringList() instead of template instantia=
tion
2c9f6b1 Fix usage of QMutexLocker, destroy it only at end of scope
e395bda Windows accessibility: Add override declaration.
d145929 Windows accessibility: Remove some cruft.
5cf6a8a QWindowsVistaStyle: Suppress animation when QLineEdit's base color =
is set.
6cb462d QWindowsXPStyle: Introduce utility function for QLineEdit's palette.
8b4ac65 Provide QCss with the correct font for <pre> blocks
22c262d Readability fix for MS isRelative, isAbsolute.
2ddd11d Cleanup testcase for platforms without QProcess support.
42f788f QWindow::setMask(): Apply High DPI scaling.
ab3e2f6 Standarddialogs example: Remove horizontal spacer from fullscreen l=
ayout.
51f29b8 Don't force antialiasing when it is turned off
a4fac65 dbustray: Support late registering of tray icon menu
7ad9309 dbustray: Do not change m_menu in QDBusTrayIcon::createMenu()
12b19ca Fix clang 3.7 developer build [Werror, Winconsistent-missing-overri=
de]
9c7f37e dbusmenu: Refactor the code to allow dynamic updating of menus
01859cc Reduce allocations by using reserve()
af499fd Make QWindowGeometrySpecification suitable to use as global
8eaf335 xcb: Fix not delivering focusIn event on hide/show
b9f76db xcb: Correct enter/leave event handling when mouse button is pressed
e4fb521 xcb: XInput2 fixes, enter/leave event fixes
f669ea0 Link with -ldl option only when it is supported
a107c53 remove redundant namespace qualification
c4a53f6 QtWidgets: Fix build & warnings with QT_NO_GRAPHICSVIEW.
ce29de5 Doc: correct minor typo
3904950 If the font is not being found then get the English name regardless
918b8d4 Doc: corrected minor link issues
73c062d Windows QPA: Remove dead code as detected by Clang.
798e006 Fix crash introduced by 75b705fec8e9517047d7dfa98203edff69f2bf8a
1c7e1d9 Windows QPA: Add missing override declarations.
4748acb qmake: use QString::replace() overloaded with QLatin1String
4a251da Accessibility OS X: Improve password handling
1568074 Windows QPA/Accessibility: Fix Clang warnings about comparing diffe=
rent enums.
f432d64 Make findAmPm actually return the relevant enum, instead of int.
a054349 Removed redundant and distracting test from conditional.
debfed8 Direct2D: Spell out ~QWindowsDirect2DPaintDevice.
75b705f End the drag if the dockwidget is being hidden
0026688 QWizard/Windows: Add missing override.
16d0d1c egldevice: Add a way to force mode setting
f83816e dbusmenu: Fix return type for QDBusMenuAdaptor::EventGroup method
68f97cd dbusmenu: Add missing methods for getting QDBusPlatformMenu propert=
ies
3b0c753 Doc: Replaced Trolltech logo with Qt logo
40e4949 xcb: Take into account the orientation of touch points
10bf53a Don't include <qtest.h> from qtestblacklist.cpp
6ec7d76 Fix rounding error in fetchTransformedBilinear
72b57a5 Disintermediate QDateTimeParser::SectionNode operations.
a965d50 Make interleaving of QDateTimeParser::Section values evident.
2564de7 Deconfuse some heavy use of the preprocessor.
3d64f89 Correct usage of Apple-related #if-ery.
bb1924c Pass -silent to lrelease to avoid cruft in test logs.
04def3a Don't clutter up the source tree with .qm files generated by testin=
g.
f5ea4ba dbusmenu: Add support for shortcuts
751e2ce Clean up tst_qwidgetwindow
b5ea7a5 Add missing emission of activated(QString)

> ---
>  recipes-qt/qt5/qtbase-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index 057edd4..0dba556 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -117,4 +117,4 @@ do_install() {
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
>  }
> =20
> -SRCREV =3D "41706400f605524a5a9953714aa0cfbf811dba7e"
> +SRCREV =3D "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
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

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcMzEcACgkQN1Ujt2V2gBzi4wCeJiajKjitqcfdWvOxP7o2wvId
7twAnRS49w61D3iBuamGyT2L4LX9zIOY
=S8Qy
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
