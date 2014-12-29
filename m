Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8D92172523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 18:53:43 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so19739540wgg.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EXgeLWv+ttA9JsmlbzGDjVfeixk6GxusV+4eM5o+qYI=;
	b=0gSduJ2j7nVYjLrirP8Qzx7NNZx8OBe8jMZtFipyiCtgK/f3I7AMCMjdsW+jNdGjKQ
	e9VQNu3cTixIR78542gd0Pp9vfma7Lk9p0tzsj7qiN0Pr5W1qU/3zp9Dg2B6bh6Ry4wk
	s7zH1uyIDSelq6gqFwgRaHgvKDXlujVjPQBFe+8nA7RxfK+7x3ir9AyXCmapFTk0iP+4
	NceHhZE9SD9nevQj7MbXucjFWpKNfKxk2sD/uvhXb+Il2yCnSaW4y+PwuU19faw3DVkW
	vxfU+XLz2BgYPVOe5D242E1mEiDkpxBcuT1zPk9hZDcrF8K3yJtqKaC7JSOwgQXnGWhh
	sBww==
X-Received: by 10.180.218.39 with SMTP id pd7mr100131177wic.21.1419879223781; 
	Mon, 29 Dec 2014 10:53:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i3sm39797452wie.23.2014.12.29.10.53.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Dec 2014 10:53:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Dec 2014 19:53:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141229185352.GM2465@jama>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
	<CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
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
X-List-Received-Date: Mon, 29 Dec 2014 18:53:48 -0000
X-Groupsio-MsgNum: 53509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxIXENaY2CYUgF8u"
Content-Disposition: inline

--wxIXENaY2CYUgF8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2014 at 11:50:30AM -0700, Leah wrote:
> I was just wondering if this commit was recieved and/or approved?

Received and not yet approved, look at master-next branch.

> Thanks,
>=20
> Leah
>=20
> On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hotmail.com>
> wrote:
>=20
> > Signed-off-by: Leah <lchristina26@hotmail.com>
> > ---
> >  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}                    |=
 7
> > ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.bb =
=3D>
> > cyassl_3.3.0.bb} (74%)
> >
> > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > similarity index 74%
> > rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > index e3edab6..b6f852d 100644
> > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > @@ -1,4 +1,4 @@
> > -SUMMARY =3D "CyaSSL Embedded SSL Library"
> > +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
> >  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> >                 optimized for embedded and RTOS environments. It can be=
 \
> >                 Up to 20 times smaller than OpenSSL while still support=
ing
> > \
> > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> >
> > -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > -SRC_URI[sha256sum] =3D
> > "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > +SRC_URI[sha256sum] =3D
> > "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
> >
> >  inherit autotools
> > +
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
>=20
> --=20
>=20
> Leah Thompson
> www.wolfssl.com
> leah@wolfssl.com
> 406-570-1389
> Skype: lchristina26
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wxIXENaY2CYUgF8u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSho0AACgkQN1Ujt2V2gBxykgCfSFJRYWputyr5ipQb94l9y0RX
amsAn2Oq6itaZo1d4z0+WGB3yQsjKJoi
=gnHm
-----END PGP SIGNATURE-----

--wxIXENaY2CYUgF8u--
