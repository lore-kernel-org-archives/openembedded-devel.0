Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BDA7565D67
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:15:13 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3027824eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cVzfS+5RPXQCYeeMoVJl3P6ELREw7kCiOhPWjRwJHl8=;
	b=V0oCKGSOdyFSXtVNW9psvqS2Y7cy9dOzPi0Lhen+ew4Gq2srFCjBcJuzkMQEGOdl9J
	y6pXHtea68EsLnwh1FtGuUGUQEiZs3O6YarqjCnhvDRP+Czm8Rv8ntS45Tg/HSAK7h7l
	MJxENLFgbyrmQ1BD4l5J3InU6YmPTNRh4MxSaawwni4IezjbhpCLiq+1cjuJ78zPvHiS
	H5tdafBYHchfWsE60y6eKQRU+5puTpQPtYWguZA7+Lxichv7+DGtUTmYr5KZfhBNgDwx
	+gqnlE7VqieK1n3wZlaWHbSqmZJQ3Ao8W5dPS8cBT3HjCbYT2XaZPevAxx6o56bXAioS
	FTiQ==
X-Received: by 10.14.246.1 with SMTP id p1mr38821832eer.20.1398003314112;
	Sun, 20 Apr 2014 07:15:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w12sm94954580eez.36.2014.04.20.07.15.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:15:13 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:15:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20140420141518.GR2486@jama>
References: <1396873921-25816-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396873921-25816-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] fwts: update to 14.03.01 release
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
X-List-Received-Date: Sun, 20 Apr 2014 14:15:14 -0000
X-Groupsio-MsgNum: 49355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/OxAoNYcURhUkoHv"
Content-Disposition: inline

--/OxAoNYcURhUkoHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 03:32:01PM +0300, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Merged, thanks!

> ---
>  meta-oe/recipes-extended/fwts/fwts_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/fwts/fwts_git.bb b/meta-oe/recipes-=
extended/fwts/fwts_git.bb
> index 086e6d9..6f6df0b 100644
> --- a/meta-oe/recipes-extended/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-extended/fwts/fwts_git.bb
> @@ -5,9 +5,9 @@ HOMEPAGE =3D "https://wiki.ubuntu.com/Kernel/Reference/fw=
ts"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://src/main.c;beginline=3D1;endline=3D16;md5=
=3Ddeb8af5388e838d133eaa036f4d1496f"
> =20
> -PV =3D "14.02.00"
> +PV =3D "14.03.01"
> =20
> -SRCREV =3D "628534d216f135939f2f7b6b0a6c076c8d73bff9"
> +SRCREV =3D "8ec44dc1e55ecf334f4afa8eed8795ed5776c396"
>  SRC_URI =3D "git://kernel.ubuntu.com/hwe/fwts.git"
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/OxAoNYcURhUkoHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT1nYACgkQN1Ujt2V2gBzdMACgngMRrxPcghRmML1a6RrJmqcg
rb4An3dmRSjdDfTXLZVMJh6uZqTFJetU
=GXnb
-----END PGP SIGNATURE-----

--/OxAoNYcURhUkoHv--
