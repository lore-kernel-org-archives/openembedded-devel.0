Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1212E77059
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Apr 2016 15:45:58 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id p188so108805106lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2016 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZGsmmX4GRlHW1uFI1bdWHBk/Q3lRCzWlIB1hV99++ws=;
	b=aDrhYRp6pnIalnbbJ7WLsPRQXFmpdCCnggf2EdmXivLcex5E/kiy8n7dPymq30nbJH
	/1Kb9xyxXDCSO8S+c/dLsFlxfgMmSFf5oJadyPrgx6+UyTtEseJnchUhwJYwWxPzwJsF
	ev1cN15yuhx7mHjJHBv8Ak6usQqUVqkZxJyppuijvjxb4p6R1gLAy+aq6iwQHZEZjJJb
	KBRa9kk7Ll0dikpRLG+Rxaj0BWInDHXWC23gFBmFRWYsUdaFBQ3VxXfuqOkTSwRnIpUp
	V7r8wPUU9O0kqxrNQudR4vuRiw7xVEPvyf97a5cu9HiACHn+F0jkz1wHr63FPPTFxCeC
	grfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZGsmmX4GRlHW1uFI1bdWHBk/Q3lRCzWlIB1hV99++ws=;
	b=X6paZxcaJpW42Dqk2xQ+rCa3ICAAArDLVLZN11jZuw8uns9J+xfxFMbHU6qQWa89JW
	Scx3G9iNQAZAvw3aFggh64Xhjj11ysuPWzO5qU1OQuN8nlJXRuopw4bDrwdVr7pHto0r
	ahNH/CrxufWrkCwsHw0JTKg4O98YTaymfD8rJFzQJZqOr/en3xUCzOwKiK1wab1/IHvy
	jiM93TdULVufpkMLJeyQ675MiaYZ8jESRk/NXfG3j483yb8eVoXpTHLXjdfrjBGjkwQX
	IsgSUmixZMZASUCG64tfP08jQWV+Wjx1P/NFRsih9TQxrUwN1ozLeGOzYJ/ChqpD5jqb
	XTsA==
X-Gm-Message-State: AD7BkJKQzLltpTokS53buUvOPZLGMdzoc1GRJbezVzh/K1pvzc8pnKUIaN5WTStPfe8+ww==
X-Received: by 10.194.21.197 with SMTP id x5mr3454200wje.90.1459698358856;
	Sun, 03 Apr 2016 08:45:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q139sm9292649wmd.2.2016.04.03.08.45.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Apr 2016 08:45:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 3 Apr 2016 17:46:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160403154621.GB27687@jama>
References: <cover.1458997082.git.derek@asterius.io>
	<ec2445068d281e09e7aa912ba2ff3c4edf18c6a1.1458997082.git.derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <ec2445068d281e09e7aa912ba2ff3c4edf18c6a1.1458997082.git.derek@asterius.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH 24/30] python-pyparsing: update to 2.1.1
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
X-List-Received-Date: Sun, 03 Apr 2016 15:45:59 -0000
X-Groupsio-MsgNum: 60808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 26, 2016 at 09:04:44AM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/{python-pyparsing_2.0.3.bb =3D> python-pyparsing_2.1.1.bb}   =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyparsing_2.0.3.bb =
=3D> python-pyparsing_2.1.1.bb} (60%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.b=
b b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
> rename to meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
> index 18a3077..9862907 100644
> --- a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE =3D "http://pyparsing.wikispaces.com/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfb46329938e6bc829b256e37d5c1e=
31a"
> =20
> -SRC_URI[md5sum] =3D "0a5ec41bb650aed802751a311b5d820d"
> -SRC_URI[sha256sum] =3D "43d7710fdaa194a3bccf3127d06dec8e2de99a7efe6c47f0=
1d4b748a1d04b192"
> +SRC_URI[md5sum] =3D "2a1d3a63ddc2ec9a3da961d1b7f258b2"
> +SRC_URI[sha256sum] =3D "4bd04badfda39b1e2fd0d77cb78b488c881d88c31734791a=
0ae902979ae10575"
> =20
>  PYPI_PACKAGE_EXT =3D "zip"
>  inherit pypi distutils

Fails here:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160402_13=
2854.log/3_min/failed/python-pyparsing.log

http://errors.yoctoproject.org:80/Errors/Build/14632/

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

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcBOswACgkQN1Ujt2V2gBxD6wCbBXaBPX57NG62BML/ysJkiXFk
A8YAn27QBNzafBiNdtGcKVlmwd9hnYKM
=/FQt
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
