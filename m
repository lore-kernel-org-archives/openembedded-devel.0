Return-Path: <joe@deserted.net>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A32C26B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:02:37 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id x19so7857246ier.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pq/dHVBp1ziJ38blFuGwDzFpgSym3OiJa05A6Lgkl/E=;
	b=F0Mu5dYu9cMrQmm6DjWKloNid64V/p4jmoIK4loSh/HO6AxXhaACmkvtiMaFaKUQ4k
	wh4CGU1LUVYk7kouflAPxglpPnp1qFE17OeS0+Yl7OfnEWb9PiUR7WIVwqPiipl7lUqI
	oBexm+Mjv/1vdlmbOM4e0bJbcoKKVqICdOPV5xF/KLw+tKbqF5Ol727Aiuk204t8LqP5
	PATiGea14+SN///FAJO+V7Lm1RWnqQyNy9t8t7RxCC+yhZDBl5wgzphko+P8FxT4Fve4
	mUQ4Kqag4WOPJXTGSv9bTjby0BTqEk2j/TUfVrZPAUieySlB+n/7rPP33Wk/vRny8tZd
	qAiA==
X-Gm-Message-State: ALoCoQljvJdvAwd1OS/D3MHpaE+X0C/jBElGtqQBu0XhtuBUdLW0fSxPsURxFL/OlVmEBjz99WHz
X-Received: by 10.51.17.2 with SMTP id ga2mr27233626igd.12.1411524158394;
	Tue, 23 Sep 2014 19:02:38 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id c7sm3164176igx.11.2014.09.23.19.02.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:02:37 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 8CE101685E4; Tue, 23 Sep 2014 22:02:36 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:02:36 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020235.GB16953@deserted.net>
References: <1410824631-1845-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1410824631-1845-1-git-send-email-jslater@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 1/1] vftpd: update to version 3.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Sep 2014 02:02:38 -0000
X-Groupsio-MsgNum: 52203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline

--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 1/1] vftpd: update to version 3.0.2] On 14.09=
=2E15 (Mon 16:43) Joe Slater wrote:

> No changes other than source checksum.

Merged, thanks.

-J.

>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../makefile-destdir.patch                         |    0
>  .../makefile-libs.patch                            |    0
>  .../makefile-strip.patch                           |    0
>  .../nopam-with-tcp_wrappers.patch                  |    0
>  .../{vsftpd-3.0.0 =3D> vsftpd-3.0.2}/nopam.patch     |    0
>  .../vsftpd-tcp_wrappers-support.patch              |    0
>  .../vsftpd/{vsftpd_3.0.0.bb =3D> vsftpd_3.0.2.bb}    |    5 +++--
>  7 files changed, 3 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/makefile-destdir.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/makefile-libs.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/makefile-strip.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/nopam-with-tcp_wrappers.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/nopam.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 =3D> vsftpd-=
3.0.2}/vsftpd-tcp_wrappers-support.patch (100%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.0.bb =3D> vsft=
pd_3.0.2.bb} (96%)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile=
-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefi=
le-destdir.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-=
destdir.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-de=
stdir.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile=
-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-=
libs.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-=
libs.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-li=
bs.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile=
-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile=
-strip.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-=
strip.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-st=
rip.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-wi=
th-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2=
/nopam-with-tcp_wrappers.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-wit=
h-tcp_wrappers.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-=
tcp_wrappers.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.pa=
tch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.pat=
ch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-t=
cp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3=
=2E0.2/vsftpd-tcp_wrappers-support.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tc=
p_wrappers-support.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_=
wrappers-support.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> similarity index 96%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> index 5df8211..a1c4ff4 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> @@ -21,8 +21,9 @@ SRC_URI =3D "https://security.appspot.com/downloads/vsf=
tpd-${PV}.tar.gz \
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271 \
>                          file://COPYRIGHT;md5=3D04251b2eb0f298dae376d9245=
4f6f72e \
>                          file://LICENSE;md5=3D654df2042d44b8cac8a5654fc5b=
e63eb"
> -SRC_URI[md5sum] =3D "ad9fa952558c2c5b0426ccaccff0f972"
> -SRC_URI[sha256sum] =3D "ef70205dcd0c7f03b008b9578fb44c0cbe31e66daab8cfaf=
b9904747c17fc2a8"
> +SRC_URI[md5sum] =3D "8b00c749719089401315bd3c44dddbb2"
> +SRC_URI[sha256sum] =3D "be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977=
f8537fcd0b195e56"
> +
> =20
>  PACKAGECONFIG ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D ",,tcp-wrappers"
> --=20
> 1.7.3.4
>=20
--=20
-Joe MacDonald.
:wq

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJjsACgkQwFvcllog0XyXpACff47ZPVdUCfdBJ4UinFafqn1r
/uAAoKuaSF0jTmvDD3qMZ5k+gl1GbL8W
=iP5H
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
