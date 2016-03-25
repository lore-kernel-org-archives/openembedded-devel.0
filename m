Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 78F1260290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:30:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so21112546wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8so6QhvscEX0lSMdgDuzYn4x37GiHJGQdeM50OnSdqA=;
	b=wsN4CPfsYi6kCp8/f1g6GebJuqJuH2lJEjeDoFuPzrg65IQdUILwY0Sea+IW77eL9w
	i85ZZi80/7Y5ARMVs23u1ZxI+wLSn7tHhJIwpZgk8bSrqtFB4APUYywm6wnAg1qDVpi3
	3E7zOaWsi6wcVtBodbyALiDLmL/Z66I1d/E2XovfBKwTnZw51KCWBXC9DRspuD3Wy9Fk
	TrD8J3837+Yu1Q6lo7umFHFYGsRTnTHHE/tK4oMxaJkKG8CMK1TimziH9EZaThsd9wb8
	JMVSsyo6T9TFqh4jUWGNQihrJeqSI++FAkVxN8/wlOdqm6nrhvYchPF2vCRGMSXsb+5r
	VQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8so6QhvscEX0lSMdgDuzYn4x37GiHJGQdeM50OnSdqA=;
	b=j4oCMJFvC0ZgwzB6xRk3XQ13TZer3T152g5RYZBq3zrKVyDftS1CoiISxvR238HFUQ
	bJWq5V3aIfQeQowYEZmq906WZ9DxuCmFkI9sELSL1I0h4RYpw5XiQT9VFvBwixu2IOD4
	80qrFppcuDf+zJsqq05Ok5xHMQY3YJ0D/7rbK6/S8KzRFtyEn+StCvsZm5DIyq09k8ao
	h71dmWgTL/H73HHmmcbi/msGpKj9r0EFQUPXdYzuqkxH7sgZasH4RrX9CKu+rMLUxbzS
	1/LyUz8fF1on/O1cmjS6FgnDPiWzgNIDos/KtlpBbIo9+JEkgiMM7OQDeG0LQ05iL6a3
	2ImA==
X-Gm-Message-State: AD7BkJLmH6UThzn7Np40wVYqPgeFfI79FZE7LLnXWtT9blDWDXZ2F9uJ1z660lPByV699w==
X-Received: by 10.28.109.4 with SMTP id i4mr35885150wmc.44.1458901832224;
	Fri, 25 Mar 2016 03:30:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ll9sm11339156wjc.29.2016.03.25.03.30.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 03:30:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Mar 2016 11:35:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160325103517.GA2555@jama>
References: <1458557959-10500-1-git-send-email-jose.bollo@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1458557959-10500-1-git-send-email-jose.bollo@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] libmicrohttp: update to version 0.9.48
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
X-List-Received-Date: Fri, 25 Mar 2016 10:30:32 -0000
X-Groupsio-MsgNum: 60666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 11:59:19AM +0100, jose.bollo@iot.bzh wrote:
> From: Jos=E9 Bollo <jose.bollo@iot.bzh>

Unfortunately I've noticed this only after merging it:

ERROR: libmicrohttpd-0.9.48-r0 do_configure: QA Issue: libmicrohttpd:
configure was passed unrecognised options: --disable-spdy
[unknown-configure-option]

Please fix soon with follow-up patch or I'll revert this.

>=20
> Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
> Signed-off-by: Jos=E9 Bollo <jose.bollo@iot.bzh>
> ---
>  .../{libmicrohttpd_0.9.34.bb =3D> libmicrohttpd_0.9.48.bb}              =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb =
=3D> libmicrohttpd_0.9.48.bb} (86%)
>=20
> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.b=
b b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
> similarity index 86%
> rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
> index e3c833b..6e7ad26 100644
> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
> @@ -6,8 +6,8 @@ SECTION =3D "net"
>  DEPENDS =3D "libgcrypt gnutls file"
> =20
>  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
> -SRC_URI[sha256sum] =3D "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be=
421a040be1b25a88"
> +SRC_URI[md5sum] =3D "9c298c890088a91fe0d7ac3fec9d0097"
> +SRC_URI[sha256sum] =3D "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143a=
f0320c47cdf8a2a4"
> =20
>  inherit autotools lib_package
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb1FGQACgkQN1Ujt2V2gBxzPwCfZvPhirEn7314AjQW1AGTVW9x
PhQAoKX747JSU8YlqLMdmPqMl7rHL4fU
=RaxA
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
