Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPgmP-00008B-KH
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 20:59:08 +0200
Received: by gwj19 with SMTP id 19so673776gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+KnNCTF1ccq0vPT7K4pWCgiVxwV0trDa/Yda2ROISek=;
	b=BYgy/BVtQKBuVuYL0vVX5BODUYmplPBwRBqtcKs0E9svANbeNh8BSx23v0A1RtEo7n
	+/+JtyzjrWRO+Umqna8Cj/MA0ebm34/Qx4iMnldqF6Px19BLimm0xdCd5fMbGY5+L6UL
	zVrhd7Njiff+PVa+9L7RinQjWb/tOy4o7jzJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cNl3uvr3boUxM2eUZciqGO+dupzEyh/mX/bIMWiOD4uUo7DSroWp7rt6D7E8jiggF3
	pR3xYtEj8GDeFL8qQF9jA0vyixfSIR/sij83J+Rv3H61iRgIMTNrbI/833T0KzqQlWsG
	0ZOo8v1iQTvWhBzZ0ZREjj7TUDAiiVG9EJcKY=
Received: by 10.101.168.31 with SMTP id v31mr1246632ano.141.1276887273501; 
	Fri, 18 Jun 2010 11:54:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Fri, 18 Jun 2010 11:54:13 -0700 (PDT)
In-Reply-To: <0e3c01cb0f15$4152daf0$c3f890d0$@Distant-earth.com>
References: <201006161433.54486.schnitzeltony@gmx.de>
	<201006171458.29759.schnitzeltony@gmx.de> 
	<hvd85i$8ce$1@dough.gmane.org>
	<201006180055.03306.schnitzeltony@gmx.de> 
	<0e3c01cb0f15$4152daf0$c3f890d0$@Distant-earth.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jun 2010 11:54:13 -0700
Message-ID: <AANLkTin4w8yx7M4rU1D9KtrET4YbjgoAILWRVQ_C8BDq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce 4.6.2 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jun 2010 18:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2010 at 11:37 AM, John Willis
<John.Willis@distant-earth.com> wrote:
> For what it's worth these look fine to me, and it saves me finishing off =
the
> 4.6.2 patch I had in my TODO ;).
>
> Thanks for this.

hmmm I think I pushed first version of your patch accidentally. Can
you rebase the new patch on top of what got pushed.

Thx
-Khem

>
> Acked-by: John Willis <john.willis@distant-earth.com>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Andreas Mueller
>> Sent: 17 June 2010 11:55 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] xfce 4.6.2 recipes
>>
>> From ef9f072f440a245dc6dcd9ab5ca8b82d7b1e243b Mon Sep 17 00:00:00
>> 2001
>> From: Andreas Mueller <schnitzeltony@gmx.de>
>> Date: Fri, 18 Jun 2010 00:26:42 +0200
>> Subject: [PATCH] Bump xfce recipes to version 4.6.2
>>
>>
>> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
>> ---
>> =A0recipes/xfce-base/exo_0.3.107.bb =A0 =A0 =A0 =A0 =A0 | =A0 28
>> +++++++++++++++++++++++++
>> =A0recipes/xfce-base/libxfce4menu_4.6.2.bb =A0 =A0| =A0 12 ++++++++++
>> =A0recipes/xfce-base/libxfce4util_4.6.2.bb =A0 =A0| =A0 18 +++++++++++++=
+++
>> =A0recipes/xfce-base/libxfcegui4_4.6.4.bb =A0 =A0 | =A0 17 +++++++++++++=
++
>> =A0recipes/xfce-base/thunar_1.0.2.bb =A0 =A0 =A0 =A0 =A0| =A0 28
>> +++++++++++++++++++++++++
>> =A0recipes/xfce-base/xfce-terminal_0.4.5.bb =A0 | =A0 16 ++++++++++++++
>> =A0recipes/xfce-base/xfce-utils_4.6.2.bb =A0 =A0 =A0| =A0 30
>> +++++++++++++++++++++++++++
>> =A0recipes/xfce-base/xfce4-appfinder_4.6.2.bb | =A0 11 ++++++++++
>> =A0recipes/xfce-base/xfce4-panel_4.6.4.bb =A0 =A0 | =A0 30
>> +++++++++++++++++++++++++++
>> =A0recipes/xfce-base/xfce4-session_4.6.2.bb =A0 | =A0 22 +++++++++++++++=
++++
>> =A0recipes/xfce-base/xfce4-settings_4.6.5.bb =A0| =A0 16 ++++++++++++++
>> =A0recipes/xfce-base/xfconf_4.6.2.bb =A0 =A0 =A0 =A0 =A0| =A0 16 +++++++=
+++++++
>> =A0recipes/xfce-base/xfdesktop_4.6.2.bb =A0 =A0 =A0 | =A0 21 +++++++++++=
++++++++
>> =A0recipes/xfce-base/xfwm4_4.6.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 31
>> ++++++++++++++++++++++++++++
>> =A014 files changed, 296 insertions(+), 0 deletions(-) =A0create mode 10=
0644
>> recipes/xfce-base/exo_0.3.107.bb =A0create mode 100644 recipes/xfce-
>> base/libxfce4menu_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/libxfce4util_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/libxfcegui4_4.6.4.bb
>> =A0create mode 100644 recipes/xfce-base/thunar_1.0.2.bb =A0create mode
>> 100644 recipes/xfce-base/xfce-terminal_0.4.5.bb
>> =A0create mode 100644 recipes/xfce-base/xfce-utils_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/xfce4-appfinder_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/xfce4-panel_4.6.4.bb
>> =A0create mode 100644 recipes/xfce-base/xfce4-session_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/xfce4-settings_4.6.5.bb
>> =A0create mode 100644 recipes/xfce-base/xfconf_4.6.2.bb =A0create mode 1=
00644
>> recipes/xfce-base/xfdesktop_4.6.2.bb
>> =A0create mode 100644 recipes/xfce-base/xfwm4_4.6.2.bb
>>
>> diff --git a/recipes/xfce-base/exo_0.3.107.bb b/recipes/xfce-
>> base/exo_0.3.107.bb
>> new file mode 100644
>> index 0000000..41c2a58
>> --- /dev/null
>> +++ b/recipes/xfce-base/exo_0.3.107.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION=3D"Xfce extensions and framework library with session
>> management support"
>> +DEPENDS =3D "libxfce4util hal liburi-perl-native python-native cairo"
>> +SECTION =3D "x11"
>> +PR =3D "r1"
>> +
>> +inherit xfce46 python-dir
>> +
>> +XFCE_VERSION =3D "4.6.2"
>> +
>> +SRC_URI +=3D " \
>> + =A0 =A0file://exo-no-tests.patch \
>> + =A0 =A0file://configure.patch \
>> +"
>> +
>> +# Note: Python checking is broken
>> +do_configure_prepend() {
>> + =A0 =A0 sed -i -e s:'`$PKG_CONFIG --variable=3Ddefsdir
>> +pygtk-2.0`':\"${STAGING_DATADIR}/pygtk/2.0/defs\":g ${S}/configure.in }
>> +
>> +FILES_${PN} +=3D "${datadir}/xfce4/ \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${PYTHON_SITEPACKAGES_DIR}/* \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${prefix}/share/pygtk/2.0/defs/exo-0.3/=
exo.defs \ "
>> +
>> +FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/*/.debug/*"
>> +
>> +SRC_URI[md5sum] =3D "3a92cca0c99ee940db4410891c9e8498"
>> +SRC_URI[sha256sum] =3D
>> "0a12ac124bad67c8de7135f7052641239ed640884a71612930f99c425bede2a3"
>> diff --git a/recipes/xfce-base/libxfce4menu_4.6.2.bb b/recipes/xfce-
>> base/libxfce4menu_4.6.2.bb
>> new file mode 100644
>> index 0000000..663944a
>> --- /dev/null
>> +++ b/recipes/xfce-base/libxfce4menu_4.6.2.bb
>> @@ -0,0 +1,12 @@
>> +DESCRIPTION=3D"a freedesktop.org compliant menu library for Xfce4"
>> +HOMEPAGE=3D"http://www.xfce.org/projects/libraries"
>> +DEPENDS =3D "gettext pkgconfig libxfce4util intltool"
>> +RDEPENDS_${PN} =3D "gtk+ libxfce4util"
>> +
>> +LICENSE=3D"LGPL-2 FDL-1.1"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +SRC_URI[md5sum] =3D "ff10cacb76803ee37159e3a43345f0d1"
>> +SRC_URI[sha256sum] =3D
>> "62352be57318d6f241c4f6e4b6f9303d0b80246ea8f6e4753a962360a9965162"
>> diff --git a/recipes/xfce-base/libxfce4util_4.6.2.bb b/recipes/xfce-
>> base/libxfce4util_4.6.2.bb
>> new file mode 100644
>> index 0000000..67aba2e
>> --- /dev/null
>> +++ b/recipes/xfce-base/libxfce4util_4.6.2.bb
>> @@ -0,0 +1,18 @@
>> +# libxfce4util OE build file
>> +
>> +DESCRIPTION =3D "Basic utility library for Xfce4"
>> +SECTION =3D "x11/libs"
>> +LICENSE =3D "GPL"
>> +DEPENDS =3D "glib-2.0 xfce4-dev-tools "
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +EXTRA_OECONF +=3D "--disable-dependency-tracking --disable-static --wit=
h-
>> broken-putenv=3Dyes"
>> +
>> +MACROS=3D"m4/X11.m4 m4/debug.m4 m4/depends.m4 m4/i18n.m4"
>> +
>> +FILES_${PN}-dev +=3D " ${datadir}/xfce4/m4"
>> +
>> +SRC_URI[md5sum] =3D "9c3129d827d480f0906c575e7a13f1e9"
>> +SRC_URI[sha256sum] =3D
>> "ae2e7ed1000bb0b3589643a39a65e6ab64c9ee198045e7b272604986f2e18c83"
>> diff --git a/recipes/xfce-base/libxfcegui4_4.6.4.bb b/recipes/xfce-
>> base/libxfcegui4_4.6.4.bb
>> new file mode 100644
>> index 0000000..255f482
>> --- /dev/null
>> +++ b/recipes/xfce-base/libxfcegui4_4.6.4.bb
>> @@ -0,0 +1,17 @@
>> +# libxfcegui4 OE build file
>> +
>> +DESCRIPTION =3D "Xfce4 Widget library and X Window System interaction"
>> +DEPENDS =3D "gettext pkgconfig intltool virtual/libx11 libxfce4util xfc=
onf
> dbh
>> libxml2 gtk+ libglade"
>> +RDEPENDS_${PN} =3D "xfconf startup-notification "
>> +
>> +SECTION =3D "x11/libs"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +LEAD_SONAME =3D "libxfcegui4.so.4"
>> +
>> +FILES_${PN} +=3D "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so
>> ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
>> +
>> +SRC_URI[md5sum] =3D "88de59b222cb9977f93a4c61011c1e1f"
>> +SRC_URI[sha256sum] =3D
>> "c37e407dc00fb87dc16758d53e69edeac7b32aa76c5fcad2b784cf22f58af421"
>> diff --git a/recipes/xfce-base/thunar_1.0.2.bb b/recipes/xfce-
>> base/thunar_1.0.2.bb
>> new file mode 100644
>> index 0000000..d35c44d
>> --- /dev/null
>> +++ b/recipes/xfce-base/thunar_1.0.2.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION =3D "File manager for the Xfce Desktop Environment"
>> +HOMEPAGE=3D"http://thunar.xfce.org"
>> +DEPENDS =3D "exo dbus-glib libexif xfce4-panel libice libsm gamin"
>> +RDEPENDS_${PN} =3D "libxfcegui4 exo dbus-glib libexif xfce4-panel libic=
e
> libsm
>> gamin"
>> +RRECOMMENDS_${PN} =3D "shared-mime-info"
>> +SECTION =3D "x11"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +XFCE_VERSION =3D "4.6.2"
>> +
>> +SRC_URI =3D "http://www.us.xfce.org/archive/xfce-
>> ${XFCE_VERSION}/src/Thunar-${PV}.tar.bz2"
>> +
>> +S =3D "${WORKDIR}/Thunar-${PV}/"
>> +
>> +EXTRA_OECONF +=3D "--disable-dependency-tracking --enable-dbus"
>> +
>> +FILES_${PN} +=3D "${libdir}/thunarx-1/*.so \
>> + =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/thunarx-1/*.la \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/dbus-1 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/thumbnailers \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/Thunar \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/xfce4"
>> +FILES_${PN}-dbg +=3D "${libdir}/thunarx-1/.debug/
> ${libexecdir}/xfce4/panel-
>> plugins/.debug/"
>> +
>> +SRC_URI[md5sum] =3D "c91073202d373a1f9951a1240083c36d"
>> +SRC_URI[sha256sum] =3D
>> "75829b34a68346b33f66882bedc9794d580c200d11af22541885750459b55c03"
>> diff --git a/recipes/xfce-base/xfce-terminal_0.4.5.bb b/recipes/xfce-
>> base/xfce-terminal_0.4.5.bb
>> new file mode 100644
>> index 0000000..2d5f94e
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce-terminal_0.4.5.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION =3D "Terminal emulator for the Xfce desktop environment"
>> +DEPENDS =3D "exo vte dbus-glib gtk+"
>> +RDEPENDS_${PN} +=3D "gnome-pty-helper"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +SRC_URI =3D
>> +"http://www.xfce.org/archive/src/apps/terminal/0.4/Terminal-
>> ${PV}.tar.bz2 \ "
>> +
>> +S =3D "${WORKDIR}/Terminal-${PV}"
>> +
>> +FILES_${PN} +=3D "${datadir}/Terminal"
>> +
>> +SRC_URI[md5sum] =3D "3c707628e2e97c6d9566cd74d400036a"
>> +SRC_URI[sha256sum] =3D
>> "92fddcbc1422076672d8ec61832793d4ceea2fc0db7d724a6acde0ec2bac8893"
>> diff --git a/recipes/xfce-base/xfce-utils_4.6.2.bb
> b/recipes/xfce-base/xfce-
>> utils_4.6.2.bb
>> new file mode 100644
>> index 0000000..08048c4
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce-utils_4.6.2.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION=3D"Xfce4 Utilities"
>> +DEPENDS =3D "virtual/libx11 libxfcegui4"
>> +SECTION =3D "x11"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +FILES_${PN} +=3D " \
>> + =A0 =A0 =A0 =A0${bindir}/* \
>> + =A0 =A0 =A0 =A0${datadir}/dbus-1/* \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/AUTHORS \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/BSD \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/COPYING \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/GPL \
>> + =A0 =A0 ${datadir}/xfce4/INFO* \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/LGPL \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/AUTHORS.html \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/BSD.html \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/COPYING.html \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/GPL.html \
>> + =A0 =A0 ${datadir}/xfce4/INFO.html \
>> + =A0 =A0 =A0 =A0${datadir}/xfce4/LGPL.html \
>> + =A0 =A0 =A0 =A0${datadir}/xsessions/xfce.desktop \ "
>> +
>> +# NOTE: =A0This package takes a --with-browser for the default browser =
#
>> +NOTE: =A0Works with gdm also gtkhtml
>> +
>> +SRC_URI[md5sum] =3D "5d23407700d7e8c9751e17a5bc955109"
>> +SRC_URI[sha256sum] =3D
>> "54efc2038bfbd5acaadfc91ed91fb3dfd6cec64f9402f364accce7bcafe2ba7a"
>> diff --git a/recipes/xfce-base/xfce4-appfinder_4.6.2.bb b/recipes/xfce-
>> base/xfce4-appfinder_4.6.2.bb
>> new file mode 100644
>> index 0000000..a73383d
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce4-appfinder_4.6.2.bb
>> @@ -0,0 +1,11 @@
>> +# xfce4-appfinder build file
>> +
>> +DESCRIPTION=3D"Xfce4 Application Finder"
>> +DEPENDS=3D"libxfcegui4 libxfce4menu thunar"
>> +SECTION =3D "x11"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +SRC_URI[md5sum] =3D "7752e43578b821e35010bcd3762da166"
>> +SRC_URI[sha256sum] =3D
>> "a1bf35b838922a7f81f588c727a6ef2f56b1bed0c46f7c36b209ac336f7e492a"
>> diff --git a/recipes/xfce-base/xfce4-panel_4.6.4.bb b/recipes/xfce-
>> base/xfce4-panel_4.6.4.bb
>> new file mode 100644
>> index 0000000..fe402b8
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce4-panel_4.6.4.bb
>> @@ -0,0 +1,30 @@
>> +# xfce4-panel OE build file
>> +
>> +DESCRIPTION =3D "Xfce4 Panel"
>> +DEPENDS =3D "virtual/libx11 startup-notification libxfcegui4 libxml2 ex=
o
>> libwnck"
>> +SECTION =3D "x11"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +SRC_URI[md5sum] =3D "82f10a42aefca4cc26a6633e7478cc65"
>> +SRC_URI[sha256sum] =3D
>> "cc9b70bdc73ab80f46655a34cdbaf876a67cd90b50230cbf4d77a3106a5c54e7"
>> +
>> +EXTRA_OECONF +=3D " --enable-startup-notification"
>> +
>> +do_install() {
>> + =A0 =A0oe_runmake DESTDIR=3D${D} install
>> +}
>> +
>> +python populate_packages_prepend() {
>> + =A0 =A0 plugin_dir =3D bb.data.expand('${libdir}/xfce4/panel-plugins/'=
, d)
>> + =A0 =A0 plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)
>> + =A0 =A0 do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 '${PN} plugin for %s', ext=
ra_depends=3D'',
> prepend=3DTrue,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 aux_files_pattern=3D['${da=
tadir}/xfce4/panel-
>> plugins/%s.desktop',
>> +
> '${sysconfdir}/xdg/xfce/panel/%s-*',
>> +
> '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0'${bindir}/*%s*']) }
>> +
>> +PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
>> diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-
>> base/xfce4-session_4.6.2.bb
>> new file mode 100644
>> index 0000000..c85bb8c
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop
>> Environment"
>> +DEPENDS =3D "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
>> +SECTION =3D "x11"
>> +
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +RDEPENDS_${PN} =3D "iceauth xfce-utils xinit dbus-x11"
>> +
>> +FILES_${PN} +=3D "${libdir}/xfce4/splash/engines/*.so"
>> +FILES_${PN} +=3D "${datadir}/xfce4/tips/*"
>> +FILES_${PN} +=3D "${datadir}/themes/Default/balou/*"
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/xfce4/splash/engines/.debug/*.so"
>> +FILES_${PN}-dbg +=3D "${libdir}/xfce4/splash/engines/.debug/*.a"
>> +
>> +FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.la"
>> +FILES_${PN}-dev +=3D "${libdir}/xfce4/splash/engines/*.a"
>> +
>> +SRC_URI[md5sum] =3D "9d9890130e45e0e9476591ed9ba2c9d5"
>> +SRC_URI[sha256sum] =3D
>> "725e269254c34c530acb670f5ccd0fd69b57cbe9f2176abd8499fc5d6dcd30a8"
>> diff --git a/recipes/xfce-base/xfce4-settings_4.6.5.bb b/recipes/xfce-
>> base/xfce4-settings_4.6.5.bb
>> new file mode 100644
>> index 0000000..65e4869
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfce4-settings_4.6.5.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION =3D "Xfce4 settings"
>> +HOMEPAGE =3D "http://www.xfce.org"
>> +SECTION =3D "x11/wm"
>> +LICENSE =3D "GPL-2"
>> +
>> +DEPENDS =3D "virtual/libx11 virtual/xserver libxi libwnck xrandr exo
>> libxfce4util libxfcegui4"
>> +
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +SRC_URI[md5sum] =3D "f988cb732913b5fbc115ad7105d2231e"
>> +SRC_URI[sha256sum] =3D
>> "1601b8d2cac5d931c39bed7e331c5bd91018d0e56663295e7a083a2c78fe168b"
>> +
>> +RDEPENDS_${PN} =3D "xfconf exo"
>> +
>> diff --git a/recipes/xfce-base/xfconf_4.6.2.bb b/recipes/xfce-
>> base/xfconf_4.6.2.bb
>> new file mode 100644
>> index 0000000..3db4c91
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfconf_4.6.2.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION =3D "Xfce configuration daemon and utilities"
>> +HOMEPAGE =3D "http://www.xfce.org"
>> +SECTION =3D "x11/wm"
>> +LICENSE =3D "GPL-2"
>> +
>> +DEPENDS =3D "libxfce4util"
>> +RDEPENDS_${PN} =3D "libxfce4util"
>> +
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +FILES_${PN} +=3D "${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>> +
>> +SRC_URI[md5sum] =3D "5ff93c15077c6dbbcd38c437bc1ab2ef"
>> +SRC_URI[sha256sum] =3D
>> "7b2635abc33ae6a76145238ed27557bc1ff91b1a5ee0757962f798a66d56f478"
>> diff --git a/recipes/xfce-base/xfdesktop_4.6.2.bb b/recipes/xfce-
>> base/xfdesktop_4.6.2.bb
>> new file mode 100644
>> index 0000000..c3a3bca
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfdesktop_4.6.2.bb
>> @@ -0,0 +1,21 @@
>> +DESCRIPTION =3D "Xfce4 Desktop Manager"
>> +SECTION =3D "x11/base"
>> +
>> +DEPENDS =3D "virtual/libx11 exo libxfcegui4 xfce4-panel thunar gtk+"
>> +RDEPENDS_${PN} =3D "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
>> +PR =3D "r0"
>> +
>> +inherit xfce46
>> +
>> +do_configure() {
>> + =A0 oe_runconf
>> +}
>> +
>> +FILES_xfdesktop-backdrops =3D "${datadir}/xfce4/backdrops/*"
>> +FILES_${PN} +=3D "${libdir}/xfce4/panel-plugins/*.so \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/xfce4/panel-plugins/xfce4-men=
u-plugin \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/xfce4/panel-plugins/*.deskto=
p"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug"
>> +
>> +SRC_URI[md5sum] =3D "e800ea9fee7a5c5eaf2ae96e23a83e3a"
>> +SRC_URI[sha256sum] =3D
>> "cd760f95486ba3f1c6d0179bb10a4c21c99c1d459dd8265823fed85f7376a3fb"
>> diff --git a/recipes/xfce-base/xfwm4_4.6.2.bb b/recipes/xfce-
>> base/xfwm4_4.6.2.bb
>> new file mode 100644
>> index 0000000..3ea7f52
>> --- /dev/null
>> +++ b/recipes/xfce-base/xfwm4_4.6.2.bb
>> @@ -0,0 +1,31 @@
>> +# xfwm4 OE build file
>> +
>> +DESCRIPTION=3D"Xfce4 Window Manager"
>> +SECTION =3D "x11/wm"
>> +PR =3D "r0"
>> +
>> +inherit xfce46 update-alternatives
>> +
>> +FILES_${PN} +=3D "${datadir}/xfwm4/defaults
>> ${datadir}/xfwm4/themes/default.keys/*"
>> +
>> +DEPENDS =3D "startup-notification virtual/libx11 libxpm libxfce4util
>> libxfcegui4"
>> +RDEPENDS_${PN} =3D "xfwm4-theme-default"
>> +
>> +EXTRA_OECONF +=3D " --enable-startup-notification"
>> +
>> +PACKAGES_DYNAMIC +=3D "xfwm4-theme-*"
>> +
>> +python populate_packages_prepend () {
>> + =A0 =A0 themedir =3D bb.data.expand('${datadir}/themes', d)
>> + =A0 =A0 do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFW=
M4
>> theme
>> +%s', allow_dirs=3DTrue) }
>> +
>> +ALTERNATIVE_NAME =3D "x-window-manager"
>> +ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
>> +ALTERNATIVE_PATH =3D "${bindir}/xfce4-session"
>> +ALTERNATIVE_PRIORITY =3D "30"
>> +
>> +FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/xfwm4/.debug/*"
>> +
>> +SRC_URI[md5sum] =3D "3e6c0c54b028b6ea60e865e55ecdf3f8"
>> +SRC_URI[sha256sum] =3D
>> "212819ee03c24635f79d50930284c422469e22489952d0b286e6fe5af2155828"
>> --
>> 1.5.3.4
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


