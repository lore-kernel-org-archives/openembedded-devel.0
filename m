Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 48AFB77204
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 11:46:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so893818wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JXZ3mlrwZ4INdhGH1s0eL1d37fRXWTS19YReEZluRi4=;
	b=a+IKin9zbhsIkyONA1wG11/2/0dIlLSSFTetEZLtIEt0F0HbXMiJTcY11vxtqWoVcH
	RajvWWhRAQjXPrkoLo4f+GNMqSz+ULaGXDxqTnj3Z0lAXU2G6+m1KGfVNcM1bE/RL3hy
	OTUlt8vfR8QAEx3dS1joY1ckfv7RcxO3GRGpXjxAPwMy3vEG3UMs+mc5PkWSMz6NaNrf
	u0bpWCgP9H7QKFJywrI5T8qOxdMF1AFKa+j8xJJs/k8/HPNyF/doVrmMiMJKzl5KB5Vt
	PQgF0eMwJlPmrJbkCPhXww7EZf2s5BmmiaWVSRFeny1636i2fWqNpITFyuPo7kqpFzrD
	qK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JXZ3mlrwZ4INdhGH1s0eL1d37fRXWTS19YReEZluRi4=;
	b=SCEH3Bp+UewrR3n3Pzuq1LmegkxoI0ptvJ1b8zvc18Dpdm9aHd9gsmM6fDKZMEl48W
	0izTtu46/N80T3hOvxOt+FtH2ogQrAwIXL/5hgUeQIZdlU2xVbDpXWgxn6p51SPF9fjF
	IpAjXPcf45/OINmz23ify4WyGy1X/Q2MqP8zgSHd1MDAr/QmCIN7RLOaER349WjTp26Y
	E5uimKnIgdeM8suAcVWbi8FeTaiHxo2ejECDPz9dutZDDUjh7Hd6oiGwe52zZm3uZQ9C
	DDYz+A6QagTpGZPhV+rZX0QXp/vZz8x1k18B+CxpoqoG6F3jW4Dq8NUVa8j1dsNmbQe8
	NZPg==
X-Gm-Message-State: AEkoout/cs8NNQPxfG0pMRqVbtXVK5OgdXAXe/dQn34J7rkFKc2OFIQbTG7kqYRBnUVGZw==
X-Received: by 10.194.16.162 with SMTP id h2mr9373110wjd.52.1470915963128;
	Thu, 11 Aug 2016 04:46:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id q4sm2335453wjk.24.2016.08.11.04.46.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Aug 2016 04:46:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Aug 2016 13:46:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160811114602.moixzrw6p73hm2lo@jama>
References: <1470914045-8059-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1470914045-8059-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH v2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 11:46:03 -0000
X-Groupsio-MsgNum: 62548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ssfqx2tgpog2a7r4"
Content-Disposition: inline

--ssfqx2tgpog2a7r4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 01:14:05PM +0200, Ricardo Ribalda Delgado wrote:
> -The repository has been moved to github.
> -There is a new release 0.3.4
> -Add a user configurable dependency on gflag
> -Merge .inc file on the recipe
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  ...configure.ac-Allow-user-to-disable-gflags.patch | 35 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
>  .../glog/{glog.inc =3D> glog_0.3.4.bb}               | 15 ++++++++--
>  3 files changed, 48 insertions(+), 8 deletions(-)
>  create mode 100644 meta-oe/recipes-support/glog/glog/0001-configure.ac-A=
llow-user-to-disable-gflags.patch
>  delete mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
>  rename meta-oe/recipes-support/glog/{glog.inc =3D> glog_0.3.4.bb} (49%)
>=20
> diff --git a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-us=
er-to-disable-gflags.patch b/meta-oe/recipes-support/glog/glog/0001-configu=
re.ac-Allow-user-to-disable-gflags.patch
> new file mode 100644
> index 000000000000..596281ff6842
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-d=
isable-gflags.patch
> @@ -0,0 +1,35 @@
> +From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Thu, 11 Aug 2016 11:49:36 +0200
> +Subject: [PATCH] configure.ac: Allow user to disable gflags
> +
> +Under some circumstances like cross-compilation, the user might not want
> +to enable support for gflags.
> +
> +This patch allows support for --without-gflags
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +---
> + configure.ac | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7b4d21e7ae8a..eba5e5cda1ea 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags, AS_HELP_STRING[--with-gflags=3D=
GFLAGS_DIR],
> +   CFLAGS=3D"$CFLAGS $GFLAGS_CFLAGS"
> +   LIBS=3D"$LIBS $GFLAGS_LIBS"
> + )
> +-AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=3D1, ac_cv_have_libgfla=
gs=3D0)
> ++if test x"$with_gflags" =3D x"no"; then
> ++  ac_cv_have_libgflags=3D0
> ++else
> ++  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=3D1, ac_cv_have_libgf=
lags=3D0)
> ++fi
> + if test x"$ac_cv_have_libgflags" =3D x"1"; then
> +   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags libra=
ry])
> +   if test x"$GFLAGS_LIBS" =3D x""; then
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb b/meta-oe/recipes=
-support/glog/glog_0.3.3.bb
> deleted file mode 100644
> index de3f0765dec9..000000000000
> --- a/meta-oe/recipes-support/glog/glog_0.3.3.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require glog.inc
> -
> -SRC_URI =3D "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "a6fd2c22f8996846e34c763422717c18"
> -SRC_URI[sha256sum] =3D "fbf90c2285ba0561db7a40f8a4eefb9aa963e7d399bd4503=
63e959929fe849d0"
> diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-supp=
ort/glog/glog_0.3.4.bb
> similarity index 49%
> rename from meta-oe/recipes-support/glog/glog.inc
> rename to meta-oe/recipes-support/glog/glog_0.3.4.bb
> index 8a1fb4250bbb..87b27c1eda41 100644
> --- a/meta-oe/recipes-support/glog/glog.inc
> +++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
> @@ -1,11 +1,22 @@
>  DESCRIPTION =3D "The glog library implements application-level logging. =
This \
>  library provides logging APIs based on C++-style streams and various hel=
per \
>  macros."
> -HOMEPAGE =3D "https://code.google.com/p/google-glog/"
> -
> +HOMEPAGE =3D "https://github.com/google/glog"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc9db360e0bbd4e46672f3fd91dd6=
c4b"
> =20
>  DEPENDS =3D "libunwind"
> =20
> +SRC_URI =3D "\
> +	   git://github.com/google/glog.git \
> +	   file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
> +	   "

Please see show we normally indent multiline variables (4 spaces,
closing quote as first character on separate line.

I'll update this for now, but next time please follow this.

> +
> +SRCREV =3D "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[gflags] =3D ",--without-gflags,gflags,"
> +
>  inherit autotools pkgconfig
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

--ssfqx2tgpog2a7r4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlesZXkACgkQN1Ujt2V2gBwi4wCgklD30/bZI2K8xYaZRM9UC8Pp
VUsAnRmPdHFJOeyA8rO/XXr/YYLlCRRT
=QmjE
-----END PGP SIGNATURE-----

--ssfqx2tgpog2a7r4--
