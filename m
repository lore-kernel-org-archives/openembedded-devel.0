Return-Path: <trini@konsulko.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B83DD7D290
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 16:00:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so25080560wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TkK7DRcNczsHqqY6PvxOL+rFj9EneplnqU4VyCAuMQc=;
	b=tLgmBHOdJBgyksdihjNFiz2gBmDqkMJTA/gp2gUj7/WuVamVeGm0XB4GLXVAbY9JY3
	dPY8Afa3cc271k8FZ51zzTSCv5icPkImiA45KrRnYMFqTYoXeeBZKuMAXWhLDfINp2X9
	T7vHHkAJoVCoGTm9C6Rbs1XS3LqO2WctX1bWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TkK7DRcNczsHqqY6PvxOL+rFj9EneplnqU4VyCAuMQc=;
	b=XkMHZqjYgByCETnpaJfG3aqcij0+dIDb9rEGkNyySVR8p2CXVyLLkZEbSz/BveZLaq
	f6KCKKm51B9YK52ckTQbyYOMOIimxDi0mncdB/NZyMMRLqM+t2R1vwKUVgg147xguo9K
	KUhBP52CIERRs9/fIZj+mRdmsVNoa6TFsXRAd8U6PZFt++3BVSknR+tjltbluQ7QwMPn
	FUUnA7GNf2mkeZnzSoiJKE88bbt7yWTHE+WJ5ncFtcIeSyTsYwhQBKrHJLdp4scEcZs4
	0xvUiVqrKP4asIazayeNFy8tCDDgReKn9s64bjuicy8dMXKqH/9RqReWSTSR3hx0SaEK
	I7Wg==
X-Gm-Message-State: APjAAAW7bRZ29mrDLqaFvlUQORN8kR9uWd/XHljuXFhQiNZ50i6QQO02
	1v2we0cinicvUoOve3knbZuvEg==
X-Google-Smtp-Source: APXvYqyIS6ZxSfZRZyRvIW6dWBh1wEprPke+4MPpxVesmgQGg97IuoFHI9mC/ZvEZokvEiIcbEfFXg==
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr14068285wrn.116.1556726449242; 
	Wed, 01 May 2019 09:00:49 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	r8sm18244191wrg.22.2019.05.01.09.00.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 09:00:47 -0700 (PDT)
Date: Wed, 1 May 2019 12:00:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190501160044.GA31207@bill-the-cat>
References: <1556725263-19751-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1556725263-19751-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][v2][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 16:00:49 -0000
X-Groupsio-MsgNum: 77375
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mBl1uvLAvCH33w2r"
Content-Disposition: inline

--mBl1uvLAvCH33w2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 08:41:03AM -0700, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>=20
> [v2]
> bump bitbake to warrior version
> ---
>  README                      |  2 +-
>  meta-filesystems/README     | 12 ++++++------
>  meta-gnome/README           | 10 +++++-----
>  meta-initramfs/README       |  8 ++++----
>  meta-multimedia/README      | 10 +++++-----
>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>  meta-networking/README      |  6 +++---
>  meta-oe/README              |  8 ++++----
>  meta-perl/README            | 10 ++++------
>  meta-python/README          | 12 +++++-------
>  meta-webserver/README       |  8 ++++----
>  meta-xfce/README            | 10 +++++-----
>  12 files changed, 49 insertions(+), 79 deletions(-)
>=20
> diff --git a/README b/README
> index 7318f09..881115e 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
> =20
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> =20
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index 87cb685..842da13 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -10,30 +10,30 @@ Dependencies
>  This layer depends on:
> =20
>    URI: git://git.openembedded.org/bitbake
> -  branch: master
> +  branch: 1.42

To be clear, where is 1.42 coming from?
$ git checkout warrior
Switched to branch 'warrior'
Your branch is up-to-date with 'origin/warrior'.
$ git grep BB_MIN_VER
meta/classes/sanity.bbclass:    minversion =3D d.getVar('BB_MIN_VERSION')
meta/conf/sanity.conf:BB_MIN_VERSION =3D "1.39.1"

To be clear, I'm _not_ a fan of saying we need to go that old
(especially since there's no CI done with that version) but I am saying
we should be consistent with the code.

--=20
Tom

--mBl1uvLAvCH33w2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcycKsAAoJEIf59jXTHXZSKrwP/35/rVNqYlpum9wlkNosvO0f
HdzSJCUE8jGn1FKPRjMeLBgZJ0rIKG0rPV5yAdCXvOV4rxgHxbmXoT4WbzX/ZJcv
IQIYriKhRAboLI/hLPN5Dy4kHjek/ajt+vL0Rv4RiA+xwo7mJvcrjWCJliYDEiA4
8diga2qSI2ZoV/rCGNPbdw79atx76YYcGHwmQpbi/uCPMciE3Vgmqvj4kS0mQOb5
Lv4ex63jAVEjznBuMAz3Qv2aECUkcgVQgmOz/Xy4HJFINjDjQ74O18dbg/uOTzml
u3yEOvI6GvfS7vQuJyIaYkASt7f6tDidrBMV+9VXO07agInMezRLXUVgrb/8KPEo
coUzbkwxtk3JqtyTf9eE5aemCIlrAqI7bmUSk4Ba6nRuCxAf2ds6sCTbDGhXs7Ie
EkceW96T4BP0taYjJjGygrejsRxN2F8f7x+j2z3jqAaNjv4aIeTGkQzL1BwubucQ
51cqimABHnMpHCFMtCNVRbHgp5lZIy+1mHs/6Km6bsFZU2F2Bkug1Tec/wXp4ejr
beREHb69AcE+TdkJbi9+bKMoSaAJ7aLX5BuGUoLfinEqjAfbVo0CQwzQQviwJhaU
n7b0yrg1eVkACaUBioT/wD7wqsmn9vHWgwnAiiPFwuWXFpMOwEHK/M3J7BblUa9o
oyOpBB5+vTRGBlNet0Bv
=arex
-----END PGP SIGNATURE-----

--mBl1uvLAvCH33w2r--
