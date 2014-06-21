Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 706D16FFA8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 07:47:35 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so4630601wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 00:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TjldFZXElne9+JXEPeDk4sJSqn2/br40GQs6rZ+4j7c=;
	b=Z5siP5a3gwxnvj67PMg9wCg2pIpolsi7OKHgOdvI9/vZJ5nxi+LN4VXQuKMnLgiPK8
	7JfvmRhxFrI566S2QdwH6Ga5iSNXcbyRNoCBHYwMTCBIV5EsvSWOlFr9j4U8LFt0nmOG
	KAH5wD7QhkcuseXaAbVx2wbGMjr+3k+oNjN5nEj/GKr7t1rg7pHmhW3veY9cPYdF0mvk
	7T2qW77d9fJPRTihV/0V2gCxq01Sy2YUyNLar/CdHfLKL9CH97tO6oSGOIXODBsxRm0x
	/15D7VPmv+axL/QfAxuEo9RETVIYYzbzkKnvJ7V2UgLjJtzschfyq9h8PIChWfT4xSJO
	gK9g==
X-Received: by 10.181.12.102 with SMTP id ep6mr9803542wid.0.1403336854592;
	Sat, 21 Jun 2014 00:47:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s14sm4809746wij.1.2014.06.21.00.47.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 00:47:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 09:47:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140621074733.GD2117@jama>
References: <CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Sat, 21 Jun 2014 07:47:43 -0000
X-Groupsio-MsgNum: 50490
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qKojvbh47KHQqxue"
Content-Disposition: inline

--qKojvbh47KHQqxue
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 11:35:34PM -0400, Kevyn-Alexandre Par=E9 wrote:
> On Fri, Jun 20, 2014 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jun 20, 2014 at 08:22:39PM -0400, Kevyn-Alexandre Par=E9 wrote:
> >> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=E9 wro=
te:
> >> >> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL make=
 my
> >> >> build fail with:
> >> >> ERROR: qtwebkit not found in the base feeds
> >> >> LOG: http://pastebin.com/fx2Zi9vW
> >> >> Any clue what I'm doing wrong?
> >> >
> >> > Check which packages (if any) were created by qtwebkit recipe, if any
> >> > then read log.do_configure for possible clues.
> >> >
> >>
> >> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
> >> pkgdata these only to have ".packaged"
> >> http://pastebin.com/0ugj2NVF
> >>
> >> log.do_configure:
> >> http://pastebin.com/cXWdDXmy
> >
> > The WebKit build was disabled for the following reasons:
> >     * ICU is required. To build QtWebKit with Qt 5 you need to build Qt
> >      5 with libICU support. Check for ICU support being mentioned in
> >      qtbase/config.summary.
> >
>=20
> Yes you told me that in previous email I when to
> layers.openembedded.org to check
>=20
> icu  53.1 International Component for Unicode libraries   openembedded-co=
re
>=20
> I add it in PACKAGECONFIG_append_pn-qtbase and IMAGE_INSTALL I thought
> it will be enough?
>=20
> Obviously, I'm still missing somethink
>=20
> qtbase/config.summary? you mean qtbase.inc?

I've just pasted it for you from the log.do_configure you sent me,
please _read_ it.

Check config.summary in qtbase WORKDIR (where you built qtbase to be
sure it was enabled) and check with bitbake -e that it's really in your
PACKAGECONFIG for qtbase.

> I see icu only mention in
>=20
> poky/meta-qt5$ grep -Ri ICU *
> COPYING.MIT:FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
> NO EVENT SHALL THE
> licenses/DIGIA-TPLA-2.4:merchantability, fitness for a particular
> purpose, title and
> licenses/DIGIA-TPLA-2.4:merchantability, fitness for a particular
> purpose, title and
> recipes-qt/qt5/qtwebkit.inc:DEPENDS +=3D "qtbase qtdeclarative icu
> ruby-native sqlite3 glib-2.0 libxslt"
> recipes-qt/qt5/qtbase.inc:# be aware that you need to add icu to build
> qtwebkit, default
> recipes-qt/qt5/qtbase.inc:PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"
> recipes-qt/qt5/qtbase-native.inc:    -no-icu \
>=20
> My qtbase log.do_configure shows that it have been enable:
> http://pastebin.com/g7Lh5cPU
>=20
> >> What's interesting or maybe not is that dgb and dev have empty rpm
> >> created and not the others?
> >> log.do_package_write_rpm
> >> http://pastebin.com/Cft9Uh3J
> >
> > -dbg and -dev are configured to create empty package
> > ALLOW_EMPTY_<pkgname>
> >
>=20
> Aa, I'm only seeing it for these:
>=20
> poky/meta-qt5$ grep -R ALLOW_EMPTY *
> recipes-qt/qt5/qtimageformats.inc:ALLOW_EMPTY_${PN} =3D "1"
> recipes-qt/qt5/qtbase.inc:ALLOW_EMPTY_${PN}-fonts =3D "1"

meta/conf/bitbake.conf:ALLOW_EMPTY_${PN}-dev =3D "1"
meta/conf/bitbake.conf:ALLOW_EMPTY_${PN}-dbg =3D "1"
meta/conf/documentation.conf:ALLOW_EMPTY[doc] =3D "Specifies if an output
package should still be produced if it is empty."

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qKojvbh47KHQqxue
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOlOJUACgkQN1Ujt2V2gBw3JgCdFNEXbpoBJAka4Klx8ibMwIXw
6dUAoJmW9JYO0fZTY2oWGq6Gw1tAy542
=d3J0
-----END PGP SIGNATURE-----

--qKojvbh47KHQqxue--
