Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFCF77158
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 16:09:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g141so3312665wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xQflNAgSJAyVIXFutw4GigeMMV4tG/xrqmkaR8JPrIs=;
	b=k6Nx0lM45kEonGdoxRiYntQpJ9DSx+6e/7pXnyMww2qyG/pfF9Qemaw8VLLwgqf9YG
	h5kJQGJqErCZ60b35XY+u79Dwcqmfa1bhcf6ZdloEODo798YjTrIwxoTJeLgdj9EBjL4
	MzknD6Ts9QgTZKv/bPjNX77/I8UMYZL5DHYZrka3B/ME+v80ROvEHDjHbM4/qVSxH+fE
	mRa/qmT2mTKZ1/KfHE4xWy7rTLzAbnEXjmZ55wt4tcAr5CDtuH1mMszIQLPivL1osZw4
	DlMBZ9k5KXavvuzEzovYQrT3XCXl1vopH111q555HiXYf0dhce1SXjliPe3yNM2Ad2ni
	WRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xQflNAgSJAyVIXFutw4GigeMMV4tG/xrqmkaR8JPrIs=;
	b=h/L3ih8uQmINCWTk1CDCwnBfr5C+3dOw2sXYQe/MzGm/+hpDPXOthoeKylNTCAglm0
	44OHA8TENPASdWwZntc7cJFmhSeVO+/J+SXKEUSURBQzboRjgZLeJI9KjsyxR3oXdz4H
	CN+HizHyvRYTIQzatCfllSNfSYjVMe5gxPhLnKgMvKZqrIbXJQo0Nq5U6gCE0CQMxxcR
	5pWTt9rZkck/Q2v1hHWohR4cdC2dBcIKEMtvfcPP+sbqrrwydWznHAu7dWGU58eAkntV
	nDd5IiXboYJasrxREk52BRS6OIPGU3NpXsZdE30jzTnh2hHUYcMxMxDu1Q/u4yPx+vOd
	Tc6Q==
X-Gm-Message-State: AE9vXwM10WoyyPK5VfpKrGyOixBx4NyG62jCHGvdEFG54wY4dscxBrIZEvJdNOZr/sB1wQ==
X-Received: by 10.28.151.72 with SMTP id z69mr12292285wmd.61.1473696583523;
	Mon, 12 Sep 2016 09:09:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	r4sm18471791wme.21.2016.09.12.09.09.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 09:09:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Sep 2016 18:09:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160912160945.GA2653@jama>
References: <1473280623-4410-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1473280623-4410-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-python][PATCH] python-unidiff: python module for parsing diff data
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
X-List-Received-Date: Mon, 12 Sep 2016 16:09:46 -0000
X-Groupsio-MsgNum: 63079
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 03:37:03PM -0500, leonardo.sandoval.gonzalez@linux.=
intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>=20
> The module takes diff data, from commands like diff or git-format-patch,
> parses it and creates python objects in the form of patch sets. More
> info is given on the recipe metadata.

This conflicts with python-flask-pymongo

ERROR: python-flask-pymongo-0.4.1-r0 do_populate_sysroot_setscene: The reci=
pe python-flask-pymongo is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:
qemux86/usr/lib/python2.7/site-packages/tests/__init__.pyc
 Matched in b'manifest-qemux86-python-unidiff.populate_sysroot'
qemux86/usr/lib/python2.7/site-packages/tests/__init__.py
 Matched in b'manifest-qemux86-python-unidiff.populate_sysroot'
Please verify which recipe should provide the above files.

>=20
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.=
com>
> ---
>  meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.=
5.2.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb =
b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
> new file mode 100644
> index 0000000..3ee5bc2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "Unified diff parsing/metadata extraction library"
> +HOMEPAGE =3D "http://github.com/matiasb/python-unidiff"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4c434b08ef42fea235bb019b5e5a9=
7b3"
> +
> +SRC_URI[md5sum] =3D "20dd70ba5a35bc95bf869322d6852227"
> +SRC_URI[sha256sum] =3D "344330ec3637e96b44dca77e086b205645b55648cf4d2b80=
fc673200f8a6a7e9"
> +
> +inherit pypi setuptools
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfW0lUACgkQN1Ujt2V2gBwpaACggvuiCLZb97nwZMORC2uiK4uR
dJoAnROpEG4fuU61pzwKqR1hNKZI/KEr
=grxI
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
