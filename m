Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B325660107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:49:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d196so4362953wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wOrT4tyVONf1EQFKI2Ywfl4apjzOAX/fuAZ9c1mwdSk=;
	b=j5vTVw+VE4rh0IkKuJcxzbeJ0rN13tG4v53XHD4725jb8mafa2n3sURj6WxS89md48
	kh93knTBPIhlGMDv1tMwGZ0eQUo+QXvWXp6hw3uGAKaj5tggsIRuC7VRgV/r/iglkwop
	8kTZPyf/+RbfZynCY2nmgL1dfVUavJ89u4o437Buih5R/GhtLkJUC//VrBupkhoDCcrs
	zmAzeKKhpZJJJ6yd1dcFz3U1qxS9MWBGrqeAH0HRyJhZQ7hpwdvyxUznu2EuaS+9jxB+
	MmG6qtO+kY+iQ4Mua04kjo3pK46B3Y6Qpo5ZXPSyW8FEpA8JWDusw7BiCrCL7x7WeClV
	dK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wOrT4tyVONf1EQFKI2Ywfl4apjzOAX/fuAZ9c1mwdSk=;
	b=bIynVlvKJfkYmpPYq6/AUFy/OlvPQkDk/Txv5f/2KbUChrmVdel8L0SlPD5sIPNWw8
	uyqNC8VpBfFDGEscpEkOm6C/Dkd8rzUKCtuLKArUSS15dHQ/1n+Jo0ct7w55GDj41f21
	wKyC89sdbUXZFjS+pqkCXJCkP3yBwJavYM41u2eM6Fo7+bETdtRiNtNo960ShbI+vWsl
	mroa2ty7kiP/jl9LcG7dfFPplcHUIZ6jwUFs/HHAlmlHTwwcDqLEI1Nq41CDgSdf3w4E
	z38cB7QQSrqgH4P7MVU/41Orq3pks4QOrFaI8u0JqgoC4eWeDUQQZO9ctxtXe+Zoybo+
	n2OQ==
X-Gm-Message-State: AE9vXwNu8BeQwLyJjP49EiHvvXmRA/z2tMQ+tnOgiu9mhveRcWg7cfKMMscAveBWuv9hgw==
X-Received: by 10.28.0.70 with SMTP id 67mr11272193wma.88.1472662175693;
	Wed, 31 Aug 2016 09:49:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id p23sm9828364wme.8.2016.08.31.09.49.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 09:49:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 18:49:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831164935.iilgtaxdn4uqhta5@jama>
References: <1465103229-8927-1-git-send-email-daicy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1465103229-8927-1-git-send-email-daicy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH] postfix: 3.0.3 -> 3.0.5
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
X-List-Received-Date: Wed, 31 Aug 2016 16:49:35 -0000
X-Groupsio-MsgNum: 62908
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ltuiqicxgo5uog4s"
Content-Disposition: inline

--ltuiqicxgo5uog4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 05, 2016 at 01:07:09PM +0800, Dai Caiyun wrote:
> Upgrade postfix from 3.0.3 to 3.0.5.
>=20
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>

There is already 3.1.1 version in master-next.

> ---
>  meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb | 4 ----
>  meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.0.3=
=2Ebb
>  create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.0.5=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb b/m=
eta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
> deleted file mode 100644
> index 7104a9d..0000000
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require postfix.inc
> -
> -SRC_URI[md5sum] =3D "61caffae689c11d09b4c972a394ae3b1"
> -SRC_URI[sha256sum] =3D "401e46ec3450569dcce60d1d8ca22a19ab1f7f817b0cc730=
cdf4875ba608ac02"
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb b/m=
eta-networking/recipes-daemons/postfix/postfix_3.0.5.bb
> new file mode 100644
> index 0000000..5bb6b21
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb
> @@ -0,0 +1,5 @@
> +require postfix.inc
> +
> +SRC_URI[md5sum] =3D "28a5c7a10d3238dded23c880d1f22871"
> +SRC_URI[sha256sum] =3D "dbe20d011a6fe79d28b5f7e6e86681dafd30f7ed8ad663be=
c244fc4694c87d1c"
> +
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ltuiqicxgo5uog4s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHCp8ACgkQN1Ujt2V2gBxtGwCgjeItQtJYfKrqB2/Fs36rJrvX
vNEAoKdd4hx20PajKsE86rtaL8JVoLoa
=DYOl
-----END PGP SIGNATURE-----

--ltuiqicxgo5uog4s--
