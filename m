Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LjPCK-0001sk-IW
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 03:38:34 +0100
Received: by wf-out-1314.google.com with SMTP id 28so3687636wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 19:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=YNSIdDFojnIaMts2DK4Rxft7wvb7afgxvXcQ62d1Ae8=;
	b=Fx0sawfVD1e1+I/CNJcb33JkSQUs4Wvslp9huT0L8poiBpMBFj/io99OVEhaW9g9FM
	XBJWK6hP30svWuDCIeuvXMh2zIAqgbYYczz0yOevOwoUQLCxrU8C+BndprM7tmUBwCiE
	mzGElGSGvHG1hy0Vuno/jzS1oxXnd4zstGrkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=vPVV7PlNyvk7BcwAWe7qEkQG84FlXmyv8Or7QKi5+pDabZlozeYUYujeE/Yzu+RRNh
	1w12+4aL3RNd5fK/I4pkF6fDdkBIULklKFV10MZkj07LL/prrEV83d6fNOPK9oF/e25Z
	gmZMAb/nXT4I0gB75t9AfPXdfE0N93W7I/ibc=
Received: by 10.142.172.20 with SMTP id u20mr1357659wfe.228.1237257470598;
	Mon, 16 Mar 2009 19:37:50 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-2-112.dsl.pltn13.sbcglobal.net
	[71.146.2.112])
	by mx.google.com with ESMTPS id 32sm13091116wfc.9.2009.03.16.19.37.50
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Mar 2009 19:37:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:37:48 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-10-generic; KDE/4.2.1; x86_64; ; )
References: <20090316195707.GA3793@sourdiere> <20090316203014.GA4171@sourdiere>
In-Reply-To: <20090316203014.GA4171@sourdiere>
MIME-Version: 1.0
Message-Id: <200903161937.48885.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.200.170
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] qwo input method recipe
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
X-List-Received-Date: Tue, 17 Mar 2009 02:38:35 -0000
X-Groupsio-MsgNum: 8470
Content-Type: multipart/signed; boundary="nextPart2750050.IcfVjsjG9n";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2750050.IcfVjsjG9n
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 16 March 2009 13:30:14 Charles Cl=E9ment wrote:
>=20
> ---
>  packages/qwo/qwo_0.4.bb |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 packages/qwo/qwo_0.4.bb
>=20
> diff --git a/packages/qwo/qwo_0.4.bb b/packages/qwo/qwo_0.4.bb
> new file mode 100644
> index 0000000..bdf6d6d
> --- /dev/null
> +++ b/packages/qwo/qwo_0.4.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "qwo virtual keyboard"
> +AUTHOR =3D "Charles Clement"
> +HOMEPAGE =3D "http://www.nongnu.org/qwo/"
> +SECTION =3D "x11"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "libxtst libxext virtual/imlib2 libconfig"
> +RDEPENDS +=3D "imlib2-loaders"
> +PN =3D "qwo"

you don't necessarily need PN here

> +PV =3D "0.4"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://download.savannah.nongnu.org/releases/${PN}/${PN}-${=
PV}.tar.gz"
> +
> +inherit autotools
> --=20
> 1.6.2
>=20

=2D-=20
Khem Raj

--nextPart2750050.IcfVjsjG9n
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm/DPwACgkQHnJKy6V6em5OawCfUCZYACtX6cPBq1rHkAtSpH1G
itIAoLbQW9WraZmCubqvr675hfP/crYV
=ferE
-----END PGP SIGNATURE-----

--nextPart2750050.IcfVjsjG9n--
