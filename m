Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 26E1560721
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 19:09:41 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g17so203593089wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sFO/n0+zGA92jNvr9O1XPcpZYpaf5fvZjWEw8hC6Xv0=;
	b=kpC/7OBaVi4gowuPp7L1ygf5uTrmo3hZgtQ/YapjJA/MiwiAjk9r6VOB4fk+JC49nq
	BS+yrg5A/U8mcLw9rFzYB7MdIwscXxz747+fhdmZZYqMRBj7rL41wqnP281KCtqAlJ4t
	3+Ls73aZ4bFYIKYjMME8+xsSAMONj79iaIYj62L9eSK4szHhci412cYNolirwYJVKiqm
	4c+1kMXj3GoBpApdznJzEyouYyrx+aGI6ZszSevr+XBrJ8ytSrxUtwljzy81sqz6qhro
	2Ph9fQOJOO8PSy9DVQtZ8z2bJmGM6c9Y8SSocP3ttNPvQRKHm0c0BRjGUqq/Cjwxc/CT
	f1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sFO/n0+zGA92jNvr9O1XPcpZYpaf5fvZjWEw8hC6Xv0=;
	b=agOzmRNuKz5zc/ODackI9G0NfQ/JfJjb1pxzoNXSlI3iP8Rdg6u2nhEbFumzloUt/O
	dyjHRLHSrDg9/IOcPMcehWeE3cHKyzPHmJa77MKYUZH1WagIDp7oKiSrN7wG1H+NW7x2
	32xC1k9Z+vFWlGuNrzL5xsfVgtwXO2mxHWKI8syoJHL6RMXviKeFAGGp4aj8R4Taa106
	cgDThwLKEIKv84eiy+2FE/QA7iprxUJ5fTycU8hj5JQ5IgzVWudx+ua3nYE6QsToRv1k
	6dcTnQkKAvoFFH5t07hG5QomgeaPfS5nRRVe8wHjaF01KO43AcbhruxYrBwo5FK7Oar8
	ojxA==
X-Gm-Message-State: AOPr4FUMPQRNyJK52pWOro2g22+csb+x82naan6Pq9flu4hzvb+0zeY6x6gGdsD4c4t5hg==
X-Received: by 10.194.61.231 with SMTP id t7mr39024302wjr.32.1462820981663;
	Mon, 09 May 2016 12:09:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b12sm26297560wmb.0.2016.05.09.12.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 12:09:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 May 2016 21:09:50 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160509190950.GD2560@jama>
References: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
	<572E2F5C.1080702@gmail.com>
	<CA+chaQeo3zZk2ekNVBm_Kfx6PDTrVqce+noRwgmq3WUebPk=Jw@mail.gmail.com>
	<5730D7A4.2060406@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5730D7A4.2060406@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][krogoth][meta-oe 1/3] pidgin: Update to 2.10.12
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
X-List-Received-Date: Mon, 09 May 2016 19:09:43 -0000
X-Groupsio-MsgNum: 61441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline

--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2016 at 11:32:04AM -0700, akuster808 wrote:
> On 5/7/16 2:33 PM, Martin Jansa wrote:
> > For me the imporant part is already in commit message, old version does=
n't
> > build at all, new does, so it's improvement in itself.
> >
> > Security fixes are good bonus, but in this case older version wasn't re=
ally
> > affected because it couldn't be even built with corresponding gnutls fr=
om
> > oe-core release.
>=20
> I see you got  impatient and pushed the changes in. I have those staged.

Sorry I've pushed them to krogoth-next only so I don't forgot to make
you include them eventually, but please stage them in normal
consolidated pull as always.

> the "llvm3.3: Disable auto -dbg packages" commit to krogoth-next, is
> that needed in Master?

yes, it is (fixes DEBUGFS generation) and it's also in master-next will
be merged to master soon.

> - Armin
> >
> > On Sat, May 7, 2016 at 8:09 PM, akuster808 <akuster808@gmail.com> wrote:
> >
> >>
> >> On 05/06/2016 07:35 AM, Martin Jansa wrote:
> >>> From: Herrie <github.com@herrie.org>
> >>>
> >>> Which is compatible with GnuTLS that's included in Krogoth.
> >> this update includes:
> >> Potential information leak from XMPP    CVE-2014-3698
> >> Malicious smiley themes could alter arbitrary files     CVE-2014-3697
> >> Remote crash parsing malformed Groupwise message        CVE-2014-3696
> >> Remote crash parsing malformed MXit emoticon    CVE-2014-3695
> >> Insufficient SSL certificate validation         CVE-2014-3694
> >>
> >> info like this helps in deciding patch inclusion.
> >>
> >> - armin
> >>
> >>> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> >>> ---
> >>>  .../pidgin/pidgin/pidgin-cross-python-265.patch    | 35
> >> ++++++++++++++--------
> >>>  .../pidgin/pidgin/pidgin.desktop-set-icon.patch    | 11 -------
> >>>  .../pidgin/{pidgin_2.10.9.bb =3D> pidgin_2.10.12.bb} | 10 ++-----
> >>>  3 files changed, 26 insertions(+), 30 deletions(-)
> >>>  delete mode 100644
> >> meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> >>>  rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb =3D>
> >> pidgin_2.10.12.bb} (91%)
> >>> diff --git
> >> a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> >> b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> >>> index 57c4c46..cfc681c 100644
> >>> --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.p=
atch
> >>> +++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.p=
atch
> >>> @@ -1,16 +1,27 @@
> >>> -Index: pidgin-2.6.5/configure.ac
> >>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> ---- pidgin-2.6.5.orig/configure.ac
> >>> -+++ pidgin-2.6.5/configure.ac
> >>> -@@ -1470,8 +1470,9 @@ if test "_$pythonpath" !=3D _ ; then
> >>> -             AC_CHECK_LIB(pthread, pthread_create, )
> >>> -             AC_CHECK_LIB(util, openpty, )
> >>> -             AC_CHECK_LIB(db, dbopen, )
> >>> --            PY_LIBS=3D"-L$PY_EXEC_PREFIX/lib/python$PY_VERSION/conf=
ig
> >> -lpython$PY_VERSION"
> >>> --            PY_CFLAGS=3D"-I$PY_PREFIX/include/python$PY_VERSION"
> >>> +From 428836ba7f9048970626ef0d6b805107f7c52d33 Mon Sep 17 00:00:00 20=
01
> >>> +From: Herrie <github.com@herrie.org>
> >>> +Date: Thu, 5 May 2016 13:33:29 +0200
> >>> +Subject: [PATCH] Updated python patch
> >>> +
> >>> +---
> >>> + configure.ac | 6 +++---
> >>> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >>> +
> >>> +diff --git a/configure.ac b/configure.ac
> >>> +index 94ea8cf..2285adb 100644
> >>> +--- a/configure.ac
> >>> ++++ b/configure.ac
> >>> +@@ -1587,9 +1587,9 @@ dnl (Thanks to XChat)
> >>> + if test "x$enable_consoleui" =3D "xyes" -a ! -z "$PYTHON" -a x"$PYT=
HON"
> >> !=3D x"no" ; then
> >>> +     AC_MSG_CHECKING(for Python compile flags)
> >>> +     if test -f ${PYTHON}-config; then
> >>> +-            PY_CFLAGS=3D`${PYTHON}-config --includes`
> >>> +-            PY_LIBS=3D`${PYTHON}-config --libs`
> >>> +-            AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
> >> available.])
> >>>  +            m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
> >>>  +
> >> PY_LIBS=3D"-L$PKG_CONFIG_SYSROOT_DIR/usr/lib/python$PY_VERSION/config
> >> -lpython$PY_VERSION"
> >>> -+
> >> PY_CFLAGS=3D"-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
> >>> -             AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
> >> available.])
> >>> ++
> >> PY_CFLAGS=3D"-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
> >>      AC_DEFINE(USE_PYTHON, [1], [Define if python headers are availabl=
e.])
> >>>               AC_MSG_RESULT(ok)
> >>>       else
> >>> +             AC_MSG_RESULT([Cannot find ${PYTHON}-config])
> >>> +
> >>> diff --git
> >> a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> >> b/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> >>> deleted file mode 100644
> >>> index 05f7689..0000000
> >>> --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.p=
atch
> >>> +++ /dev/null
> >>> @@ -1,11 +0,0 @@
> >>> ---- pidgin-2.0.1/pidgin.desktop.in.orig      2007-06-20
> >> 23:50:44.000000000 +0000
> >>> -+++ pidgin-2.0.1/pidgin.desktop.in   2007-06-20 23:51:05.000000000
> >> +0000
> >>> -@@ -4,7 +4,7 @@
> >>> - _GenericName=3DInternet Messenger
> >>> - _Comment=3DSend instant messages over multiple protocols
> >>> - Exec=3Dpidgin
> >>> --Icon=3Dpidgin
> >>> -+Icon=3D/usr/share/icons/hicolor/48x48/apps/pidgin.png
> >>> - StartupNotify=3Dtrue
> >>> - Terminal=3Dfalse
> >>> - Type=3DApplication
> >>> diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> >> b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> >>> similarity index 91%
> >>> rename from meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> >>> rename to meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> >>> index 8352110..9133c1c 100644
> >>> --- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> >>> +++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> >>> @@ -2,23 +2,19 @@ DESCRIPTION =3D "multi-protocol instant messaging c=
lient"
> >>>  SECTION =3D "x11/network"
> >>>  LICENSE =3D "GPLv2"
> >>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe"
> >>> -DEPENDS =3D "python startup-notification avahi gtk+ ncurses gnutls
> >> virtual/libintl gstreamer dbus intltool-native farsight2 libidn"
> >>> +DEPENDS =3D "python startup-notification avahi gtk+ ncurses gnutls
> >> virtual/libintl gstreamer dbus intltool-native farsight2 libidn libxml2
> >> gconf dbus-glib"
> >>>  inherit autotools gettext pkgconfig gconf perlnative
> >>>
> >>> -# http://errors.yoctoproject.org/Errors/Details/25824/
> >>> -PNBLACKLIST[pidgin] ?=3D "Not compatible with gnutls version 3.4
> >> currently in oe-core and also depends on broken libnice through farsig=
ht2"
> >>> -
> >>>  SRC_URI =3D "\
> >>>      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
> >>>      file://sanitize-configure.ac.patch \
> >>> -    file://pidgin.desktop-set-icon.patch \
> >>>      file://purple-OE-branding-25.patch \
> >>>      file://pidgin-cross-python-265.patch \
> >>>  "
> >>>
> >>> -SRC_URI[md5sum] =3D "10a4a69d077893f6dd3438cd8af94e81"
> >>> -SRC_URI[sha256sum] =3D
> >> "dc362ed8577f623eea4554a79e917073aa726825074fea402f2e515f0f51f319"
> >>> +SRC_URI[md5sum] =3D "14e0f5cfb2ed065e4dc80391a806ac76"
> >>> +SRC_URI[sha256sum] =3D
> >> "2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd"
> >>>  EXTRA_OECONF =3D " \
> >>>      --enable-vv \
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcw4HwACgkQN1Ujt2V2gBz9jQCfaacG7Hp7Gq8I0KGCI9oDyA9P
ZpIAn1iDdkRsU0ry0Ogy0jcVZm1whHl6
=hgSm
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
