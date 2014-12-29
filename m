Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CEFC772523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 18:59:29 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y5fXN-0002ML-M1 from Joe_MacDonald@mentor.com ;
	Mon, 29 Dec 2014 10:59:29 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 10:59:28 -0800
Received: by burninator (Postfix, from userid 1000)	id B59CA5810B3; Mon, 29
	Dec 2014 13:59:21 -0500 (EST)
Date: Mon, 29 Dec 2014 13:59:21 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141229185920.GA4672@mentor.com>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
	<CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
	<20141229185352.GM2465@jama>
MIME-Version: 1.0
In-Reply-To: <20141229185352.GM2465@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 29 Dec 2014 18:59:32 -0000
X-Groupsio-MsgNum: 53511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Martin,

[Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove ver=
sion 3.1.0] On 14.12.29 (Mon 19:53) Martin Jansa wrote:

> On Mon, Dec 29, 2014 at 11:50:30AM -0700, Leah wrote:
> > I was just wondering if this commit was recieved and/or approved?
>=20
> Received and not yet approved, look at master-next branch.

I generally try to send out a message when I merge anything to
master-next so as to let the submitter know it's been merged.  I do seem
to be in the minority, but if possible it would also help me out if you
could send an ack when you merge something for meta-networking into
master so I know I can remove it from my working queue.  That usually
only pops up when I've been offline for a few weeks, but it would really
help with managing the mail queue.

Thanks,
-J.

>=20
> > Thanks,
> >=20
> > Leah
> >=20
> > On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hotmail.com>
> > wrote:
> >=20
> > > Signed-off-by: Leah <lchristina26@hotmail.com>
> > > ---
> > >  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}                   =
 | 7
> > > ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.bb =
=3D>
> > > cyassl_3.3.0.bb} (74%)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0=
=2Ebb
> > > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > similarity index 74%
> > > rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.=
bb
> > > rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > index e3edab6..b6f852d 100644
> > > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > @@ -1,4 +1,4 @@
> > > -SUMMARY =3D "CyaSSL Embedded SSL Library"
> > > +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
> > >  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C an=
d \
> > >                 optimized for embedded and RTOS environments. It can =
be \
> > >                 Up to 20 times smaller than OpenSSL while still suppo=
rting
> > > \
> > > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > >
> > >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> > >
> > > -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > > -SRC_URI[sha256sum] =3D
> > > "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> > > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > > +SRC_URI[sha256sum] =3D
> > > "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
> > >
> > >  inherit autotools
> > > +
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> >=20
> >=20
> > --=20
> >=20
> > Leah Thompson
> > www.wolfssl.com
> > leah@wolfssl.com
> > 406-570-1389
> > Skype: lchristina26
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUoaSAAAoJEEn8ffcsOfaWJSEIAMDYT16eVczGpLAzeKHWJ7FT
CQ7xen/9qQCMJTQXHGSjsirDioqJShpabz5vLNIwXXQTgqDluaQTDBpmVHPn+HZk
WW2v1zKDS0qENMFBsYyldUIPDTg6C8XPmTxdal2frNIbgrud5hXPJGtaFzHjYG05
5s64AkcWIQ2jxQi17MrPqQKnCBUXSjWqyZ3uzfv++6+MNPfOfurksXfqeohvGNQC
/vMpL3tnlrdqqgN2RBSaMoTu4AGY2gj4WM6LACpjkFLkgCmCOiiV2D2ScYgL246I
fKY1QHTyQiGpt8eUGesif9fNT8+2TZnb4Dy0fv9q/jji/sFhq8v1+HsGHL1Zlrw=
=0V6O
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
