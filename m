Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF0A6212F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:53:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r129so8782600wmr.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QhaglT/OXDv5ZLlB6ckrSvfGaPyVnkePJ9DcCINX1L0=;
	b=w8OSQS6JDm6U3lg+VF79zX6aB6D3mP+N0W6M9ARTa1wA/+yMC1a+2g7jih85G8AQEX
	zXZQCjrSIq4c7Jqpg4APzSuRaMPMILwmdxqMDz+UwcSDZsVcmS1GLiIML9/PkqoALqUd
	cRUln2nCo7AP9qPhdRweQZfLfwLp/KZxXrvZimol0zgYnWe7pHi4mFG+o7kx+9GIHed5
	NYXwnhDEMdxqo+DrT2QD7PqS4P3jUw8xl1LMYoQaCaL3E1YZv/N/wKOx/jRYztLHRxjF
	4SCJDbfDx3L+gvjFB4ldTU1eUK97lNCNZqEIJ7y7hRd/N8FR8s7P0A61n0IyiBnArWUD
	kOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QhaglT/OXDv5ZLlB6ckrSvfGaPyVnkePJ9DcCINX1L0=;
	b=PLxQaXJND3Lx3OLeAlTbwJGxObDr4KCungWU+A+pCO7o1ctbStfnldusxtIfdc2mXp
	yKWwSv/duVnTB+L1Y1N2dSj8gO9BkL0jbElLk64Zssce5KX3GBkIptTUyRps2l9qo+PM
	jpmFybFnXqSuZ6XzRWz/9J651bj5HaMu6AXn/LcuAD8Vnw9O3alBwNcQ1HY6eDkW9vbz
	zeMuAnrJvLG+xj97dcOWv6vfkY78Qbv7ip5Tg8jRN/YwgPMpwSVPtsWogvIguvZm0vrr
	wextQmA0NhmNt8mk3ZfpFIzccJzWVpXaDXAPvbpnkfAUPHSAgWhfUEvCFsKMrsrKyqEa
	+mgQ==
X-Gm-Message-State: AD7BkJJmOe4f/ftbYSdsqm0sW0wgrwdO/O8Gqy7uYRq2XsJFsFVfvbPiOYg5sc3oy8E9Lw==
X-Received: by 10.194.185.237 with SMTP id ff13mr32376688wjc.129.1458553991488;
	Mon, 21 Mar 2016 02:53:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w125sm11619498wmw.18.2016.03.21.02.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 02:53:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 10:57:27 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160321095727.GA2562@jama>
References: <1458313594-11011-1-git-send-email-adrian.ratiu@ni.com>
	<20160318160431.GC2555@jama>
	<20160321110104.0d6b67d0@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160321110104.0d6b67d0@adi-pc-linux.emea.corp.natinst.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] ttf-pt-sans: add recipe
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
X-List-Received-Date: Mon, 21 Mar 2016 09:53:13 -0000
X-Groupsio-MsgNum: 60586
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 11:01:04AM +0200, Ioan-Adrian Ratiu wrote:
> On Fri, 18 Mar 2016 17:04:31 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Fri, Mar 18, 2016 at 05:06:34PM +0200, Ioan-Adrian Ratiu wrote:
> > > PT Sans is an open source licensed font released in 2010 by ParaType.
> > > The ParaTypeFFL-1.3 license file has been submitted to OE-core.
> > >=20
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  .../recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb  | 39 ++++++++++++=
++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.=
1.bb
> > >=20
> > > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/=
meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> > > new file mode 100644
> > > index 0000000..dcfa080
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> > > @@ -0,0 +1,39 @@
> > > +SUMMARY =3D "PT Sans Fonts"
> > > +DESCRIPTION =3D "The PT Sans TTF font set"
> > > +HOMEPAGE =3D "http://www.paratype.com/public/"
> > > +
> > > +SECTION =3D "x11/fonts"
> > > +
> > > +LICENSE =3D "ParaTypeFFL-1.3"
> > > +LIC_FILES_CHKSUM =3D "file://../PT%20Free%20Font%20License_eng.txt;m=
d5=3Dd720f3a281ed81c3f4cfc465e11b1d0d"
> > > +
> > > +inherit fontcache =20
> >=20
> > Still missing layer.conf additions.
>=20
> I am not sure I understand what are these layer.conf additions.
> Do I need to add the recipe to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS? (i doubt =
it since I'm not using ttf.inc)

Yes, fontconfig-utils dependency is added by fontcache.bbclass which
you're using.

> > Use 4 spaces for indentation.
> >=20
> > > +# Downloading from fedora because upstream doesn't version its zip f=
ile
> > > +# and causes hash build failures
> > > +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-san=
s-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
> > > +
> > > +SRC_URI[md5sum] =3D "c3f5a0e20a75cf628387510a720924a7"
> > > +SRC_URI[sha256sum] =3D "0164f824e03c32c99e8a225853ec168893a04a09ade1=
32e93a674e85ae033b2e"
> > > +
> > > +do_install () {
> > > +	install -d ${D}${datadir}/fonts/X11/TTF/
> > > +	cd ..
> > > +	for i in *.ttf; do
> > > +		install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
> > > +	done
> > > +}
> > > +
> > > +FILES_${PN} +=3D "${datadir}"
> > > +
> > > +pkg_postinst_${PN} () {
> > > +        set -x
> > > +        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
> > > +                mkfontdir $fontdir
> > > +                mkfontscale $fontdir
> > > +        done
> > > +        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
> > > +                mkfontdir $fontdir
> > > +                mkfontscale $fontdir
> > > +        done
> > > +}
> > > --=20
> > > 2.7.3
> > >  =20
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlbvxX4ACgkQN1Ujt2V2gBzIWACfWR0XTDKfCN8aUf//2pzHYf02
TRwAmPsvBFUYyR2/QPlEiN08vgV536w=
=WfxP
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
