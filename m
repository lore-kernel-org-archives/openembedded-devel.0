Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA4D71B31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:18:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so43446832wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=p4kJ5Qbde+A41TCdwzaqq1u5+hZTrG6Y7BkOkT2+Ink=;
	b=CTp1Xr0nEb1DabBGiOLaDZw1fJONhzTtA8mg7U5yoaZS7d1nb8B7Kt4CwZgm1m5nO6
	AOnTGXefPDa1ox0rS2Ho9Cy8miktGgTdQ7RaQzzLggqrONTgL25mWmxpORCjKZ3553ot
	S1dD1bKS1KGEc68jwYYjV6qVyR7B4WgDCRoVEb+xzHGbC6hqNc2zRphwisLwCJung1bQ
	2Q//vTglgHANOPxaacVOKGjCrxpYqyz0e+yLVVY8bVuBAlc1MGTFDYSF0K2GfNXya3/U
	KfVnLS0PHTkNHuEk44dSFKYF8buIMSP2lF+EM5WOe9eIzG6ZbXlNoWkWMJ3Yea9V6XA6
	bOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=p4kJ5Qbde+A41TCdwzaqq1u5+hZTrG6Y7BkOkT2+Ink=;
	b=M5m9gQlaArOv9QTiZscS3BtDHNpZT+tzrPg/VzJQuV0sEiGOmxM+OxcopnBddEdU0x
	1tVKIlWeUM1AQ5LNk0ZhI+LFTX6FI6JG1uAgkJ9hqkNiGu7m2O4dDtBQV/1iFfrvobrv
	ze9LmIRYvf+j+kv0sLI9n57mMEwkYS0YVvPQAIPpguZV2QOz2qx1MfGiE3SaQ88wHSTr
	pYvy0l9mnbZzKVVW0Fbk2UKftLFFk/iD9OhS40nnW5Li091NYcYqPQNA3WMLzuF9g+hy
	QcJh0zZQhWP29N7m72hD3XWbivkpSpDdBkKhF2K1mz6yCfvyzSwQvVxC35+Dg99umgxp
	d0dg==
X-Gm-Message-State: AIkVDXKsS0IzqxYguuitkaSzQ6L9CIlDrubAsM0IJi4Nr/fDTHHr1ooXUnHfi5QKlgP2Mw==
X-Received: by 10.223.164.66 with SMTP id e2mr33691144wra.47.1485361133187;
	Wed, 25 Jan 2017 08:18:53 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g75sm1363253wme.5.2017.01.25.08.18.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 08:18:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 17:18:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170125161855.GG3260@jama>
References: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
	<1484923430-3222-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1484923430-3222-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 2/2] libxcalibrate: add, from oe-core
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
X-List-Received-Date: Wed, 25 Jan 2017 16:18:54 -0000
X-Groupsio-MsgNum: 64855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7lMq7vMTJT4tNk0a"
Content-Disposition: inline

--7lMq7vMTJT4tNk0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 02:43:50PM +0000, Ross Burton wrote:
> ---
>  .../xorg-lib/libxcalibrate/fix-xcb.patch           | 29 ++++++++++++++++=
++++++
>  .../recipes-graphics/xorg-lib/libxcalibrate_git.bb | 22 ++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-x=
cb.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patc=
h b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
> new file mode 100644
> index 0000000..d614883
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Pending
> +
> +There is no extra reply data and if we say not to disgard it, xcb
> +throws fatal asserts.
> +
> +RP - 26/11/09
> +
> +Index: git/xcalibrate.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/xcalibrate.c	2009-11-26 08:11:48.000000000 +0000
> ++++ git/xcalibrate.c	2009-11-26 08:09:55.000000000 +0000
> +@@ -216,7 +216,7 @@
> +   req->reqType =3D info->codes->major_opcode;
> +   req->xCalibrateReqType =3D X_XCalibrateRawMode;
> +   req->on =3D enable;
> +-  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse))=20
> ++  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue))=20
> +     {
> +       UnlockDisplay (dpy);
> +       SyncHandle ();
> +@@ -240,7 +240,7 @@
> +   req->xCalibrateReqType =3D X_XCalibrateScreenToCoord;
> +   req->x =3D *x;
> +   req->y =3D *y;
> +-  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse))=20
> ++  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue))=20
> +     {
> +       UnlockDisplay (dpy);
> +       SyncHandle ();
> diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/met=
a-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb
> new file mode 100644
> index 0000000..455e869
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "XCalibrate: Touchscreen calibration library"
> +
> +DESCRIPTION =3D "libXCalibrate is a library for performing touchscreen \
> +calibration with the kdrive tslib touchscreen driver."
> +
> +require xorg-lib-common.inc
> +
> +LICENSE =3D "MIT-style"
> +LIC_FILES_CHKSUM =3D "file://xcalibrate.h;endline=3D21;md5=3Dfa572df6439=
f0f235f2612f370f153d7 \
> +                    file://xcalibrate.c;endline=3D21;md5=3Dfa572df6439f0=
f235f2612f370f153d7"
> +
> +DEPENDS =3D "virtual/libx11 calibrateproto libxext"
> +
> +SRCREV =3D "209d83af61ed38a002c8096377deac292b3e396c"
> +PV =3D "0.0+git${SRCPV}"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
> +           file://fix-xcb.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +FILES_${PN}-locale +=3D "${datadir}/X11/locale"

Why do we need this in meta-oe? Just because xtscal was dumped here as
well?

Both are broken because of the path to .inc file:
Parsing recipes...ERROR: ParseError at
/OE/build/oe-core/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxc=
alibrate_git.bb:6:
Could not include required file xorg-lib-common.inc


> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7lMq7vMTJT4tNk0a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIjP7gAKCRA3VSO3ZXaA
HF9OAJ9pTsskf9jZA0uA1XFE08RFpdSBjgCcCKqlb54bvWUrTlq0OM2D+ThrnuU=
=0Njx
-----END PGP SIGNATURE-----

--7lMq7vMTJT4tNk0a--
