Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0316FF9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 19:49:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id e201so33238988wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K6ElUU1nWqIR2bAGy2oQT1GEoXG2yHMNyDPQaGPEd4Y=;
	b=Rjb7+HEUAYF6e/v5EPwq0ZMrhvEdPiVLjQbKAO+juLqzKsqenC8JXVw9ZjsQ8P8bjR
	77YUnx7OLk3zux3mcNf0ck/O8tpXcbFcM+aPSr+Ze3GBvWfGRYeh+00RCYfGVOMT6nag
	J+5tMGt0jS7vhEHe62NACy3s/xMzFvRqjNRQQan8uI4m4w+8Ac7QQxzIwYJzHCpIfh9I
	Xt50br/R+nx8qSA0kt3hMgXzhqlMNZQI9fQssKXowdSh12JnuL3/v3PKou8k0v0d4BUI
	znWofS7WbxXcouTrtSs2MFGFCiWkf2maUow/OlHAlkDAtLVpxdVcDjv6jvlogbdeIEfo
	uuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K6ElUU1nWqIR2bAGy2oQT1GEoXG2yHMNyDPQaGPEd4Y=;
	b=Warwa4AjPeGHW9osnEzBOM8MqIGKchcK5SbOYhZjnPd76CXmMC8GlFG5wQojYkNLck
	2srXzNiq2yorFGLKPVBw+L85ltQ/QYeWBbqqwRXasEYQBD2wNnJgjUJaC4ErzWM5RVYd
	/8rd0L0JFWjL87qOXHKD2EExig4YsPXsCkbQsV1xZ5mKPwLjhwoJzcFd/IsrqilWd1AV
	06MXhEgeMsN/tpk003OO/ArCDx7095ziHCzuq8LzrXitA+5o5n543Fv4B+/QZjARzN0r
	VUX0Fklx+Qe1uKAwYjeOBKjpKJVGyWpoU/jMHCzFYC48qyS2UXRy0wrOPndPAF18v6ej
	MVWQ==
X-Gm-Message-State: AOPr4FVdKNMPIERbBLxnmDdD33k3IoiLGhOSZXT9ZahBJyb6vo0txqdb9FJ0G1jqnHXPQw==
X-Received: by 10.28.103.2 with SMTP id b2mr5411132wmc.66.1462477788640;
	Thu, 05 May 2016 12:49:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b124sm6305577wmb.1.2016.05.05.12.49.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 12:49:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 21:51:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160505195110.GE23370@jama>
References: <1462475526-12554-1-git-send-email-neenareddy.busireddy@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1462475526-12554-1-git-send-email-neenareddy.busireddy@nxp.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH] assimp: Add recipe for Open Asset Import Library
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
X-List-Received-Date: Thu, 05 May 2016 19:49:52 -0000
X-Groupsio-MsgNum: 61349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline

--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 02:12:06PM -0500, Neena Busireddy wrote:
> Open Asset Import Library (short name: Assimp) is a portable Open Source =
library
> to import various well-known 3D model formats in a uniform manner.
>=20
> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> ---
>  meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
>=20
> diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/re=
cipes-graphics/assimp/assimp_3.1.1.bb
> new file mode 100644
> index 0000000..d28418d
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Open Asset Import Library is a portable Open Source lib=
rary to import \
> +               various well-known 3D model formats in a uniform manner."
> +HOMEPAGE =3D "http://www.assimp.org/"
> +SECTION =3D "devel"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD;md5=3D3775480a712=
fc46a69647678acb234cb"

NAK

LIC_FILES_CHKSUM should point to some files in the project

> +
> +DEPENDS =3D "boost"
> +
> +SRC_URI =3D "http://sourceforge.net/projects/assimp/files/assimp-3.1/ass=
imp-3.1.1_no_test_models.zip"

Use SOURCEFORGE_MIRROR, BPN and BP variables.

> +SRC_URI[md5sum] =3D "ccd4788204509da58a3a53c7aeda7a8b"
> +SRC_URI[sha256sum] =3D "da9827876f10a8b447270368753392cfd502e70a2e9d1361=
554e5dfcb1fede9e"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

Why is it MACHINE_ARCH? nothing in DESCRIPTION suggest that this should
be MACHINE specific project.

> +
> +inherit cmake
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake/assimp-3.1/*.cmake"
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

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrpC0ACgkQN1Ujt2V2gBxJVQCdFxSfmLeXCYQkI3m2icOQq+7z
0VwAn1DWAx343DKbbZKIP9SLyxDqs8fQ
=0Uut
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
