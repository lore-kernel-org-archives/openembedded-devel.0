Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA98E731C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:39:30 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so2152003pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=lgwAd4w+hEs4LKfhNREUhp3+dCUTkepYrB5sLZODAhU=;
	b=yQ648HwINaugQzZBsiaEh8RInwz0jVKMAWNqU9uNmeR1mYP59PZxXQQXH+UXoqXq8W
	t9kidOlHBBdRNblcGWt+BRzquU5FOl3rBaDeipzzQpUeSNnj/uAWLCzPAQtr3VYiwLBt
	KDuqF67NBUsoqF+LFNTUKOJgFTvN7zvKMRG+QHfRLV7PNn7Qq1VUu++3aW78WKQVYSYj
	7Yx4r0uUcN8CaSjaCsB++FqVh0UzES2tNHKRoondzqqgCktia1N1l/HvDWWI66z/Dbwz
	9XlxAQbTt7w8P8avTgNCe2OvpkeWzRrmMt5hlrxLQ4t47pV/rRFFcAjaiK7OpHTkZHDS
	5RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=lgwAd4w+hEs4LKfhNREUhp3+dCUTkepYrB5sLZODAhU=;
	b=hLM+aw5kQYiPo+Q+ZV0RzCTn/KP9463T2SQzsj8pwBPS/0V6cPCq6RzlVTVGDrwyyH
	CCXDaUpmk+KGAzfoErfSQrrS22yp7sSINq5ICf3UR2WcAKE8o5bIMsQkrRj+yHq5r44r
	l3vdh3ANUh22A9um/FhIXen+0YQPR4FnNxBS0EIX7u9ydgx5bvNZlxIGPXMB9vAFcUXW
	vwGDfniOihCPsC4Au8+/3u68cGN1LI64Xa8wZaf662gUiohMZyRrnc4Tv47gRbqQ08jq
	bdJyaOosRkYT8HPLgUIj9160AIK7a2uN2pTJ5mRnRq236UNm8OCtwaOUa+8KKTW0jOTM
	2mhQ==
X-Gm-Message-State: AEkoouvqPqB7wdIoGDPjiA4d59PHzpvR1gVH8Bs/j/glatDuR/wFk6B2t1i2C5bqixTUdw==
X-Received: by 10.66.155.129 with SMTP id vw1mr6077184pab.148.1471541970857;
	Thu, 18 Aug 2016 10:39:30 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id yv9sm5301106pab.0.2016.08.18.10.39.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:39:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471503911-28428-1-git-send-email-mingli.yu@windriver.com>
Date: Thu, 18 Aug 2016 10:39:29 -0700
Message-Id: <60C70196-395A-4759-AE46-070F352C26D1@gmail.com>
References: <1471503911-28428-1-git-send-email-mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH] lftp: 4.6.3a -> 4.7.3
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
X-List-Received-Date: Thu, 18 Aug 2016 17:39:35 -0000
X-Groupsio-MsgNum: 62725
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1875E635-F458-4EE0-9849-5FAA06EAABEB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1875E635-F458-4EE0-9849-5FAA06EAABEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 12:05 AM, mingli.yu@windriver.com wrote:
>=20
> From: Mingli Yu <Mingli.Yu@windriver.com>
>=20
> * Upgrade lftp from 4.6.3a to 4.7.3
> * Add readline and expat to PACKAGECONFIG and update
>  zlib to add detailed prefix as better configure checks
>  is included in 4.7.3 as below commit from lftp repo
>  https://github.com/lavv17/lftp.git
>=20
>  commit c2ef3838421ca954c378d109c0328fdeea3fc89e
>  Author: Alexander V. Lukyanov <lavv17f@gmail.com>
>  Date:   Mon Dec 14 11:34:38 2015 +0300
>=20
>     use better configure checks for expat, zlib, readline
>=20
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
> .../lftp/{lftp_4.6.3a.bb =3D> lftp_4.7.3.bb}                    | 11 =
++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
> rename meta-networking/recipes-connectivity/lftp/{lftp_4.6.3a.bb =3D> =
lftp_4.7.3.bb} (60%)
>=20
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb =
b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> similarity index 60%
> rename from meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
> rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> index b25db8b..e4a8e49 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> @@ -5,23 +5,24 @@ HOMEPAGE =3D "http://lftp.yar.ru/"
> SECTION =3D "console/network"
> LICENSE =3D "GPLv3"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> -DEPENDS =3D "readline"
>=20
> SRC_URI =3D "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
>            file://fix-gcc-6-conflicts-signbit.patch \
>           "
> -SRC_URI[md5sum] =3D "2777dd514d21fe1da764bedd1d0ab36c"
> -SRC_URI[sha256sum] =3D =
"a8b53e5ca2c1acbecd181c87f21a8673ca9038dc9f2be6ab8c23790bd91fd446"
> +SRC_URI[md5sum] =3D "8eb1fe5f113126b60f172643c7f6c2e6"
> +SRC_URI[sha256sum] =3D =
"ce6519831603c19c2cf2e3c10b41d6ddc87a16049b99383e7b9b77fbc7707214"
>=20
> inherit autotools gettext pkgconfig
>=20
> EXTRA_OECONF +=3D "--with-modules"
>=20
> -PACKAGECONFIG ??=3D "libidn openssl zlib gnutls"
> +PACKAGECONFIG ??=3D "libidn openssl zlib gnutls readline expat"
> PACKAGECONFIG[libidn] =3D "--with-libidn, --without-libidn, libidn"
> PACKAGECONFIG[openssl] =3D "--with-openssl, --without-openssl, =
openssl"
> -PACKAGECONFIG[zlib] =3D "--with-zlib, --without-zlib, zlib"
> +PACKAGECONFIG[zlib] =3D "--with-zlib=3D${STAGING_INCDIR}/.., =
--without-zlib, zlib=E2=80=9D

is this prefix really needed ? if yes then please use =
${STAGING_EXECPREFIXDIR}

> PACKAGECONFIG[gnutls] =3D "--with-gnutls, --without-gnutls, gnutls"
> +PACKAGECONFIG[readline] =3D "--with-readline =
--with-readline-inc=3D${STAGING_INCDIR} --with-readline-lib=3D-lreadline, =
, readline"
> +PACKAGECONFIG[expat] =3D "--with-expat=3D${STAGING_INCDIR}/.. =
--with-expat-inc=3D${STAGING_INCDIR} --with-expat-lib=3D-lexpat, , =
expat"
>=20
> FILES_${PN}-dbg +=3D "${libdir}/lftp/${PV}/.debug"
> RDEPENDS_${PN} =3D "perl bash readline"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_1875E635-F458-4EE0-9849-5FAA06EAABEB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle18tEACgkQuwUzVZGdMxTMNACfaCWOawUXLXGfmsw5g6QvnCmk
UKMAoJFNNJt0c5/U3LFpgTUMcbr20MTT
=NH7w
-----END PGP SIGNATURE-----

--Apple-Mail=_1875E635-F458-4EE0-9849-5FAA06EAABEB--
