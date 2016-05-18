Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71C6F73212
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 19:27:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so15260182wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AmW6NCGmH7Jpzt2MokbCQ65jIikl/6h94fH19MtmSmk=;
	b=tckhuapTETtvqD7ITekhLHqE5XEZV+UpnrbCRgPUSWsV+pmng6/mwbdKn3EyamW6tq
	FrU6OJfn/ZHqOII58CaqKpnE9KGbF6tZYybVFdJDnsypftIxpXAuWhsPtLjneC9jwCl5
	QjKyWFkuBQ65Ak7sMimbIQSWpQ1V+K+0AcAtMYxZ8n1kpPCg+H1lPl+ai8fqAqTi5LeM
	yK707/YKL06O8F/DQ8R7CjmjJRfbwfIj2OlvDNl+yQVOic1El7ec+2Xk340jBYQgsV3n
	jw4TdvgRBKJQJX+Hme2hzsQSYQaoly3Uc0pIuE96YYY7VXmQr3IajEzPrEgDWdlgZ7FY
	NC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AmW6NCGmH7Jpzt2MokbCQ65jIikl/6h94fH19MtmSmk=;
	b=hq19OigAjG9XVR6hbjH/sbBb8FBwzBLUunDGCc3AnUyHgAWbebgyAl4I8i97uspk6x
	ZdCy6g05kp15TmkGM9e7NAfCLt6yz02ek4rcmGX5q2ME4f70PMWRh+EalF+Xw69Z04/u
	rD2SEdH527kQeRzXAPdvCN/9jgcTdKKRc8Hs1AB20cbXVQZLJ6CzGGtdhNIXyTZJk01M
	A+t2V2ilU4D3WOT//U/5z974QC13deAnDg6KBU0Sx2ehG7REHujz63qRyjE4ODWPomCf
	yWw1nexRRKec936M4rJnk9dZrWXV0ZXvkbmt04FyLX5eIHR/yzsmE6wZYCNbk9WA6od2
	gs7g==
X-Gm-Message-State: AOPr4FXV32RPIygJMhT4zlA8TguC8n6l86ItatH0R7Ze9mE1LrcOgHaMYmGvSsvpAmTSRQ==
X-Received: by 10.194.59.108 with SMTP id y12mr8952405wjq.63.1463599645521;
	Wed, 18 May 2016 12:27:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r75sm31098668wme.18.2016.05.18.12.27.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 12:27:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 21:27:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160518192755.GF2579@jama>
References: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Wed, 18 May 2016 19:27:26 -0000
X-Groupsio-MsgNum: 61544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline

--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 02:41:49PM -0500, Neena Busireddy wrote:
> FreeGLUT is a free-software/open-source alternative to the OpenGL
> Utility Toolkit (GLUT) library.
> More information about this library can be found in
> http://freeglut.sourceforge.net/
>=20
> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> ---
>  meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17 +++++++++++++++=
++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-o=
e/recipes-graphics/freeglut/freeglut_3.0.0.bb
> new file mode 100644
> index 0000000..7671e75
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative to =
the OpenGL \
> +               Utility Toolkit (GLUT) library"
> +LICENSE =3D "X-Consortium"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78a=
dfb"
> +
> +SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "90c3ca4dd9d51cf32276bc5344ec9754"
> +SRC_URI[sha256sum] =3D "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1=
f375f1ff999f76a2"
> +
> +inherit cmake

you're missing distro_features_check here, so the check bellow doesn't
work

> +
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +PROVIDES +=3D "mesa-glut"
> +
> +DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
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

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8wjoACgkQN1Ujt2V2gBzeYQCeKZVrcUYBMjQNhgE5Zaubq4l6
ShcAniB/5mMecc/7i7H8NiolHDrzfQZ8
=6/Ux
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
