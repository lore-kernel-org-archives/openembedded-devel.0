Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30F846FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 19:47:22 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so4260317pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=/TzE3bz7U9TwUE0XI5veJ5YyBuoObrPg+Js68Zqt2Jw=;
	b=gbc8h+bt7SnlxVhs6LWS0/prSRYY/VpV+kCf6FoaUShBYozbet67RCLo8r/tCkxc3R
	zJ7rSKF1aeIM1J9mnqEK4ZaCTIfSD0pnMLwb8qjX/WAANoPfwEu75kwkJuHDeER0U8v7
	tJn7A28E1nkBtkWtCAiwpcOpD7xWITxSHsEflQEAq7bU0r36FTQsYsPqwXxASJdUXWgN
	TC8nC1AYvc11nfVU9XfJtvkAyG4X/bLqmcZWV52AWBTK3ocCzjr4FYrVL/y5+U5+cbxK
	83QIqBgI8EN2tmqzH+tHQbB7vmWb9qQ04qCS+QGlPQ+rSa42AtCwa2JDl+obCqcGi3Ft
	SX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=/TzE3bz7U9TwUE0XI5veJ5YyBuoObrPg+Js68Zqt2Jw=;
	b=Rgd63zSVjzkYCpL4YaNJZlp2D37hH8wndc55srzezXwlcb+Sc9/vltKtO1iHZmVZqk
	bvhWH81KhooGi6/0Qh8imgkfg6G0g2JZ0bnREyiE48qMsp8FyuNrFJzJyjlbi9r3OKd6
	7rjW3YJpyw8BQP0omkLvC41GnBDNXHPGD/f+ejrm+pHqDmXuYm+paARpmcIr7eRQq3mq
	Vd+4llTxbFH8aXOvdDednMqoY6PB0QHqSjKXfpKDXrCIKOYrGOTDWP0n08q6Ro8hVgeO
	wTV0QmUZqtUXyMT+WaEgOixB1Mc6cvFQ9v4lOIq0t8NJuTrxw9JLucgsYA5OhJhzihSJ
	K3Tw==
X-Gm-Message-State: AOPr4FU9MydTDG5dNRgqIBSmgKXtDhD2xKnE4hqZzXvReJOlVbJiuvX0FoxrZ0P2OqZPcw==
X-Received: by 10.66.55.101 with SMTP id r5mr7709476pap.146.1462996043781;
	Wed, 11 May 2016 12:47:23 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7119:942b:11ba:5964?
	([2601:646:8800:5a9a:7119:942b:11ba:5964])
	by smtp.gmail.com with ESMTPSA id
	q70sm14112857pfj.81.2016.05.11.12.47.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 12:47:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
Date: Wed, 11 May 2016 12:47:40 -0700
Message-Id: <DAB557BF-26BA-45FA-A533-DE7A45C92B6D@gmail.com>
References: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Wed, 11 May 2016 19:47:23 -0000
X-Groupsio-MsgNum: 61475
Content-Type: multipart/signed;
	boundary="Apple-Mail=_48641289-3E5E-4C99-A340-9E33BF5A6473";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_48641289-3E5E-4C99-A340-9E33BF5A6473
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 11, 2016, at 12:41 PM, Neena Busireddy =
<neenareddy.busireddy@nxp.com> wrote:
>=20
> FreeGLUT is a free-software/open-source alternative to the OpenGL
> Utility Toolkit (GLUT) library.
> More information about this library can be found in
> http://freeglut.sourceforge.net/
>=20
> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> ---
> meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17 =
+++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb =
b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> new file mode 100644
> index 0000000..7671e75
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative =
to the OpenGL \
> +               Utility Toolkit (GLUT) library"
> +LICENSE =3D "X-Consortium=E2=80=9D

This seems a new license type. Can you point to the text for this ?

> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78adfb"
> +
> +SRC_URI =3D =
"https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.t=
ar.gz"
> +SRC_URI[md5sum] =3D "90c3ca4dd9d51cf32276bc5344ec9754"
> +SRC_URI[sha256sum] =3D =
"2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
> +
> +inherit cmake
> +
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +PROVIDES +=3D "mesa-glut"
> +
> +DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu =
libxrandr"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_48641289-3E5E-4C99-A340-9E33BF5A6473
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlczjGAACgkQuwUzVZGdMxSQxACfYbnocmf6YNb8qaIWQ46WyagB
rQYAn0Ix3N0C51rG8pOuhY4uGDw0UzoE
=1Ybs
-----END PGP SIGNATURE-----

--Apple-Mail=_48641289-3E5E-4C99-A340-9E33BF5A6473--
