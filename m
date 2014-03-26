Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id E8A736EC83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:53:43 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2120781eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hT6vk6OESSOual+CksofwzU3w72qMuZbIJsp/jPpgI4=;
	b=nc06QtywmimqdWdgvC/zl2AkZAcHL7d6YAUtBmwknGMGF0nIqLGJ4Vj17ad0lqweTh
	GkBIkfsZ3m4VjLxaRpZ9Q0sXTqMAOuJyzovDbm+6g9/g4M9sOTPDrSk0UiBqaZheSeKZ
	9EutAWb841KdIkG/Of9HX5FIlpzr+t9gc9jI82b5PbfKv+mPn7fxnoTphPEZmpbv1aqd
	1rvbdEZc00v58jFuWXp6gw1srVuiiyhr1sHSA1beYLPRyVDywiLKjiCBkfxVpRXA4JlS
	3RyKAvAS55I7S0hpkhWzA30ZFDMegNMd+2Q/iecTreKWci42M7nxzKi4Bg9QhHff69bl
	jN+w==
X-Received: by 10.14.37.8 with SMTP id x8mr76770953eea.32.1395867224296;
	Wed, 26 Mar 2014 13:53:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm31121979eev.5.2014.03.26.13.53.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 13:53:42 -0700 (PDT)
Date: Wed, 26 Mar 2014 21:53:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326205342.GM3709@jama>
References: <cover.1395847615.git.diego.ml@zoho.com>
	<1dad75368ed6fe55aab3ce0343e0a44f2fc10cb2.1395847615.git.diego.ml@zoho.com>
MIME-Version: 1.0
In-Reply-To: <1dad75368ed6fe55aab3ce0343e0a44f2fc10cb2.1395847615.git.diego.ml@zoho.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCHv2 3/3] python-autobahn: upgrade to version 0.8.6
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
X-List-Received-Date: Wed, 26 Mar 2014 20:53:46 -0000
X-Groupsio-MsgNum: 48845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dp9QYJgVRVEW2bsm"
Content-Disposition: inline

--dp9QYJgVRVEW2bsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 04:31:24PM +0100, Diego Rondini wrote:
> Signed-off-by: Diego Rondini <diego.ml@zoho.com>

I'm going to add it to master-next, but please send v3 with commit
message which will say what was changed in license.

> ---
>  ...autobahn_0.5.14.bb =3D> python-autobahn_0.8.6.bb} |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-autobahn_0.5.14.bb =3D> p=
ython-autobahn_0.8.6.bb} (87%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb b/=
meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
> rename to meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> index 0208c8b..a1e8c5f 100644
> --- a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
> +++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> @@ -5,10 +5,10 @@ HOMEPAGE =3D "http://autobahn.ws/python"
>  SECTION =3D "console/network"
> =20
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D " file://autobahn/__init__.py;beginline=3D1;endline=
=3D17;md5=3D81964ceb3ab93bfb5e8cfbcd26f3af9c"
> +LIC_FILES_CHKSUM =3D " file://autobahn/__init__.py;beginline=3D1;endline=
=3D17;md5=3D1fdeccf6e5b70cda64cc1345597c18e3"
> =20
>  SRC_URI =3D "https://pypi.python.org/packages/source/a/autobahn/autobahn=
-${PV}.zip"
> -SRC_URI[md5sum] =3D "e2c80ba3e46428b32837537609d4d582"
> +SRC_URI[md5sum] =3D "160429e7fb043940e79aa7f4ebbab57a"
> =20
>  S =3D "${WORKDIR}/autobahn-${PV}"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dp9QYJgVRVEW2bsm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzPlYACgkQN1Ujt2V2gBxaLACePvXtqdLsWESlss/eo9OFkFry
U+8AoLbPvxSwwp5zRmI1e65pTXu40jP2
=Bwyd
-----END PGP SIGNATURE-----

--dp9QYJgVRVEW2bsm--
