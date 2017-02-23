Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 799A172FEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:52:57 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z61so3441782wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 02:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EHs++irT3bPR5hUCebY/PmnA0bP4BEgaHmyKroQqNSw=;
	b=fgjVFtPZzuBLTn8bV0sXIbR3gxI0J5LIKTE6xo4wsYKYUI1Z1NUOvz/h6diGRSbmYY
	uGFjATw+v9zhE2F/PTnSYzJSQxBGwqrf4E4yLiMusQiZnsisFXcL/Vw1JDgRrCd5KEWo
	fsW1TB3aB0+uxBR+IBw7a+t8e6tDimZJKWJa+Pogx15twQszP2CdiMVbedxvaN+cU9S0
	XX1BvKWPVcy6pZFCMte8gUnRk3ae5os+kvDGnIew/nxuOTFsT1K29o1/TMc8yZpKEzgL
	HuqtQWIppuhNEcNZJocZgMc3ddBQPWRlaq2/Lr0ih/MRcUH4AmBbt2cbXnHAKnn1Eq0h
	IiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EHs++irT3bPR5hUCebY/PmnA0bP4BEgaHmyKroQqNSw=;
	b=P07zlvesSMa1M8eoRa8CCdAEMB28G1yIo847QUIKn3tvllEipDtvpu/XnksBRacYX2
	U7YeoAruHmujE/8kxAOumzaQW48w6bYNSg7IhbqwhrJ7JsvbskHfkieBlvVmF/USjro8
	7Ig8B3rgNbbyCgoaWF9nDGoJl9tJ2e8h0XowY8j7jMTikv0HZgktkG5ICuk9B7keH/pu
	lIliXwMzVaa94iEqEv7RXV6Paj7L19ZJ5sJReEKsvUFtcxGq0N407kmtQ2/TfpVtHlcL
	GxsLceD2vcqBTdVrYa3k7Rv/xdm4Avw37FZ4bQezbrBg/T16DCZ12xHrCdmMS9vxwzEg
	HRug==
X-Gm-Message-State: AMke39md5rd671XYMC9+zCRh9H4HXFN4tWF8GP86nJggOAfNjiXLqxKGy+7NwswSx5yghA==
X-Received: by 10.223.162.211 with SMTP id t19mr29030297wra.57.1487847179068; 
	Thu, 23 Feb 2017 02:52:59 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i29sm5499640wrc.64.2017.02.23.02.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 02:52:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 11:52:59 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20170223105259.GA3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20170222230250.30288-6-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
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
X-List-Received-Date: Thu, 23 Feb 2017 10:52:58 -0000
X-Groupsio-MsgNum: 65517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Thanks for another round of fixes!

All looks good except this one, see:
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170223_005=
128.log

> ---
>  meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gno=
me/recipes-gnome/abiword/abiword_3.0.1.bb
> index d021147..b08b994 100644
> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
> @@ -125,5 +125,3 @@ python populate_packages_prepend () {
>  }
> =20
>  FILES_${PN}-plugin-openxml +=3D "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
> -
> -PNBLACKLIST[abiword] ?=3D "Depends on blacklisted gtkmathview"
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK6/CgAKCRA3VSO3ZXaA
HG1CAJ9FYw39O4aIg8jDWFQUAW8goWC8HgCgi2lHm3+VgZjN4HRJFQaF3d3XGng=
=yMOn
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
