Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A198771ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 07:28:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so8950176wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lLfLKpMWUhccOcuh0tQu/R0eLtY3oLpl+YJkgD0ftgs=;
	b=iP3gAy2D3viryfpEoQ/AoHBdMhQksEfTMUbr74MfjQ2M3hr/SJ5YWLydJrSaI9LSOc
	1+sAejRQoloRsYXUN7ZSWg2cOxTqzugG5fJfjnzwDTS0Ioi752TCN9spv28rEs4RHrvA
	JKrXneLe/WSBavrG8A1SbVmHPONSgtF2nOA2a97BVvp8pHytaI2XehmfFyTU/FJMq1D0
	EPQszNQujIklBN8bbmIVO7/ZPWbWiMcA9Ff2aJlRyiTAs+PA/8TF044eMcnTCx7uvl/q
	nh91bYcT9EMR12dA9+c6d0YwOYKuxyIat0nSe3Sb1hnjp22wnLYnQf/nPhL963rElsBF
	QxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lLfLKpMWUhccOcuh0tQu/R0eLtY3oLpl+YJkgD0ftgs=;
	b=U4zVMaJDzV+zQDbN9wnPdgmfS60DD6o90YmSuiQ1UIEvOmeF3w6yN/3XNZGiRv1ZRP
	fJjgByTJwbigZ2Bm3JgTv+BnJKNjSsCYJQvKjc3+pcurtnB5crWCLa/iaYd6i0SCFWYH
	9hmjAqbRWduwanJweKvJ7rlWcOLETzX9GHPiO4waSHqSUMwnfvqYnY4jQHe2QVf3WmYX
	1yu/CcO/1WQS5j1aOKKVBxXa+86tTvMEKYnJNIO5TUGfh56tssaxANy4ygBzeyfeM6ql
	49WO8LQqF4/hvpRhP2kyUr3+wc1zL9+qiEQpBHT9hgDk/MQdf18dCO5BQLHJcNO7mU1X
	k5/g==
X-Gm-Message-State: AE9vXwPZGodm6bKOuDjvjYCQFgJUHy5m/Ud2W9RSQ8IPsIU+e/+O/4nuz6iBvhqGX3e6dA==
X-Received: by 10.194.122.137 with SMTP id ls9mr9969365wjb.29.1473578922933;
	Sun, 11 Sep 2016 00:28:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ce6sm11703233wjc.27.2016.09.11.00.28.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Sep 2016 00:28:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 Sep 2016 09:28:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160911072842.GC2634@jama>
References: <1473260550-22766-1-git-send-email-zeenix@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1473260550-22766-1-git-send-email-zeenix@gmail.com>
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
X-List-Received-Date: Sun, 11 Sep 2016 07:28:43 -0000
X-Groupsio-MsgNum: 63050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 05:02:30PM +0200, Zeeshan Ali wrote:
> From: Zeeshan Ali <zeeshan.ali@pelagicore.com>

Summary should start with "geoclue: " and you're missing SOB line, see:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

>=20
> Also drop redundant and now unusable patch.
> ---
>  .../geoclue/files/soup-session-fix.patch           | 30 --------------
>  .../recipes-navigation/geoclue/geoclue_2.0.0.bb    | 33 ---------------
>  .../recipes-navigation/geoclue/geoclue_2.4.4.bb    | 47 ++++++++++++++++=
++++++
>  3 files changed, 47 insertions(+), 63 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/geoclue/files/soup-session=
-fix.patch
>  delete mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
>  create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
>=20
> diff --git a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.pa=
tch b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> deleted file mode 100644
> index 70fe3f5..0000000
> --- a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Upstream-Status: Inappropriate [poky 9.0 has older libs=
oup]
> -
> -Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> -
> -diff --git a/src/gclue-ipclient.c b/src/gclue-ipclient.c
> -index 09add30..1771d5c 100644
> ---- a/src/gclue-ipclient.c
> -+++ b/src/gclue-ipclient.c
> -@@ -83,7 +83,7 @@ gclue_ipclient_init (GClueIpclient *ipclient)
> - {
> -         ipclient->priv =3D G_TYPE_INSTANCE_GET_PRIVATE ((ipclient), GCL=
UE_TYPE_IPCLIENT, GClueIpclientPrivate);
> -=20
> --        ipclient->priv->soup_session =3D soup_session_new ();
> -+        ipclient->priv->soup_session =3D soup_session_sync_new ();
> - }
> -=20
> - /**
> -diff --git a/src/geoip-server/geoip-update.c b/src/geoip-server/geoip-up=
date.c
> -index 6cce7b2..ef672ba 100644
> ---- a/src/geoip-server/geoip-update.c
> -+++ b/src/geoip-server/geoip-update.c
> -@@ -214,7 +214,7 @@ main (int argc, char **argv)
> -                         path =3D GEOIP_DATABASE_PATH;
> -         }
> -=20
> --        session =3D soup_session_new ();
> -+        session =3D soup_session_sync_new ();
> -=20
> -         for (i =3D 0; i < G_N_ELEMENTS (db_info_map); i++) {
> -                 SoupMessage *msg =3D NULL;
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.0.0.bb
> deleted file mode 100644
> index 90e8533..0000000
> --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY =3D "The Geolocation Service"
> -DESCRIPTION =3D "Geoclue is a D-Bus service that provides location infor=
mation. \
> -The primary goal of the Geoclue project is to make creating location-awa=
re applications \
> -as simple as possible, while the secondary goal is to ensure that no app=
lication \
> -can access location information without explicit permission from user."
> -LICENSE =3D "GPLv2.0+"
> -SECTION =3D "console/network"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8114b83a0435d8136b47bd70111ce=
5cd"
> -
> -DEPENDS =3D "glib-2.0 dbus dbus-glib json-glib libsoup-2.4 intltool-nati=
ve"
> -
> -inherit autotools pkgconfig gtk-doc
> -
> -SRC_URI =3D " \
> -    http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${P=
V}.tar.xz \
> -    file://soup-session-fix.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "401ff99d530b177c62afacef0a33efd9"
> -SRC_URI[sha256sum] =3D "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f=
01350bceda8c67a1"
> -
> -PACKAGECONFIG[geoip] =3D "--enable-geoip-server,--disable-geoip-server,g=
eoip"
> -
> -EXTRA_OECONF +=3D " \
> -    --with-dbus-service-user=3Droot \
> -    --with-dbus-sys-dir=3D${sysconfdir}/dbus-1/system.d \
> -"
> -
> -FILES_${PN} +=3D " \
> -    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
> -    ${datadir}/geoclue-2.0/geoclue-interface.xml \
> -"
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.4.4.bb
> new file mode 100644
> index 0000000..64f0546
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> @@ -0,0 +1,47 @@
> +SUMMARY =3D "The Geolocation Service"
> +DESCRIPTION =3D "Geoclue is a D-Bus service that provides location infor=
mation. \
> +The primary goal of the Geoclue project is to make creating location-awa=
re applications \
> +as simple as possible, while the secondary goal is to ensure that no app=
lication \
> +can access location information without explicit permission from user."
> +LICENSE =3D "GPLv2.0+"
> +SECTION =3D "console/network"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8114b83a0435d8136b47bd70111ce=
5cd"
> +
> +DEPENDS =3D "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +SRC_URI =3D " \
> +	http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV}.=
tar.xz \

We don't use tabs for indentation. Use 4 spaces.

> +"
> +
> +SRC_URI[md5sum] =3D "d2a5b05f4bad032673fe23afbce27926"
> +SRC_URI[sha256sum] =3D "9c43fb9d0c12067ea64400500abb0640194947d4c2c55e38=
545afe5d9c5c315c"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +# Without this line, package is delcared a library and named libgeoclue*
> +AUTO_LIBNAME_PKGS =3D ""
> +
> +PACKAGECONFIG ??=3D "3g modem-gps cdma nmea lib"
> +PACKAGECONFIG[3g] =3D "--enable-3g-source,--disable-3g-source,modemmanag=
er"
> +PACKAGECONFIG[modem-gps] =3D "--enable-modem-gps-source,--disable-modem-=
gps-source,modemmanager"
> +PACKAGECONFIG[cdma] =3D "--enable-cdma-source,--disable-cdma-source,mode=
mmanager"
> +PACKAGECONFIG[nmea] =3D "--enable-nmea-source,--disable-nmea-source,avah=
i"
> +PACKAGECONFIG[lib] =3D "--enable-libgeoclue,--disable-libgeoclue,gobject=
-introspection"
> +
> +EXTRA_OECONF +=3D " \
> +    --with-dbus-service-user=3Droot \
> +    --with-dbus-sys-dir=3D${sysconfdir}/dbus-1/system.d \
> +    --enable-demo-agent=3Dno \
> +"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
> +    ${datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2.xml \
> +    ${prefix}/libexec \
> +"
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

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfVB6kACgkQN1Ujt2V2gBwdRACgtRxij2J97/FTVWOHiwzuOLHC
FikAnilhjlw/duXya81SxBFU6CrUbzpD
=2293
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
