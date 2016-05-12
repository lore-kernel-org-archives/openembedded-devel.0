Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14706605BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 22:09:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so7623711pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=vQhUMF8iTpV4iH6tyIija7dVCE7g8iY92H23DuQk54M=;
	b=kbqto0yIVs7XWks8VcTXLNQuNTx3HB4/9jHu+uR7Ylz4PQkSihnfdDdd/oxEfLUf6t
	Cm2yjSkexn7a0GId90HFO1Au7pA00IaaybGh84pns+ikK3KB/O2a1dUBdOmeuUC7Hz/d
	fid9VB9eHZgNxviN/oIR1VqQtX6YqOI+IdwMgafbYAIWq0B7BvDxBcWabO7vNtV1tfdp
	HFf74R2sVVyGSpWs+QNyLGvspDEhzcE/zQNGFbQfgjczTt3aiuTmnY8AqjD84Zyhfygk
	tvE4PDb/QM048yKtp5VE/zRDlSq2wSQsDArpi42H9zvGVUVgPB0UANG0ypN7Gf7Obr8t
	YShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=vQhUMF8iTpV4iH6tyIija7dVCE7g8iY92H23DuQk54M=;
	b=b7LZIE1YLWF/nN22Qwon5fy2g/d9pwMExCe6XMr43WzgYu//7eNPoIf33SzgvrtgTc
	PuXV8achM6v2nwNVCyNVz3sDB0ny3Qg7J3Lof0KNi0J9bX+13kN1A6pKeOOkA8Vnz4pN
	qgqh21Eesecp1jhPvwCh9RaIHdI0OibcMa/6DRm6HWi0EKqyW4EED3G7H2CHSJYNZIlI
	ocUJkjVwz7zNzlgXFOm+BxFNRny4SfCBhIV7LN5KIk4ZDrDUOkdJgrh1yr9NDhn8c45g
	8+/SbpinljfCnNXBnY1xCkX15jopE58IeNJ5Ti2qzG3uYs2LCH9e2Y5MTthtTYQXPDTP
	yuBQ==
X-Gm-Message-State: AOPr4FVdZy0aTu50W8LSQE/IcxDWvuopWYlkoSxbB1ewpbU2IyTllbK55CZ/9TJBt2aLuA==
X-Received: by 10.98.78.132 with SMTP id c126mr17256693pfb.129.1463090998840; 
	Thu, 12 May 2016 15:09:58 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:d8f5:8cf0:9b2c:6e2f?
	([2601:647:4c00:115c:d8f5:8cf0:9b2c:6e2f])
	by smtp.gmail.com with ESMTPSA id
	k78sm22115866pfk.70.2016.05.12.15.09.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 15:09:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463081158-10495-2-git-send-email-neenareddy.busireddy@nxp.com>
Date: Thu, 12 May 2016 15:10:20 -0700
Message-Id: <7DEAD0AF-B666-40C9-96C6-23D03A40A679@gmail.com>
References: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1463081158-10495-2-git-send-email-neenareddy.busireddy@nxp.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH v2 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Thu, 12 May 2016 22:09:59 -0000
X-Groupsio-MsgNum: 61483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_69ED7384-3CBA-480E-9B2F-7ACD16836145";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_69ED7384-3CBA-480E-9B2F-7ACD16836145
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 12, 2016, at 12:25 PM, Neena Busireddy =
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
> index 0000000..a98b289
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative =
to the OpenGL \
> +               Utility Toolkit (GLUT) library"
> +LICENSE =3D "MIT"
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
libxrandr=E2=80=9D

should this be +=3D

> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_69ED7384-3CBA-480E-9B2F-7ACD16836145
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc0/1AACgkQuwUzVZGdMxT9XACfW765mvgvN6NZkJr66r+3Xri6
QywAn2RoSufRVLWv9eOXl6CM/PyUj9wF
=jMRB
-----END PGP SIGNATURE-----

--Apple-Mail=_69ED7384-3CBA-480E-9B2F-7ACD16836145--
