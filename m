Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B33277097
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 11:01:35 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so63002176wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fwRJ99oFGLijuhbrnCHHO1u/b17rvYBs5HwPunv1B5k=;
	b=Eg3zijSqf3xu71dJfejwx/wld5LPKgmPNbYMgU1JCREt183mobHtxmUnCGmRjTEZ6d
	uzqNFEr6k+F0A6bYPjIUxm6xc3b63xAl4p+rDJS3w9KTJNuC55DQsPdC4CCJnHXXuFR/
	nhRfi/m6Dc7hybDxb/rsk3I/t9F5H5okvRHGDqBEuWw1jAHVWH3/2IsoqPt2ScmuNflY
	FZGUapXwmhil3tNSPY+njdc4nQcADG3gZkHWM4vn0zNbGVCo7kz1OgmGS4N6X59QwTGS
	cY2WsXaWu0CK+XotuzvW3KLMuoy/w5XvxT5et20crKuQNGeJ5VN+4e8s+iGDjY7zzclg
	cEbA==
X-Received: by 10.194.77.77 with SMTP id q13mr23960743wjw.79.1443870094778;
	Sat, 03 Oct 2015 04:01:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nf15sm3598530wic.22.2015.10.03.04.01.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 04:01:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 Oct 2015 13:02:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151003110244.GB2381@jama>
References: <1443686111-17209-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1443686111-17209-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [meta-gnome][dizzy][PATCH] gnome-panel*: Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Sat, 03 Oct 2015 11:01:39 -0000
X-Groupsio-MsgNum: 57657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline

--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 09:55:10AM +0200, Ulf Samuelsson wrote:
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb | 2 +-
>  meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b=
/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
> index 972a4d4..fbcf76f 100644
> --- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "GNOME panel"
> -LICENSE =3D "GPLv2 & LGPLv2 & GFDLv1.1"
> +LICENSE =3D "GPLv2 & LGPLv2 & GFDL-1.1"
> =20
>  BPN =3D "gnome-panel"
>  PR =3D "r1"

First part applied manually in master.

> diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b=
/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> index 4957a99..30c42c9 100644
> --- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "GNOME panel"
> -LICENSE =3D "GPLv2 & LGPLv2 & GFDLv1.1"
> +LICENSE =3D "GPLv2 & LGPLv2 & GFDL-1.1"

This part was already resolved in master in:
commit c8d0ebf7f00b6e53fdda973723eaeded3874f8d5
Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Jun 8 09:08:25 2015 -0700

    gnome-panel: Fix build with gcc-5

> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://COPYING-DOCS;md5=3Dc9211dab3ae61e580f48432020=
784324 \
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

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYPtdMACgkQN1Ujt2V2gBwtxQCfZQHoI9HPWdF4nLh46oGPXpoZ
QOIAn07HvilhDbD7thsI+YC1CUSa1xF+
=ExlC
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
