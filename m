Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E20606BACE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:59:07 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so1662260eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7c7J86ZKHLoHrVQDBmekBlkL2V/PNdjNtSKogtWkSLU=;
	b=bsNXPZm81hHVZkJ71MWlhxJYAUCx04xJn5QYlFsv5PXM1Et5CE+NIGJ5yTJ2+UmpJd
	YKDQk0tmycCtNFpTQ9f7AdIuXsEMD/0zfx62a18tVanaLzFgmJrGAONL4XccJnl52rnw
	HUoyl+SVLPQ8N00NAqIsLHaBK50m2fGbit1qYVTX2YtkE6ZwGW+R6JGjAAXhlzhw3rV7
	hLhPy6GquabEQPa2jilqgaMtVeY5pNOIf8QsouFevIYEUspkZVSPbV3Q32QwHj2BClgp
	OvQ7bT40sJ96gsOSNNe6THzn7e11oKKBLlZ89s0Qm/E3KgjbM2BbAq/6Z/DVtn8mzR7E
	L6pQ==
X-Received: by 10.14.205.9 with SMTP id i9mr3247803eeo.72.1377529148282;
	Mon, 26 Aug 2013 07:59:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm21983415eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 07:59:07 -0700 (PDT)
Date: Mon, 26 Aug 2013 17:00:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130826150018.GS3544@jama>
References: <1377525287-9015-1-git-send-email-mihai.prica@intel.com>
MIME-Version: 1.0
In-Reply-To: <1377525287-9015-1-git-send-email-mihai.prica@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] python-docutils: upgrade to 0.11
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
X-List-Received-Date: Mon, 26 Aug 2013 14:59:08 -0000
X-Groupsio-MsgNum: 45855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABd7dauUP597Mpr3"
Content-Disposition: inline

--ABd7dauUP597Mpr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 04:54:47PM +0300, Mihai Prica wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>

What was changed in license file?

> ---
>  ...hon-docutils_0.5.bb =3D> python-docutils_0.11.bb} |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-docutils_0.5.bb =3D> pyth=
on-docutils_0.11.bb} (55%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/met=
a-oe/recipes-devtools/python/python-docutils_0.11.bb
> similarity index 55%
> rename from meta-oe/recipes-devtools/python/python-docutils_0.5.bb
> rename to meta-oe/recipes-devtools/python/python-docutils_0.11.bb
> index e4c8a7d..f435e1b 100644
> --- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
> +++ b/meta-oe/recipes-devtools/python/python-docutils_0.11.bb
> @@ -2,14 +2,13 @@ DESCRIPTION =3D "Text processing system"
>  HOMEPAGE =3D "http://docutils.sourceforge.net"
>  SECTION =3D "devel/python"
>  LICENSE =3D "PSF"
> -LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dac6ee29ac0310c091afab5ac4=
bea2fa3"
> -PR =3D "r2"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dda0d261d1db78ab21ce86c793=
64a4098"
> =20
>  DEPENDS =3D "python"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "dd72dac92fc8e3eb0f48c3effeef80f6"
> -SRC_URI[sha256sum] =3D "747cf984edfca0575addbb42453274a1bdd98ec7780bd37a=
883dc8b2a66a610e"
> +SRC_URI[md5sum] =3D "20ac380a18b369824276864d98ec0ad6"
> +SRC_URI[sha256sum] =3D "9af4166adf364447289c5c697bb83c52f1d6f57e77849abc=
ccd6a4a18a5e7ec9"
> =20
>  S =3D "${WORKDIR}/docutils-${PV}"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABd7dauUP597Mpr3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEUEARECAAYFAlIbbYEACgkQN1Ujt2V2gBwbRwCgsaSlUEEclShi/9QZdfAgJaK+
+f0Al15xMTq/y6vs61IIomCruf1ShDA=
=WKP4
-----END PGP SIGNATURE-----

--ABd7dauUP597Mpr3--
