Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AAB0F60111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 09:04:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so3720411wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oxBL22TBisnR05UNwp+hkcgYzve7OhFHn5kQxS6rSiY=;
	b=vkatKjutN03ljInHXseWgwXGM1DLirveqsVfa50RNlrnoeaWh08r6vAxEjg6Jujq7L
	XzLCrY1AyV1y1bjq4xL5mRrI2b7MlU6EqKbgPLQdEz/dRoOtFosPQj8LXxQlEChrjuc9
	kmbFcN+piYt0po3Eq7lYG5etpoB0Eo3QmekmUq2f8fNDAo8xGUG1dnQPlTa6+gSYDPCY
	GSZC011kl51hmGk61FBx/3+NDUmhS2r5ONGF5xfFWI1izqk57YnB06LzbJTVI+/01myX
	KmBg05NXv2Yyd1U2WugFaL/D8QRiCJdanXbasdz/+zyGec7jD0lMMvGIByOnU+NZBrZz
	kxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oxBL22TBisnR05UNwp+hkcgYzve7OhFHn5kQxS6rSiY=;
	b=EJd2MUE55/SXNC17atMvb+YhZAdddMpPOecx7fwnJSBJf/jFkikx1A2R9/kkRNkFem
	YT6PHk2lZQzy2vYwCQrj4jKvGShMXceMNKU8FDtdncGxFm+lEoy5z0DiREwz064pRoil
	yf6Puae9tZZ2VNom5hL6yqFmCSghr/iLgysyyWJBIx2UOkZtdXQAwZZ+CR0ZM7ysj/+b
	F2H+0Dzwn/kycFszK1H39PZNRBKxFKZ6LPp4L5VrMmBiUHxhe1A/01CKwDK3uoMKqrpL
	+5QfqQbacDhNVjty94TYLNkOIfSNlymRHC0ojo6jftlgFEMJS09GygGcGJnTgqbJFVRd
	vlpw==
X-Gm-Message-State: ALyK8tJDcbCAMe+FEksHSCAUospdhW2L/lZfU8oc5V6YytontLbABc7iGZn+pdrYUejSYQ==
X-Received: by 10.194.191.135 with SMTP id gy7mr2468953wjc.125.1467363842966; 
	Fri, 01 Jul 2016 02:04:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i74sm1389644wmg.21.2016.07.01.02.04.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jul 2016 02:04:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Jul 2016 11:04:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160701090408.GA2561@jama>
References: <1467362919-23262-1-git-send-email-zoltan.kuscsik@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1467362919-23262-1-git-send-email-zoltan.kuscsik@linaro.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-filesystems][master][PATCHv2] sshfs-fuse: update to 2.8
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
X-List-Received-Date: Fri, 01 Jul 2016 09:04:04 -0000
X-Groupsio-MsgNum: 62017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 10:48:39AM +0200, Zoltan Kuscsik wrote:
> Update SRC_URI, upstream project was
> moved from SF to github.
>=20
> Fix building issue when build and source
> directory differs.
>=20
> Upstream-Status: Submitted
>=20
> https://github.com/libfuse/sshfs/pull/24

This belongs to the .patch file itself.

>=20
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> ---
>  .../files/0001-Makefile-fix-path-for-sshfs.1.patch | 27 ++++++++++++++++=
++++++
>  .../{sshfs-fuse_2.5.bb =3D> sshfs-fuse_2.8.bb}       |  9 ++++----
>  2 files changed, 31 insertions(+), 5 deletions(-)
>  create mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/files=
/0001-Makefile-fix-path-for-sshfs.1.patch
>  rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.5.b=
b =3D> sshfs-fuse_2.8.bb} (65%)
>=20
> diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-M=
akefile-fix-path-for-sshfs.1.patch b/meta-filesystems/recipes-filesystems/s=
shfs-fuse/files/0001-Makefile-fix-path-for-sshfs.1.patch
> new file mode 100644
> index 0000000..39c1f04
> --- /dev/null
> +++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/files/0001-Makefile=
-fix-path-for-sshfs.1.patch
> @@ -0,0 +1,27 @@
> +From e3cd445a4ee44a16faa646d7b642d02eea62b1f8 Mon Sep 17 00:00:00 2001
> +From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> +Date: Fri, 1 Jul 2016 09:30:31 +0200
> +Subject: [PATCH] Makefile: fix path for sshfs.1
> +
> +Fix source path when build directory differs
> +from the source dir.
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index f003bae..3d8f9cb 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -24,7 +24,7 @@ sshfs.1: sshfs.1.in
> + 	$(AM_V_GEN)sed \
> + 	    -e 's,__IDMAP_DEFAULT__,$(IDMAP_DEFAULT),g' \
> + 	    -e 's,__UNMOUNT_COMMAND__,$(UNMOUNT_COMMAND),g' \
> +-	    <sshfs.1.in >sshfs.1.tmp || exit 1; \
> ++	    <$(srcdir)/sshfs.1.in >sshfs.1.tmp || exit 1; \
> + 	mv sshfs.1.tmp sshfs.1
> +=20
> + if SSH_NODELAY_SO
> +--=20
> +1.9.1
> +
> diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2=
=2E5.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
> similarity index 65%
> rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.=
5.bb
> rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.=
bb
> index c54cfcb..64ccdac 100644
> --- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
> +++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.8.bb
> @@ -6,12 +6,11 @@ LICENSE =3D "GPLv2"
>  DEPENDS =3D "glib-2.0 fuse"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/${BP}.tar.gz"
> -S =3D "${WORKDIR}/${BP}"
> +SRC_URI =3D "git://github.com/libfuse/sshfs;tag=3Db2fa7593586b141298e615=
9f40f521d2b0f4f894 \
> +           file://0001-Makefile-fix-path-for-sshfs.1.patch"
> +
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools pkgconfig
> =20
>  FILES_${PN} +=3D "${libdir}/sshnodelay.so"
> -
> -SRC_URI[md5sum] =3D "17494910db8383a366b1301e5f5148a9"
> -SRC_URI[sha256sum] =3D "e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d2089=
49e00a3a46c6e63e"
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

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAld2MgcACgkQN1Ujt2V2gByRyQCcCNvR/vtrDZC5tlrQfVO0iKDS
5I0An21YC6rSnrzTIBd6QRUttF13b67e
=2YxY
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
