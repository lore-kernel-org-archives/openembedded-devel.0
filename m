Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9B577162
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:35:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d7so3474077wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 15:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8TDqW8MB/7FAV39V6GejrOC3wCgA8Rn1m/RQwnBGqu4=;
	b=csfoPoFONnlR3vMDcgqzZE6Mbw69+OCWCx4tftUc+mu6zHllipHxKF3LvghBDPnf1B
	lZLmP5TvnoyORPzFLp+rfT56ACwdoxHqt91ZOmaMw4HbzYM2LU1pGhNIOAIfI50hS0vq
	GpUYj9AxiZcbgma4AtbsF0QfnXji/W80IVG6po8jzSPZd81wPHsCFb+BOU86/6wWJFqr
	i7USm7aQHV2GtX27rP7bApog+Dh6eqY3mu9Rme4VdOUEc5wQJuja/XkyGCkfPLTij+Nw
	Gkr+Lyeu4iqqINFvnS0p6wMQjZqW3MLOuauo4D7/FjAJrd4oWOlov2vc4VvUZuUK9upK
	0VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8TDqW8MB/7FAV39V6GejrOC3wCgA8Rn1m/RQwnBGqu4=;
	b=c842qUdt1h/8Uq7FhaLBWKwi6Ct4DV2lWtRnfEVCJDBs5jpSjzOmMUiy3E3MBrzYHG
	ZvsY4BW/sO0nYX4h8sXry19roNLMIQyYdIIyRXFiJC9ldETgOZJStZlLoXYWPUG5Mc7R
	PO7qt3w7AC1TUyF8tCTDOAIf//OJoS3+aojqeFOvx6aCWT/DPeIX79/X+hdQJlWcE9bs
	ervMxj0QPKK2rvybV9/1bCWKLIv63o6bogqJlBfoeABzd1lM2s4j2kyRb79PNyaCvll8
	VeGQMjQuYJOqz/zAPbK6+cAwY62psrj+Dso9PWCYlNINII991HTbnvbINULIeg9P7P3X
	7j1A==
X-Gm-Message-State: AE9vXwNJH59TbkTr/VJu5EXNgZy6bUcY/clm9u96gegsOnZIVUTIwuC25cVKD2XBz82SJA==
X-Received: by 10.28.209.142 with SMTP id i136mr1767713wmg.0.1473633343281;
	Sun, 11 Sep 2016 15:35:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	vh6sm14874865wjb.0.2016.09.11.15.35.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Sep 2016 15:35:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Sep 2016 00:35:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160911223544.GA5797@jama>
References: <1473260550-22766-1-git-send-email-zeenix@gmail.com>
	<20160911072842.GC2634@jama>
MIME-Version: 1.0
In-Reply-To: <20160911072842.GC2634@jama>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe][PATCH] Update Geoclue2
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
X-List-Received-Date: Sun, 11 Sep 2016 22:35:44 -0000
X-Groupsio-MsgNum: 63061
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 11, 2016 at 09:28:42AM +0200, Martin Jansa wrote:
> On Wed, Sep 07, 2016 at 05:02:30PM +0200, Zeeshan Ali wrote:
> > From: Zeeshan Ali <zeeshan.ali@pelagicore.com>
>=20
> Summary should start with "geoclue: " and you're missing SOB line, see:
>=20
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Also bunch of unpackaged files:

geoclue-2.4.4: geoclue: Files/directories were installed but not shipped
in any package:
  /lib
  /usr/share/gir-1.0
  /usr/share/dbus-1/interfaces/org.freedesktop.GeoClue2.Agent.xml
  /usr/share/dbus-1/interfaces/org.freedesktop.GeoClue2.Client.xml
  /usr/share/dbus-1/interfaces/org.freedesktop.GeoClue2.Location.xml
  /usr/share/dbus-1/interfaces/org.freedesktop.GeoClue2.Manager.xml
  /usr/share/gir-1.0/Geoclue-2.0.gir
  /usr/lib/girepository-1.0
  /usr/lib/girepository-1.0/Geoclue-2.0.typelib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/geoclue.service

Will drop this from master-next until you send v2 with fixes.

>=20
> >=20
> > Also drop redundant and now unusable patch.
> > ---
> >  .../geoclue/files/soup-session-fix.patch           | 30 --------------
> >  .../recipes-navigation/geoclue/geoclue_2.0.0.bb    | 33 ---------------
> >  .../recipes-navigation/geoclue/geoclue_2.4.4.bb    | 47 ++++++++++++++=
++++++++
> >  3 files changed, 47 insertions(+), 63 deletions(-)
> >  delete mode 100644 meta-oe/recipes-navigation/geoclue/files/soup-sessi=
on-fix.patch
> >  delete mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> >  create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> >=20
> > diff --git a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.=
patch b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> > deleted file mode 100644
> > index 70fe3f5..0000000
> > --- a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -Upstream-Status: Upstream-Status: Inappropriate [poky 9.0 has older li=
bsoup]
> > -
> > -Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > -
> > -diff --git a/src/gclue-ipclient.c b/src/gclue-ipclient.c
> > -index 09add30..1771d5c 100644
> > ---- a/src/gclue-ipclient.c
> > -+++ b/src/gclue-ipclient.c
> > -@@ -83,7 +83,7 @@ gclue_ipclient_init (GClueIpclient *ipclient)
> > - {
> > -         ipclient->priv =3D G_TYPE_INSTANCE_GET_PRIVATE ((ipclient), G=
CLUE_TYPE_IPCLIENT, GClueIpclientPrivate);
> > -=20
> > --        ipclient->priv->soup_session =3D soup_session_new ();
> > -+        ipclient->priv->soup_session =3D soup_session_sync_new ();
> > - }
> > -=20
> > - /**
> > -diff --git a/src/geoip-server/geoip-update.c b/src/geoip-server/geoip-=
update.c
> > -index 6cce7b2..ef672ba 100644
> > ---- a/src/geoip-server/geoip-update.c
> > -+++ b/src/geoip-server/geoip-update.c
> > -@@ -214,7 +214,7 @@ main (int argc, char **argv)
> > -                         path =3D GEOIP_DATABASE_PATH;
> > -         }
> > -=20
> > --        session =3D soup_session_new ();
> > -+        session =3D soup_session_sync_new ();
> > -=20
> > -         for (i =3D 0; i < G_N_ELEMENTS (db_info_map); i++) {
> > -                 SoupMessage *msg =3D NULL;
> > diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta=
-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> > deleted file mode 100644
> > index 90e8533..0000000
> > --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -SUMMARY =3D "The Geolocation Service"
> > -DESCRIPTION =3D "Geoclue is a D-Bus service that provides location inf=
ormation. \
> > -The primary goal of the Geoclue project is to make creating location-a=
ware applications \
> > -as simple as possible, while the secondary goal is to ensure that no a=
pplication \
> > -can access location information without explicit permission from user."
> > -LICENSE =3D "GPLv2.0+"
> > -SECTION =3D "console/network"
> > -
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8114b83a0435d8136b47bd70111=
ce5cd"
> > -
> > -DEPENDS =3D "glib-2.0 dbus dbus-glib json-glib libsoup-2.4 intltool-na=
tive"
> > -
> > -inherit autotools pkgconfig gtk-doc
> > -
> > -SRC_URI =3D " \
> > -    http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-$=
{PV}.tar.xz \
> > -    file://soup-session-fix.patch \
> > -"
> > -
> > -SRC_URI[md5sum] =3D "401ff99d530b177c62afacef0a33efd9"
> > -SRC_URI[sha256sum] =3D "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe=
1f01350bceda8c67a1"
> > -
> > -PACKAGECONFIG[geoip] =3D "--enable-geoip-server,--disable-geoip-server=
,geoip"
> > -
> > -EXTRA_OECONF +=3D " \
> > -    --with-dbus-service-user=3Droot \
> > -    --with-dbus-sys-dir=3D${sysconfdir}/dbus-1/system.d \
> > -"
> > -
> > -FILES_${PN} +=3D " \
> > -    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service=
 \
> > -    ${datadir}/geoclue-2.0/geoclue-interface.xml \
> > -"
> > diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta=
-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> > new file mode 100644
> > index 0000000..64f0546
> > --- /dev/null
> > +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> > @@ -0,0 +1,47 @@
> > +SUMMARY =3D "The Geolocation Service"
> > +DESCRIPTION =3D "Geoclue is a D-Bus service that provides location inf=
ormation. \
> > +The primary goal of the Geoclue project is to make creating location-a=
ware applications \
> > +as simple as possible, while the secondary goal is to ensure that no a=
pplication \
> > +can access location information without explicit permission from user."
> > +LICENSE =3D "GPLv2.0+"
> > +SECTION =3D "console/network"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8114b83a0435d8136b47bd70111=
ce5cd"
> > +
> > +DEPENDS =3D "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
> > +
> > +inherit autotools pkgconfig gtk-doc
> > +
> > +SRC_URI =3D " \
> > +	http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV=
}.tar.xz \
>=20
> We don't use tabs for indentation. Use 4 spaces.
>=20
> > +"
> > +
> > +SRC_URI[md5sum] =3D "d2a5b05f4bad032673fe23afbce27926"
> > +SRC_URI[sha256sum] =3D "9c43fb9d0c12067ea64400500abb0640194947d4c2c55e=
38545afe5d9c5c315c"
> > +
> > +export BUILD_SYS
> > +export HOST_SYS
> > +export STAGING_INCDIR
> > +export STAGING_LIBDIR
> > +
> > +# Without this line, package is delcared a library and named libgeoclu=
e*
> > +AUTO_LIBNAME_PKGS =3D ""
> > +
> > +PACKAGECONFIG ??=3D "3g modem-gps cdma nmea lib"
> > +PACKAGECONFIG[3g] =3D "--enable-3g-source,--disable-3g-source,modemman=
ager"
> > +PACKAGECONFIG[modem-gps] =3D "--enable-modem-gps-source,--disable-mode=
m-gps-source,modemmanager"
> > +PACKAGECONFIG[cdma] =3D "--enable-cdma-source,--disable-cdma-source,mo=
demmanager"
> > +PACKAGECONFIG[nmea] =3D "--enable-nmea-source,--disable-nmea-source,av=
ahi"
> > +PACKAGECONFIG[lib] =3D "--enable-libgeoclue,--disable-libgeoclue,gobje=
ct-introspection"
> > +
> > +EXTRA_OECONF +=3D " \
> > +    --with-dbus-service-user=3Droot \
> > +    --with-dbus-sys-dir=3D${sysconfdir}/dbus-1/system.d \
> > +    --enable-demo-agent=3Dno \
> > +"
> > +
> > +FILES_${PN} +=3D " \
> > +    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service=
 \
> > +    ${datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2.xml \
> > +    ${prefix}/libexec \
> > +"
> > --=20
> > 2.7.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfV3D8ACgkQN1Ujt2V2gBwZCwCfQ1pAArXhi6uM6zMDbrdzImOI
uB8AnRW58Qhx1DAv7cCz/kAJ8fD2DB0y
=Y8EC
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
