Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmLb-0002it-Tw
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:53:56 +0100
Received: by mail-we0-f174.google.com with SMTP id r6so1391241wey.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sXWQF2MuNBvBaAn1IdNlCUoZcpHnsR78eErAL0c46wA=;
	b=k/8EmkuaemdlSIVKLIHpcXJMUQs0t+gHvptsx9zzB+6xKFlELzpm08sz2vAS8KrOR7
	b3YixTfWTogVcMvtTxPQhrDdkMApKi5d5nkpjQXXcl/jhPZt+F/ne8/WzkS6py/mpljl
	VOii+CG1DXdfuyBlZpZFRUksiNbk7DKNSRdMPc3HP1KyaAe+IYYd8qcgLZNdRoO/Yslf
	D5sjTJShzcT+MmezeflCZySPLx1HUhqErG9Pjbc21ZWdA+qgsOgP2PrzXsXCjqGebzLG
	Y7f8W30hHxlrtPl0apfFpho836b53jwZKi9+ZE2iFLrUB1fDc5QQ5Lx6wwO/8IZz2oaB
	WuGA==
X-Received: by 10.194.242.69 with SMTP id wo5mr20309672wjc.10.1359369497833;
	Mon, 28 Jan 2013 02:38:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bd6sm11456064wib.10.2013.01.28.02.38.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:38:17 -0800 (PST)
Date: Mon, 28 Jan 2013 11:38:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128103820.GP16904@jama.palm1.palmone.com>
References: <1358863633-32066-1-git-send-email-david.c.nystrom@gmail.com>
	<1358863633-32066-2-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1358863633-32066-2-git-send-email-david.c.nystrom@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Subject: Re: [meta-oe][PATCHv2] meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
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
X-List-Received-Date: Mon, 28 Jan 2013 10:53:59 -0000
X-Groupsio-MsgNum: 42873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ga5bsqHr1s/xcZEm"
Content-Disposition: inline

--ga5bsqHr1s/xcZEm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 03:07:13PM +0100, david.c.nystrom@gmail.com wrote:
> From: David Nystr=F6m <david.nystrom@enea.com>

Applied with commit message from V1.

>=20
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  .../python/python-twisted_10.2.0.bb                |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/m=
eta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> index 5215dd6..5320946 100644
> --- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> @@ -7,7 +7,7 @@ SECTION =3D "console/network"
>  #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rat=
her than LGPL.
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc3159ad36d96a939fcd8f2c2c9b9d=
08a"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${P=
V}.tar.bz2 "
>  SRC_URI[md5sum] =3D "73da62c793269eade8121da336b01ba5"
> @@ -62,7 +62,9 @@ FILES_${PN}-test =3D " \
>  "
> =20
>  FILES_${PN}-protocols =3D " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/ \
> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
>  "
> =20
>  FILES_${PN}-zsh =3D " \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ga5bsqHr1s/xcZEm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVRwACgkQN1Ujt2V2gBwiJwCfR8UeqG1rs2m389uL43dO6cwp
5dIAnjFasanwN8IJDudYSZ28gN83XWAJ
=oNB8
-----END PGP SIGNATURE-----

--ga5bsqHr1s/xcZEm--
