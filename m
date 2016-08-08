Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3297277199
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:23:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so14813188wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+IoAbJV9v2JQqmzxrHtIyeZU6qCqlsseiWYQIJtOKQQ=;
	b=r59aDHRMsVmlvfnUk8f2vqkYoU/EWJRBaf8pdzBaTlepouZUNiB5ByhB/7Sj1OLPS2
	jy62UVlr31tcD+TF5BMmv42yrh5EjWNjvA4r1vfiH9gHLU+ncyxBH8vTTz1Bt9kOqhd9
	5EVM26gTMTHA961SoyfmaKvfK+a+vOhYCSht5G5D2BNCTWlYIPw0NFTnCkFM88pc9h8y
	R0HHPtvQGVLouMqYoFCK3rLbcFQedrfsKWUJWxauPeZgT7gKkJLlzUot1MvyveZmLtYG
	QsCstWwl7gD2Y1LJ3huhQVFTplHV/vhjNImcQdgEJt4gOGNJDEqHvWd7//yrMUrZX9pi
	GgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+IoAbJV9v2JQqmzxrHtIyeZU6qCqlsseiWYQIJtOKQQ=;
	b=GpTkcwvwR+Kd1E2qRzdNLGkYCnUXFShYLCyd/nHjUfU6btw9Zq9NCV686uOUr0g7Yv
	gsGBrYyGi2WK4fMgRnHWN/3NJ3A8UXJPNgoZRxSsgtaqx6hCy9fv7RD01kQlwUzokqZy
	bRF5zrzZOkKLdl5jNfF8K29rUeCuQQezY0nUGWusg3WV8Oa2Z6b28RTvLuGJsk6ugMIw
	R+pGZrslUk+ztfFdS5CBI2wz6vbVs7fdnyybjd5B/Hwd6LlZ07Vho0i+zFs24lbjIZXs
	qEBnuyXJEiFBGMHf9Pr//vMvrVbjiq1hAITAXsFA6baALnuK9o2jYch1L/X6Teoye17b
	/H7g==
X-Gm-Message-State: AEkoouujiWgh7ytueUZBdQZBGkpEy+20Jwy0uCkUoJsQxiKcjX7exSj2bmPKvs0oybp3Kg==
X-Received: by 10.28.51.210 with SMTP id z201mr15687789wmz.98.1470655412261;
	Mon, 08 Aug 2016 04:23:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id l1sm5148632wjk.45.2016.08.08.04.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Aug 2016 04:23:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Aug 2016 13:23:31 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160808112331.prpy25zdlair3onu@jama>
References: <cover.1470640304.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1470640304.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/4]add ttf-fonts packages
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
X-List-Received-Date: Mon, 08 Aug 2016 11:23:33 -0000
X-Groupsio-MsgNum: 62472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nr7bswrmtrvzlnty"
Content-Disposition: inline

--nr7bswrmtrvzlnty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 03:13:10AM -0400, Hongxu Jia wrote:
> The following changes since commit da81d9ef8d052c1884abd8dc0d5354f2e9a23c=
c4:
>=20
>   proftpd: return stderr to syslog (2016-08-05 09:34:51 -0400)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib hongxu/fonts
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dhongxu/fonts

NAK, missing changes in layer.conf.

Don't use TABS in meta-oe layers.

> Hongxu Jia (4):
>   ttf-abyssinica: add version 1.500 to support Amharic language
>   fontforge-native: support python module
>   ttf-lohit: add version 2 to support Indian languages
>   ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support sinhala
>     language
>=20
>  .../fontforge/fontforge_20150824.bb                |  2 +-
>  .../ttf-fonts/ttf-abyssinica_1.500.bb              | 17 +++++++++++++++
>  .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb | 24 ++++++++++++++++=
++++++
>  meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb  | 23 ++++++++++++++++=
+++++
>  4 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.5=
00.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.2=
0090803cvs.fc24.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
>=20
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nr7bswrmtrvzlnty
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleoa7IACgkQN1Ujt2V2gBymogCdELUnuo5cbqNmheyRgC57WqEj
E3UAn0Oa7Euvz+e+GHXh++aXb+IgIbTv
=hjGT
-----END PGP SIGNATURE-----

--nr7bswrmtrvzlnty--
