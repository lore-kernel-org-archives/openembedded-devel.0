Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB5A73174
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:40:56 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so228948551wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aEn7N6UqaL4nhs9faMo+8r29faJxyRPCSB7yTzwN3/Q=;
	b=c+be6qRtTWbK8hBskZLLxLFmQRsrETfnrKYjG01MGiYStcICC0Og7+3ABf6pyfoybZ
	OSNzTEn4ANYw8JkN/0WLO3LRTa+QsRL4irpjmHUlaq/T4TJVDxAneheSIxb6Tu2gcq22
	yywOWssuKioP55gYLxvyrFzG/JjEepVbrBD13iXK0De2ujNE7mBv3uBKLkxwfBLLnjZ0
	h765vTKCLTkj89JPByA+Lk4mJmGlaFLKT6BFBBv4JIJLDidKx4Hfd+SYH9/mKILgF35D
	8gvd3uJAHRCkk9FkKsjW5myVJJtUyNXXrB7lG/ON40sIM6DBsQWefmsbDmSSlN5xaK/Y
	QfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aEn7N6UqaL4nhs9faMo+8r29faJxyRPCSB7yTzwN3/Q=;
	b=OkjAp9o0EjZl607BZzbq0fQaSG7Tr4+j7fjLgw/9GiXnIlP9xZtL5IuPUsiLDXP3gx
	4ZF9Ut5a0JXAH0O5NYKfxk0xryQwUwFczbUZWWfTiKWPs6lH9OfHL55LiXCfaHT1rMLd
	Wuj/fihDzBoM7QodM0SjRfw4vCNxNk+k397tymanewoLy127Vjc+jFA0PYThZ5dX+sbK
	7Xhv6wl/KuNsHcuw4g0S50AHRkfNyG/5SAU+8A2X+g8pYojWeCRX3cMOa4ut2yNgzU1g
	eQ0L7g4Ol0jh+u1oeBqgBUHUkDjbw6pHadZ+b0RKxGYUcL699PEBL3Fxa21F5ulSJ/jL
	f/8A==
X-Gm-Message-State: AD7BkJIrpk+sW2VKWwcFB5piyWvT5xNfSXV6wyL8wtt2mxvAv7OEGruMOJCG9MF16kmHVg==
X-Received: by 10.194.188.20 with SMTP id fw20mr11613657wjc.80.1458225657364; 
	Thu, 17 Mar 2016 07:40:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u202sm30649511wmd.24.2016.03.17.07.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 07:40:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 15:44:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160317144440.GC2553@jama>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-2-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1457626042-28653-2-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v3 1/2] libass: Update to latest version
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
X-List-Received-Date: Thu, 17 Mar 2016 14:40:57 -0000
X-Groupsio-MsgNum: 60548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 05:07:21PM +0100, Gary Thomas wrote:
> libass has moved from Google to github.com
> Also update to the latest version (libass.so.5)

libass-0.13.2: ELF binary
'/tmp/work/i586-oe-linux/libass/0.13.2-r0/packages-split/libass/usr/lib/lib=
ass.so.5.3.0'
has relocations in .text [textrel]

> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/libass/libass.inc       | 7 ++-----
>  meta-oe/recipes-multimedia/libass/libass_0.10.1.bb | 5 -----
>  meta-oe/recipes-multimedia/libass/libass_0.13.2.bb | 4 ++++
>  3 files changed, 6 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>  create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recip=
es-multimedia/libass/libass.inc
> index 328cd14..a394c56 100644
> --- a/meta-oe/recipes-multimedia/libass/libass.inc
> +++ b/meta-oe/recipes-multimedia/libass/libass.inc
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "libass is a portable subtitle renderer for the ASS/SSA =
(Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostly =
compatible with VSFilter."
> -HOMEPAGE =3D "http://code.google.com/p/libass/"
> +HOMEPAGE =3D "http://github.com/libass/libass/"
>  SECTION =3D "libs/multimedia"
> =20
>  LICENSE =3D "ISC"
> @@ -7,10 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ae98663bac55=
afe5d989919d296f28a"
> =20
>  DEPENDS =3D "enca fontconfig freetype libpng fribidi"
> =20
> -INC_PR =3D "r1"
> -
> -SRC_URI =3D "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
> -
> +SRC_URI =3D "https://github.com/${PN}/${PN}/releases/download/0.13.2/${B=
P}.tar.gz"
>  inherit autotools pkgconfig
> =20
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.10.1.bb
> deleted file mode 100644
> index 0b32276..0000000
> --- a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require ${PN}.inc
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "6cace482a013a3c4bf3b31a68ac66026"
> -SRC_URI[sha256sum] =3D "629a7e81fff92dea8d0399b818a41fd1b61e381c67a5961b=
1eaec2efadb14c6c"
> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.13.2.bb
> new file mode 100644
> index 0000000..123c9dd
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
> @@ -0,0 +1,4 @@
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "b4d82616bb18e8e954b18746a105a3b8"
> +SRC_URI[sha256sum] =3D "8baccf663553b62977b1c017d18b3879835da0ef79dc4d3b=
708f2566762f1d5e"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbqwtcACgkQN1Ujt2V2gBy5BQCfRHJd8H2rpYgiUQTL8WgJHXho
75gAoJV1nm+KU6CG9xT4akg7DWteN1/f
=Czm5
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
