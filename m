Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4961C7713B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 15:12:34 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p63so75870576wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 07:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vtNN7WVgd4UUt7cOswcX+OqVIEg4meQit6ZMVOx7ZlM=;
	b=I5zJDxncVe5SGiWiSVWye1/wIUpVIlMgWPDmhJajd4jn2PlCnmSawQpshh7pQTOc7N
	AJjq2/YjOn1QTx79T51K1Tuk4DaaUi8qthuRWnkl1keU9CzOVxzioqe4R5CxRxCELT9z
	IUV4pWwzuhwk7vMduD19xtFMVKrDadT10vZkboz4aN6JgChWMmD9VJFCJP7g3y8FXpoX
	PkjJQiJACqS8Sb/5p0NNFg0PT5cus5tuZfgu04MZpH1JrJsOoBAVI8vVZow17mP7vvRo
	B//d+NVrV3b4z1Vfjx8uv5JCdlHcVXVZhkiYJvS0DRQrbjwdz2HD3c7ZplIcyGtmGu8N
	Ahww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=vtNN7WVgd4UUt7cOswcX+OqVIEg4meQit6ZMVOx7ZlM=;
	b=DsjVsCDuZSPA9qooGftRElk9LrTUhyW9aNAGAiXQTmjuzu4sojHWjqvnu0H/pVYN7k
	DcoaGovK0v8qkg3bDh/87eo8ebnl+fxhI7eY5+8EEUyXuDFggo4kHq3v0/n0RW/YK2xX
	n3r/ogzNKfm8Q4OUuK4OFKNXigBttPhVoyEE9/I0iAcTmOplJ8YMhdToJOD7+3Ozi2J5
	qwSoxCWt+Y8ZGY0WyLQ/+27u/4mAxieQk2+1CUYUqsOMJHZRH3bCwJtLXMQ/CM0HFyfC
	DKx+ClMEnzX9Qu84/PP8LfBIJmwV0yjJdGOS31iMJqV1MFq1++4hqOwDx0xGxy2Km222
	B+3Q==
X-Gm-Message-State: AG10YOQPOMlAbhDlsMRPt40yDY1mRQr2L2pBR6bFvhR4UZ+YIV4B0vg9YZY1hYW2rQrfrQ==
X-Received: by 10.28.187.67 with SMTP id l64mr11701841wmf.39.1454339554187;
	Mon, 01 Feb 2016 07:12:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm29534557wjb.26.2016.02.01.07.12.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 07:12:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 16:15:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201151519.GD2639@jama>
References: <1453116651-11714-1-git-send-email-bob.ham@collabora.com>
MIME-Version: 1.0
In-Reply-To: <1453116651-11714-1-git-send-email-bob.ham@collabora.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH] python-dateutil: mark as having broken "make clean"
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
X-List-Received-Date: Mon, 01 Feb 2016 15:12:36 -0000
X-Groupsio-MsgNum: 59790
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 11:30:51AM +0000, Bob Ham wrote:
> Set CLEANBROKEN as the Makefile has no "clean" target.
>=20
> Signed-off-by: Bob Ham <bob.ham@collabora.com>

Please check if it's still needed for python-dateutil_2.4.2.bb currently
in master.

> ---
>  meta-python/recipes-devtools/python/python-dateutil_1.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb b=
/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> index 37f19a8..61d992d 100644
> --- a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> +++ b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> @@ -8,6 +8,8 @@ SRCNAME =3D "${BPN}"
>  SRC_URI =3D "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.=
tar.gz"
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> +CLEANBROKEN =3D "1"
> +
>  inherit setuptools
> =20
>  PACKAGES =3D+ "${PN}-zoneinfo"
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

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavdocACgkQN1Ujt2V2gBy3JACeI+Othvum+RKKhk0SVtJRPEnp
0GUAn3VwsdpFCf19yMlNJBBsyvUTyvI8
=zOTB
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
