Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB790771B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2016 11:12:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k184so9187821wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2016 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s6hP8OXWT1g0tSlknaT7pmgxzpCTvxS+2NwQXM8+Vys=;
	b=j8oiEkNIL23rXeY59gh6L+Xh1mo7SVVmerVx/GTni+Zkfwfhqxo+hJ0c7hazA5msVP
	87dy2uqSxNs1wAbVEjRrP4n+JK3Yr6p16ygtc0dDEhP3bnyaGAGFw3LKi/8czEw89cVe
	nPGiw3yz/4TtzXGhD3UN71cC8/OiNsVUbkGstov2TWj0TnOAsipyGflWSuJHWnSkf7RH
	dz0SMw48109ZxLFN4SxVUNXDZPOvMMm3fjQYAk92/gnLdpaYIaYjzXdhDVocDFBouJcO
	JLQGNlY9mpa/Iybjp58LM+CUbMSm47WUxSX/1glhsMIWwDFYYH0WS3vnU9/dXAEGY8Eb
	siFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s6hP8OXWT1g0tSlknaT7pmgxzpCTvxS+2NwQXM8+Vys=;
	b=mxtyo4xRtmVLm+yJf50xu9yxB2Xmr8c90yricltC4JkCaROrKQgPxsYRPR1tYffAo8
	Cllav5vYJ7r/6m083mS5Fwy40UkSJz7dhd01HwrSgSuG49DTB0pFZ5PfOBaB+ARWuSmS
	SQiL2IVQFLnKNZ80t5mEL8GnM6JJcbRtDkY4h9nZDyX5u+3ueF2EAlUXiay5uOFIWlTc
	1/AkqdGOgqReohIIL1kXNF3BC7Fyi11Gf2Nq1NQ0f/5sU1uRrGPZ9AUGUIhEVDJQYcX7
	aL1QJzQa7AdvcCJRzU57dabRfczIt6mcT5F92vqdWm1H+UNL9l9Sjk4O0vUMjOv52Luv
	It1Q==
X-Gm-Message-State: ALyK8tL4zPulFdAykaS74usxxGApEMGlM1ecKtekGOktO33eK6OKJ7H51jvpN5puV5bO8Q==
X-Received: by 10.194.81.8 with SMTP id v8mr10966070wjx.155.1465211543640;
	Mon, 06 Jun 2016 04:12:23 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y3sm19726563wji.40.2016.06.06.04.12.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Jun 2016 04:12:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Jun 2016 13:12:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160606111228.GB2583@jama>
References: <1465057388-4043-1-git-send-email-gyurco@freemail.hu>
MIME-Version: 1.0
In-Reply-To: <1465057388-4043-1-git-send-email-gyurco@freemail.hu>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-multimedia][PATCH] MPD: update to 0.19.15
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
X-List-Received-Date: Mon, 06 Jun 2016 11:12:23 -0000
X-Groupsio-MsgNum: 61720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 04, 2016 at 06:23:08PM +0200, Gyorgy Szombathelyi wrote:
> This fixes a build issue

You forgot to include your
Signed-off-by

> ---
>  .../recipes-multimedia/musicpd/{mpd_0.19.10.bb =3D> mpd_0.19.15.bb}     =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.10.bb =3D> m=
pd_0.19.15.bb} (94%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
> similarity index 94%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
> index 7b124ca..caba589 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
> @@ -9,8 +9,8 @@ SRC_URI =3D " \
>      http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
>      file://mpd.conf.in \
>  "
> -SRC_URI[md5sum] =3D "da4bc3e47afd0faf9e7a67168e012102"
> -SRC_URI[sha256sum] =3D "c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800=
040ebf1791b15851"
> +SRC_URI[md5sum] =3D "bb855b1689c9e863c2dd214ab1cb9344"
> +SRC_URI[sha256sum] =3D "0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1=
e9e7e091cbc29b8b"
> =20
>  inherit autotools useradd systemd
> =20
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldVWpsACgkQN1Ujt2V2gBxq3ACguoJ1marHS+FRrAiHpABAAehs
N2cAn2kXWNbjf1NMkGZZsoC2X+tmAwVr
=wDcx
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
