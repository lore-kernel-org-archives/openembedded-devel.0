Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswlt-0002R5-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:36:50 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so982923pbc.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Lol+j6hM7kH2v8TvWjJrykplWuDeq+1Ays8s4r9suoI=;
	b=voKEQHzhX5ugZwbk4bOd55/fzGRv/E87599X8N5iBzYnsUGG9k+wtp9lRNgxd6z0HW
	R3EGqp/rWbrBlofk/2Ln623ly8wpXaEl6lctwnFsrOaMnFRV8Jt3TrSM6YYOZ2r+yYMR
	nHaNSrLXnsOGfXcFkL+ttdTSJ8+lVxsiCgcaSyYSzE5OXLLrOSpO11PaCKKMAffw2wDq
	hE1AyPIXs4FEtZFXUENjxns+xIHV+T6foC4uzHfcYH2Pvdga23WQu+eAYvk6Jy/otoU2
	uqoHbu2oluPEnwh30NYiEs9Xqol46fQosXWrl+ZdTrvnxp+SMJ56L78vfmLVSanbpNn8
	m5ng==
X-Received: by 10.68.233.201 with SMTP id ty9mr213716259pbc.14.1357741296398; 
	Wed, 09 Jan 2013 06:21:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ni8sm41702902pbc.70.2013.01.09.06.21.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:21:35 -0800 (PST)
Date: Wed, 9 Jan 2013 15:21:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109142140.GO3722@jama.palm1.palmone.com>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
	<1355510023-17096-3-git-send-email-cliff.brake@gmail.com>
	<20121216184719.GD3448@jama> <20121216193336.GF3448@jama>
MIME-Version: 1.0
In-Reply-To: <20121216193336.GF3448@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH 2/3] libdc1394: add recipe
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
X-List-Received-Date: Wed, 09 Jan 2013 14:36:52 -0000
X-Groupsio-MsgNum: 42598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFMLoheMaWcIEZAi"
Content-Disposition: inline

--UFMLoheMaWcIEZAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 08:33:36PM +0100, Martin Jansa wrote:
> On Sun, Dec 16, 2012 at 07:47:19PM +0100, Martin Jansa wrote:
> > On Fri, Dec 14, 2012 at 01:33:42PM -0500, Cliff Brake wrote:
> > > From: Cliff Brake <cbrake@bec-systems.com>
> > >=20
> > > Initial recipe created by Khem Raj
> > >=20
> > > Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> > > ---
> > >  .../libdc1394/files/install_examples.patch             | 14 ++++++++=
++++++
> > >  .../recipes-multimedia/libdc1394/files/libdc1394.png   |  0
> >=20
> > Is this empty libdc1394.png really needed?
>=20
> Also please set PV to something usefull.

ping :)

> =20
> > Cheers,
> >=20
> > >  meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb  | 18 ++++++++=
++++++++++
> > >  3 files changed, 32 insertions(+)
> > >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/instal=
l_examples.patch
> > >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/libdc1=
394.png
> > >  create mode 100755 meta-oe/recipes-multimedia/libdc1394/libdc1394_gi=
t.bb
> > >=20
> > > diff --git a/meta-oe/recipes-multimedia/libdc1394/files/install_examp=
les.patch b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.pat=
ch
> > > new file mode 100755
> > > index 0000000..89133ad
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.pat=
ch
> > > @@ -0,0 +1,14 @@
> > > +Index: libdc1394/examples/Makefile.am
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.00000000=
0 -0700
> > > ++++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -07=
00
> > > +@@ -36,8 +36,7 @@
> > > + AM_LDFLAGS =3D -framework CoreFoundation -framework Carbon
> > > + endif
> > > +=20
> > > +-noinst_PROGRAMS =3D $(A)
> > > +-bin_PROGRAMS =3D $(B)
> > > ++bin_PROGRAMS =3D $(A) $(B)
> > > +=20
> > > + LDADD =3D ../dc1394/libdc1394.la
> > > +=20
> > > diff --git a/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png=
 b/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png
> > > new file mode 100755
> > > index 0000000..e69de29
> > > diff --git a/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb b/=
meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> > > new file mode 100755
> > > index 0000000..41547d9
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
> > > @@ -0,0 +1,18 @@
> > > +DESCRIPTION =3D "Capture and control API for IIDC compliant cameras"
> > > +HOMEPAGE =3D "http://sourceforge.net/projects/libdc1394/"
> > > +SECTION =3D "libs"
> > > +LICENSE =3D "LGPL-2.0"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc848e78d9a4a5cc69906178e4=
d6fbd64"
> > > +DEPENDS +=3D "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
> > > +SRCREV =3D "fa2b5b5a56e2c306cd3e756e810cceb68ab55b8f"
> > > +
> > > +SRC_URI =3D "git://libdc1394.git.sourceforge.net/gitroot/libdc1394/l=
ibdc1394/;branch=3Dmaster;protocol=3Dgit \
> > > +           file://install_examples.patch \
> > > +           file://${PN}.png \
> > > +          "
> > > +
> > > +S =3D "${WORKDIR}/git/${PN}"
> > > +
> > > +inherit autotools pkgconfig sdl
> > > +
> > > +EXTRA_OECONF +=3D "--disable-doxygen-doc"
> > > --=20
> > > 1.8.0.2
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UFMLoheMaWcIEZAi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtfPQACgkQN1Ujt2V2gBw9OgCffVWWjiHG7nXL+cBnIGMqv9y5
q3QAnRpc2QYkvQZ8l6CnFTUkSl/YKcBn
=haEZ
-----END PGP SIGNATURE-----

--UFMLoheMaWcIEZAi--
