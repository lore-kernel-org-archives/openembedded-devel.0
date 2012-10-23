Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQkJs-0007Dh-2o
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 21:39:20 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so3077297wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rddHAw9WQl1ZXQvCzY8ag2oJ3T2XDBNhQtJPjypoY48=;
	b=UBx3TuKeh4y/AAUktIwzGgN1X2GfA3v/swlheVd+UZeKKQmy2UNPPLynO6VOBWQg+3
	kl/wWHMvVfBdrw1g8e7sx3Qe050tHJcLDC1JFycxoM8CPb0Z40Xguh9oHmXUc8bsYjVF
	DfsenDBuw8kYb+ytS1mJFQfgA/v5fI6mwmA35UV3i7QQoaPbDhKBfnzt0SMwWksRmcwt
	0wkX0PRx/CMWCy19OpcQnbJ6NWhPuDxIsMat/y5UlO38X2TO9jMtnmhNDV9LzXq4SHl1
	O99vjQ0fbm5dOtgNrC7AgXmqna/fxMnrzOnFR1/OjY2U0HTnvlMdIN6+tLZgMWwpjCHq
	dr/w==
Received: by 10.216.134.85 with SMTP id r63mr7419427wei.150.1351020353753;
	Tue, 23 Oct 2012 12:25:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm306964wiy.5.2012.10.23.12.25.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 12:25:52 -0700 (PDT)
Date: Tue, 23 Oct 2012 21:26:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023192608.GT3269@jama.jama.net>
References: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
	<1351020123-22871-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1351020123-22871-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 2/2] rage: Add license checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 19:39:20 -0000
X-Groupsio-MsgNum: 41246
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OowMmFE4aK71mEhh"
Content-Disposition: inline

--OowMmFE4aK71mEhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2012 at 05:22:03PM -0200, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-efl/recipes-efl/e17/rage_svn.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/=
e17/rage_svn.bb
> index 2038054..5e3d5f7 100644
> --- a/meta-efl/recipes-efl/e17/rage_svn.bb
> +++ b/meta-efl/recipes-efl/e17/rage_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Rage is a media center application based=
 on EFL"
>  AUTHOR =3D "Carsten 'The Rasterman' Haitzler"
>  HOMEPAGE =3D "http://www.rasterman.com"
>  LICENSE =3D "MIT BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f38e182dcaf30fe8=
a35"
>  DEPENDS =3D "emotion evas ecore edje"
>  SECTION =3D "x11/multimedia"
>  PV =3D "0.3.0.042+svnr${SRCPV}"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OowMmFE4aK71mEhh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCG71AACgkQN1Ujt2V2gBwsVwCgio0IgMu4zN01OiMyVyJhZ9j3
2hUAnR2AlpIRANzt4clWIURIp0fJbD65
=RDP5
-----END PGP SIGNATURE-----

--OowMmFE4aK71mEhh--
