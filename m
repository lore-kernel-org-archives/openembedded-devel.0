Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2D377CFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:13:40 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id o21so136173274wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0mOk1AooK/w6WYRRHUrhON3Pa6xxksBAXUsZGKY0RuE=;
	b=hQ5E+lRvt4PzjFRz3OnC65tQqmJRsxWo3R9boRJMlkHsvU7mkg8wsHA9QK5AiLmxN/
	OL2R0Q0PYq64YIsbnKNyi6JITwUVqmpVi3eM316O9FmEy/k/pjPBSlU3EtJ/hPOnHFrB
	i2eYzIM9IzgDlIVVLPquAz8TaE7EFUnblyegLrNEQytEzLjHK58y8JbdpTHn7u8EdnNc
	NI/HMjwOL+TbRygW6R1ZYyZzJ3Kool0wdO8LTDvFBcpbfLD5BRaI+x1+ycxxZXQWUAjo
	AG7JrbYfoMffy0VYletOOr8VnLcSOzSuUK8nOrnPq2BPtb/jALJSv9tbRKbYPj9n9fSk
	SAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0mOk1AooK/w6WYRRHUrhON3Pa6xxksBAXUsZGKY0RuE=;
	b=XJu0Kogosuzo1bog7KxZWReo/NuhZM3imOSGK8c2iCFpwky2rPLLTKrLlyJ2ipKPF0
	PMnsigEW6xbK6M5PdA+KE1cq0Ngl3db3bVGzluT4YDHNUp2Xo7KNiP3BiDZlLCMhiDpl
	sBpMJ36UnRDRbtC8ab6ykBKrqvWwWoPrNBVRjUvXOqgXB+4ZdJWvX6Tk0LS4zfoHLBI/
	ua2WxOo9hSZuJiUEoO49ECsygTKnDV/JyL1Ud2Kka+PSbqAGHROJG5OfnourtbWfMK+V
	MvAKNxw4vN/bp9y2kbpjID0uTVA9HRGBAUJyNjJ2bH4MU6/3QADKZJGMFO2hQ+dRFPeV
	vRKw==
X-Gm-Message-State: AFeK/H00a5siIn0lsic6rayL3gA/K420WFA306wGiXHooI2nv3x1bL64kQgjVSKbQQFsSQ==
X-Received: by 10.223.164.141 with SMTP id g13mr39952992wrb.82.1491902021775; 
	Tue, 11 Apr 2017 02:13:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h3sm20621256wrb.43.2017.04.11.02.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Apr 2017 02:13:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Apr 2017 09:13:40 +0200
To: Florian Wickert <fw@javox-solutions.com>
Message-ID: <20170411071340.GA3036@jama>
References: <20170410213119.18504-1-andrej.rode@ettus.com>
	<13e5962a-41bc-c785-da98-04d46004cf52@javox-solutions.com>
MIME-Version: 1.0
In-Reply-To: <13e5962a-41bc-c785-da98-04d46004cf52@javox-solutions.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v2] systemd-python: add a new recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 09:13:41 -0000
X-Groupsio-MsgNum: 66192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2017 at 10:36:54AM +0200, Florian Wickert wrote:
> I suggest to use DEPENDS +=3D "systemd (<=3D234)" to enforce version=20
> checking against systemd for this recipe.
> License is LICENSE =3D "LGPLv2.1+" from what I see on github.
> Also, since you are using ${PYTHON_PN} already, it would be good to have=
=20
> both python 2 & 3 recipes.
>=20

The summary sill says systemd-python.

You should also add:
inherit distro_features_check
# depends on systemd
REQUIRED_DISTRO_FEATURES =3D "systemd"

>=20
> On 04/10/2017 11:31 PM, Andrej Rode wrote:
> > Adds new recipe for python-systemd, python bindings for libsystemd
> >
> > Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> > ---
> >   meta-python/recipes-devtools/python/python-systemd_234.bb | 12 ++++++=
++++++
> >   1 file changed, 12 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python-systemd=
_234.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb =
b/meta-python/recipes-devtools/python/python-systemd_234.bb
> > new file mode 100644
> > index 0000000..4eb2170
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY =3D "Python interface for libsystemd"
> > +HOMEPAGE =3D "https://github.com/systemd/python-systemd"
> > +LICENSE =3D "LGPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd25595107900=
8b364516c"
> > +
> > +PYPI_PACKAGE =3D "systemd-python"
> > +DEPENDS +=3D "systemd"
> > +RDEPENDS_${PN} +=3D "systemd"
> > +inherit pypi setuptools
> > +
> > +SRC_URI[md5sum] =3D "5071ea5bcb976186e92a3f5e75df221d"
> > +SRC_URI[sha256sum] =3D "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391=
228047d33895db83e7"
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOyCIwAKCRA3VSO3ZXaA
HIvPAKCc9tSOGezUQw2DhA9dG1qasCD4IQCgoVdEhiDFfuHZBn34QkcKBjJ0QiQ=
=JZSK
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
