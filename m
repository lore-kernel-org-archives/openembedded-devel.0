Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 698E6606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 17:07:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so7401549wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FjEmEWdKaC0T6y0UbDMouVEnqaKfxtpREvI4QJQSX/U=;
	b=CT6wSumoIM9KPMdg1oSSwBX7Dyzwddy+zJ0wYVUnc1k5UUiFL4jaojvaDlqQQ4bG+K
	ywuXi4K67aQ1LTSpGGkciSy0Z8ciGLpwUg5bRyOKHJNIs9k3J4NzwAG+CtOGB03Pg9Ri
	r+ZQiWKo58Z8AfMSTydJmmc0pO8txuD5dkjRHNZt0Qyy+QwoW/7vyTx9m80xtv5CViNR
	sKAoxxMVwfnsTqN+bxw6guGPa7c8tGRaemULvthezU0azHaNMZsGXkdK942PoiZ858VJ
	vl3BEyECXK5NP9hBCE92cNccP56podoiNC0WuGqx+Cw89My1RCddqE87UFUMsxae+urL
	cCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FjEmEWdKaC0T6y0UbDMouVEnqaKfxtpREvI4QJQSX/U=;
	b=M/StTrkzy5ArR2Mc64PKyNIZy74pdxWvB4kPY+49vZP6iTVoUfdofcKefefYVKlENB
	cCsRxq2GirD98QFtg5B9R9T+9h9aZMSsGjxODJr+FKkZdurahz0Utd7kuNolM2q+F4JQ
	vsIf46Khvo1m7P/Np++xbbwr2tEPuJC4dMuHPPQfzxVW+iWNvSrShvo1QwNWQ2CTb1Wf
	IrA3uwFDD626rH5BQkGmB42nosaL2WvpHJ8YjddKyEgEQbK7cgMenr3nyOH9IzjygiP2
	msuj76sq/1T2/Y2eRJO6N7Fgp9QzRxXk2WeZk/MWU/+9N0ucaNnoPMjn8IT1nFqnzBZa
	LXPA==
X-Gm-Message-State: AEkoouuaFHqXaQsdsBWjg3rSETquPInvvvv16TVuX166Bp/zw4FXKfhYLT86HPft50RqJA==
X-Received: by 10.28.236.24 with SMTP id k24mr19951450wmh.47.1469639247056;
	Wed, 27 Jul 2016 10:07:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id e65sm8111988wmg.3.2016.07.27.10.07.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jul 2016 10:07:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jul 2016 19:07:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160727170729.5yewfhqsfgdraupx@jama>
References: <1469638425-30339-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1469638425-30339-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-webserver][PATCH] nostromo: update to version 1.9.6 * Update license checksum to include latest copyright information * Update patch for the latest version
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
X-List-Received-Date: Wed, 27 Jul 2016 17:07:27 -0000
X-Groupsio-MsgNum: 62366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wekvq36ojssxaett"
Content-Disposition: inline

--wekvq36ojssxaett
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 12:53:45PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

Missing blank line after summary, will fix that when cherry-picking
this.

> ---
>  ...GNUmakefile-add-possibility-to-override-variables.patch | 14 ++++++++=
+-----
>  .../nostromo/{nostromo_1.9.5.bb =3D> nostromo_1.9.6.bb}      |  6 +++---
>  2 files changed, 12 insertions(+), 8 deletions(-)
>  rename meta-webserver/recipes-httpd/nostromo/{nostromo_1.9.5.bb =3D> nos=
tromo_1.9.6.bb} (93%)
>=20
> diff --git a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile=
-add-possibility-to-override-variables.patch b/meta-webserver/recipes-httpd=
/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
> index 7cf011b..8cd4682 100644
> --- a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-po=
ssibility-to-override-variables.patch
> +++ b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-po=
ssibility-to-override-variables.patch
> @@ -91,7 +91,9 @@ diff --git a/src/nhttpd/GNUmakefile b/src/nhttpd/GNUmak=
efile
>  index f6d12de..9524911 100644
>  --- a/src/nhttpd/GNUmakefile
>  +++ b/src/nhttpd/GNUmakefile
> -@@ -1,18 +1,18 @@
> +@@ -1,20 +1,20 @@
> + #	$nostromo: GNUmakefile,v 1.6 2016/04/12 19:02:06 hacki Exp $
> +=20
>  -CCFLAGS =3D -O2 -pipe -Wall -Wstrict-prototypes -c
>  +CFLAGS :=3D -O2 -pipe -Wall -Wstrict-prototypes -c
>  =20
> @@ -120,14 +122,16 @@ diff --git a/src/tools/GNUmakefile b/src/tools/GNUm=
akefile
>  index 15bea61..663ddb5 100644
>  --- a/src/tools/GNUmakefile
>  +++ b/src/tools/GNUmakefile
> -@@ -1,11 +1,11 @@
> +@@ -1,13 +1,13 @@
> + #	$nostromo: GNUmakefile,v 1.3 2016/04/12 19:02:58 hacki Exp $
> +=20
>  -CCFLAGS =3D -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
> -+CCFLAGS :=3D -O2 -pipe -Wall -Werror -Wstrict-prototypes
> ++CFLAGS =3D -O2 -pipe -Wall -Werror -Wstrict-prototypes
>  =20
>   crypt:		crypt.o
> --		cc -o crypt crypt.o -lcrypt
> +-		cc -L../libbsd -o crypt crypt.o -lcrypt -lbsd
>  -		strip crypt
> -+		$(CC) $(CFLAGS) -o crypt crypt.o -lcrypt
> ++		$(CC) $(CFLAGS) -L../libbsd -o crypt crypt.o -lcrypt -lbsd
>  +#		$(STRIP) crypt
>  =20
>   crypt.o:	crypt.c
> diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/me=
ta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> similarity index 93%
> rename from meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> index 562ecd0..e06a696 100644
> --- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> +++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "A simple, fast and secure HTTP server"
>  HOMEPAGE =3D "http://www.nazgul.ch/dev_nostromo.html"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://src/nhttpd/main.c;beginline=3D2;endline=3D1=
4;md5=3De5ec3fa723b29b7d59d205afd8d36938"
> +LIC_FILES_CHKSUM =3D "file://src/nhttpd/main.c;beginline=3D2;endline=3D1=
4;md5=3D0bb3711a867b9704d3bfabcf5529b64e"
> =20
>  SRC_URI =3D "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
>             file://0001-GNUmakefile-add-possibility-to-override-variables=
=2Epatch \
> @@ -11,8 +11,8 @@ SRC_URI =3D "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.=
gz \
>             file://nostromo \
>  "
> =20
> -SRC_URI[md5sum] =3D "dc6cfd6b5aae04c370c7f818fa7bde55"
> -SRC_URI[sha256sum] =3D "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc=
18523bad62f6b914"
> +SRC_URI[md5sum] =3D "27aa241d78ff78920354c3e03a5026ea"
> +SRC_URI[sha256sum] =3D "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af=
44c7cdb1f411e8eb"
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wekvq36ojssxaett
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleY6lAACgkQN1Ujt2V2gBzg0gCfUaHvQBO3+xodhAEWgkjZz1qe
JasAn2bQp+1CGQ31e4yb+hZZbu3pEhKj
=24gm
-----END PGP SIGNATURE-----

--wekvq36ojssxaett--
