Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B7206731C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:28:58 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u188so141298537wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rMtTpURWSG/ThGePS11jHIvCvK6jK7qsVeGPInTap10=;
	b=Jvh/gH92WDYOID5F4nPZEJNjiZtS9BhIvnrXH1a2jLr99JsI2iK8VQuT47+jXDTIYL
	l4ftsrMPXLOyKEgw1QCSa9GAQE8KRhhXJg8UQf65aDoPNbn6D8tr+2iv19aYgKqmzgHP
	DLGVXSEsRyXFiyUIZOAQZSor3+VX/0UCSIiSLVVSMnx+Jak/vsP2pkEbv/Edn4Mjmq+S
	9TKCI9+jxybOkGsAR0EFNLx79R2hXCJHY2QXbqAeQEkSReGdub21QjbnFYs7PXfyT4py
	zkprIE+KJtt57ppEZeQFuXkWDJc7/CI10iBcqmPeAmDCzrDxwVg4QgRbwZ0MRkbKoakK
	Ihpg==
X-Received: by 10.28.131.70 with SMTP id f67mr43123271wmd.66.1451903338418;
	Mon, 04 Jan 2016 02:28:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z65sm36923284wmg.10.2016.01.04.02.28.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:28:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 11:33:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104103308.GA2581@jama>
References: <1451873378-5097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1451873378-5097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] python-simplejson: 2.2.1 -> 3.8.1
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
X-List-Received-Date: Mon, 04 Jan 2016 10:29:00 -0000
X-Groupsio-MsgNum: 59298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 06:09:38PM -0800, Li Xin wrote:
> Upgrade python-simplejson from 2.2.1 to 3.8.1.

what changed in the license?

Describe it in commit message.

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../{python-simplejson_2.2.1.bb =3D> python-simplejson_3.8.1.bb}      | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-simplejson_2.2.1.bb =3D> =
python-simplejson_3.8.1.bb} (68%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb b=
/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
> similarity index 68%
> rename from meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
> rename to meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
> index 7e42a7c..96c0aef 100644
> --- a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
> @@ -3,14 +3,14 @@ HOMEPAGE =3D "http://cheeseshop.python.org/pypi/simplej=
son"
>  SECTION =3D "devel/python"
> =20
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8a9f8dcfcd28c34daa443e5b1=
d29813b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc6338d7abd321c0b50a2a547e=
441c52e"
>  PR =3D "r1"
> =20
>  SRCNAME =3D "simplejson"
> =20
>  SRC_URI =3D "http://cheeseshop.python.org/packages/source/s/simplejson/$=
{SRCNAME}-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "070c6467462bd63306f1756b01df6d70"
> -SRC_URI[sha256sum] =3D "e85c5ae24dd9827113893c1dd2c799528195057388096f0f=
c45ad4b32b378c26"
> +SRC_URI[md5sum] =3D "b8441f1053edd9dc335ded8c7f98a974"
> +SRC_URI[sha256sum] =3D "428ac8f3219c78fb04ce05895d5dff9bd813c05a9a7922c5=
3dc879cd32a12493"
> =20
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKSmMACgkQN1Ujt2V2gByzAwCfcPNR+DW1r/r2dUpISXnkXG8d
S4MAoI0M4SjypGQisZN69HgpgQs1/3Rf
=Jr1h
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
