Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D388471A2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 07:52:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v4so35824823wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OMboLPbuhIFiWMe/9aLLLgODW6iMzvYVj8OgPsZuKfo=;
	b=eGxS0q/HNfaypLitBCzQfFeiH1Bic+zOonRHRDjvB+UaRIl3O+BLDrHur3XL7R3YBP
	5kXhMJXzP/OpG36+O3yCnT8ZIDAbLUngFkhG6x/l74SymTAmPgRYfur5ZVbJVa90sM9f
	jZE+36oTRCfCImEknw8hxlCjFiWSdVZoIC+cv3bXSWvJ5dvpTYLKGN6Gv9FCJxxLiqod
	+nC3OPaWqMg8eiyMDczeLvlbVTntNN+WhcETkd1k0iVU3l8/EX/KNQcdv5kTb6hzthWy
	jyfElkRkgNuj3uYWV6NJkz/5w2vrX80LBnJsh6tSvEdctpATYuIxr6fzsZBBawm8XkS2
	XdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OMboLPbuhIFiWMe/9aLLLgODW6iMzvYVj8OgPsZuKfo=;
	b=IYi240pnk3WryLUhYkAtD0eOcUUMhnF5lfemO31URmQbk+sdvxapVf4ejKYGdwgb0F
	xm0LrajE1+Naa0EzKV4wY9RlmqjtB53Li3KJ5lDJ3gtdR6G5h99DQ4LJCUrjGjqdtnOu
	lVgz7SOG0Gjs48U5XCH97y1ut8y9K1u4blhBv2Us7a1aWStrNGLTP3SMCLI3y+yHnw4L
	1Oq+pGCg29G9KpG0SOwZnl17ALLpYzuihHYBUUH4gBhtdSKXwcn08oUMe8wEHonSHKKE
	1XkD9wIE7FR/02YeShtclJi9ceh296GUi4XEJQb04tQ2zlXCpy709U3BP+t1t8k14Dky
	+Tyw==
X-Gm-Message-State: AODbwcAF6zd8k8iM1LsvxzoFEcAuIqihLtjk4s2qeUkqTTQEDE+Bhdy0
	iFH7yZLqQZv0puHU
X-Received: by 10.28.8.145 with SMTP id 139mr5609497wmi.26.1494921166682;
	Tue, 16 May 2017 00:52:46 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y3sm585370wrd.23.2017.05.16.00.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 May 2017 00:52:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 May 2017 09:53:35 +0200
To: clement.perrochaud@openmailbox.org
Message-ID: <20170516075335.GB3088@jama>
References: <b6a126b1859da5f97b77cdf15d26bf0a@openmailbox.org>
MIME-Version: 1.0
In-Reply-To: <b6a126b1859da5f97b77cdf15d26bf0a@openmailbox.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.18
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
X-List-Received-Date: Tue, 16 May 2017 07:52:46 -0000
X-Groupsio-MsgNum: 66749
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 06:30:23PM +0200, clement.perrochaud@openmailbox.or=
g wrote:
> This release includes the patch required for 2.11.16 and fixes the
> build issue.
> Removed from blacklist.

Your mail client wrapped couple lines in this patch, so it fails to
apply as you can see in:
https://patchwork.openembedded.org/patch/139800/

Use git send-email for configure your e-mail client correctly and
resend.

>=20
> Signed-off-by: Cl=E9ment Perrochaud <clement.perrochaud@openmailbox.org>
> ---
>   ...1-Add-config.h-include-to-src-lx_memory.c.patch | 41=20
> ----------------------
>   .../xorg-driver/xf86-video-geode_2.11.16.bb        | 16 ---------
>   .../xorg-driver/xf86-video-geode_2.11.18.bb        | 12 +++++++
>   3 files changed, 12 insertions(+), 57 deletions(-)
>   delete mode 100644=20
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-i=
nclude-to-src-lx_memory.c.patch
>   delete mode 100644=20
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
>   create mode 100644=20
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
>=20
> diff --git=20
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h=
-include-to-src-lx_memory.c.patch=20
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h=
-include-to-src-lx_memory.c.patch
> deleted file mode 100644
> index fcd2f684b..000000000
> ---=20
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h=
-include-to-src-lx_memory.c.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 621d946e56efac2c779b83b1a5c6b645169c4ebd Mon Sep 17 00:00:00 2001
> -From: "Brian A. Lloyd" <brian.lloyd@familyhonor.net>
> -Date: Wed, 1 Oct 2014 12:35:18 +0300
> -Subject: [PATCH] Add config.h include to src/lx_memory.c
> -
> -The src/lx_memory.c file uses the xf86.h header file.  This file must=20
> have
> -HAVE_STRNDUP defined before calling it when the building platform has a=
=20
> strndup
> -function.  When using config.h, this file doesn't have that define and=
=20
> so fails
> -to compile.
> -
> -The attached patch adds the conditional config.h to this file so it may=
=20
> compile
> -on the affected platforms.
> -
> -The patch is trivial and may be included and used under whatever=20
> licensing
> -desired.
> -
> -Closes: Free Desktop Bug #84541
> -
> -Signed-off-by: Brian A. Lloyd <brian.lloyd@familyhonor.net>
> -Upstream-Status: Backport
> ----
> - src/lx_memory.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/lx_memory.c b/src/lx_memory.c
> -index f26d280..992446f 100644
> ---- a/src/lx_memory.c
> -+++ b/src/lx_memory.c
> -@@ -22,6 +22,9 @@
> -  * contributors may be used to endorse or promote products derived=20
> from this
> -  * software without specific prior written permission.
> -  */
> -+#if HAVE_CONFIG_H
> -+#include "config.h"
> -+#endif
> -
> - #include "xf86.h"
> - #include "geode.h"
> ---
> -2.1.1
> -
> diff --git=20
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb=20
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
> deleted file mode 100644
> index e543413ad..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require recipes-graphics/xorg-driver/xorg-driver-video.inc
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3De7f3e39474aeea5af381a8e103dafc36"
> -
> -SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
> -SRC_URI[md5sum] =3D "35fa387f6a33f6b22a56ce4bda424392"
> -SRC_URI[sha256sum] =3D=20
> "38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7"
> -
> -COMPATIBLE_HOST =3D "i.86.*-linux"
> -
> -RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> -
> -# 2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/gx_driver.c:376:20:=20
> error: implicit declaration of function 'xf86MapVidMem'=20
> [-Werror=3Dimplicit-function-declaration]
> -PNBLACKLIST[xf86-video-geode] ?=3D "BROKEN, fails to build - the recipe=
=20
> will be removed on 2017-09-01 unless the issue is fixed"
> diff --git=20
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb=20
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
> new file mode 100644
> index 000000000..0c338c5f3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
> @@ -0,0 +1,12 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3De7f3e39474aeea5af381a8e103dafc36"
> +
> +SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "7d049187ee3640087e99f4267de6baf1"
> +SRC_URI[sha256sum] =3D=20
> "d6ece9a862a68be3cdf86a87e0e1ba5e199168b8d075129646638f53649ba9e8"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"
> +
> +RDEPENDS_${PN} +=3D "xserver-xorg-module-exa"
> --=20
> 2.12.2
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRqv/gAKCRA3VSO3ZXaA
HAlDAKCGB4/PnQFuP88j4FkQnohgmvg3hgCfQuEKHu2weZHkRFl+GXbdaC/8uho=
=+0JW
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
