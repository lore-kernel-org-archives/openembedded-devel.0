Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DAAAC731D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:39:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so3194233wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JOYq1TFKbN7ABmGXTq7IlVKWxGJ568SgZ1lyIcmWAGI=;
	b=sLfW6QszaCVx/0uUmdaGb3UCbdqdmkRVlbHC0iWMDjzndKY7CwGJlUcy6KbVKkgb+6
	QH3OkEb2GXbii1Uu5la4lC+/3qilOnCrNeWwav0rlC6TgTtn4cBspePHVdS963HjBaOE
	V89crWaMnkQq/XPDRwrUPP2tLeZjYqCYiYvB7jZaDz69sVtFkxadKLSRmlWiVL482R+0
	vNAokK2lIBB/iHr7FP2nx6Uphxq6hjbWSE9TYL9rXm8u/RktuNIPujBQ5nKEcud4Tf3I
	QC9wWhYo3SHjJIssKD1LKQSMdvyQBRIhcR7TiWTQLFu/ew5+A/ds76G6qP062TNCcUhl
	CKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JOYq1TFKbN7ABmGXTq7IlVKWxGJ568SgZ1lyIcmWAGI=;
	b=jYVPtINdUYQTk5Ren5Zw9zAVWR1DGM6JaYK+8tAQSo9+vLrZ7DqYCBXm4g1x0Nmez2
	kdfq3yaStMxknDuyUBO1tOUqif5VT8CMzQXDoWztL9ThEygO5olnje9ztOVZqMvdHFb0
	/NPOQc/3fMj9sOch4Pcys84zohxQvjhcGWtdavmbYy/QxVlwtGU/gWZ/4iYX4qfta5yM
	EaFtQgsSVQGP6+sk/R/uTx1zghalEeGeW2owheIzZOlSGd3nnF15bezUEhK4psdsifqh
	T3lDId6BuuY1ZPWT0vt0LyDU031FZ6u4J3e9X/7R8U9Ls24zOjzrdnj13kfCUGGZcv/l
	TiSw==
X-Gm-Message-State: AD7BkJILMoi6KH8zXJLNR3N65riRyvFL0pDGULQl1ufgu4H+wMDl2cINPxuUbouCGjn74A==
X-Received: by 10.28.59.87 with SMTP id i84mr2668418wma.61.1459503576890;
	Fri, 01 Apr 2016 02:39:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t8sm13144002wjy.41.2016.04.01.02.39.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 02:39:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 11:39:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160401093950.GA2567@jama>
References: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
	<1459497633-32109-3-git-send-email-anujx.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <1459497633-32109-3-git-send-email-anujx.mittal@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-filesystems][PATCH 2/2] exfat-utils: update to version 1.2.3
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
X-List-Received-Date: Fri, 01 Apr 2016 09:39:37 -0000
X-Groupsio-MsgNum: 60768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 04:00:33PM +0800, Anuj Mittal wrote:
> *License file checksum has changed

That's clear from LIC_FILES_CHKSUM, you should stay what changed in the
file (often only Copyright years or author names), but saying that the
checksum is different doesn't help.

> *Package now uses autotools instead of scons
>=20
> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> ---
>  .../{exfat-utils_1.0.1.bb =3D> exfat-utils_1.2.3.bb}       | 16 ++++----=
--------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>  rename meta-filesystems/recipes-utils/exfat-utils/{exfat-utils_1.0.1.bb =
=3D> exfat-utils_1.2.3.bb} (65%)
>=20
> diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1=
=2Ebb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
> similarity index 65%
> rename from meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.=
bb
> rename to meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
> index a5a314f..7991aa7 100644
> --- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.bb
> +++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
> @@ -10,20 +10,12 @@ contains \
>  HOMEPAGE =3D "http://code.google.com/p/exfat/"
>  SECTION =3D "universe/otherosfs"
>  LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/e/exfat-utils/exfat-utils_${PV}.orig.=
tar.gz \
>  "
>  DEPENDS =3D "virtual/libc"
> =20
> -inherit scons
> +inherit pkgconfig autotools
> =20
> -SRC_URI[md5sum] =3D "e592130829d0bf61fa5e3cd1c759d329"
> -SRC_URI[sha256sum] =3D "eeacedca1878065dc3886674ae39cd51149c37bd7d6d7e93=
25c971a1d1acdab3"
> -
> -EXTRA_OESCONS =3D " \
> -    DESTDIR=3D${D}/${base_sbindir} \
> -"
> -
> -do_install_prepend() {
> -    install -d ${D}/${base_sbindir}
> -}
> +SRC_URI[md5sum] =3D "f4e564450aa8159e26dde2869563d242"
> +SRC_URI[sha256sum] =3D "80d3b3f21242d60d36a38a4ddb05cb7cc3a7d4eef5793e83=
14814937b938fcea"
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

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+QeUACgkQN1Ujt2V2gBzV9gCgjSiuDkfxbY+YrLBXDnhzgc9c
OCAAn3QVvnLjkaMxjDSkxqK3rocme7Mm
=vbxM
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
