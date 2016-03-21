Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0790D6212F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:55:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x188so20634099wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n7ZCBq4BgOY55UGPhSGZ5vAuOP6hnpqzXabcCO8ZwJQ=;
	b=G303P6nhTHUT2630YPgIqUFZrVNGDoTISpiGrIqKpYW4fX+KZ99DxSDqDQPaCegpON
	DpHQPIqWdiM/f+tAMbRGKvT6EUe/E3kVfOdz+uw+O8C3E9+l/EOUI7ZN30hMfuuCllMH
	XvIJ6JEfDQ17S8mEUxG9K4ljVhkLKq6B8bYUhZCD0CGmebT+KMjoMP3tzInB0Iya3TOw
	lQ+zODGpwfmGaTP61QppFrDLgKjkWC6cPq7FQU83yqlDzTOCXen8kFQZ6NnntG9x19om
	LJZ3iQ1JZHPusZ9X/z77n69rt+Xr2DpTTgT5j7GBghQU8kw+zSzBdmXOrGhlS/RyF4mE
	EXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n7ZCBq4BgOY55UGPhSGZ5vAuOP6hnpqzXabcCO8ZwJQ=;
	b=JoFhjri3edchLtb5zq4SZ4IA/2IiEcpRT83vSQr6YfAe6bVJ0I0JFUvDjdGKUrByYb
	ISXq43jtl9xrab6N4Bq68TcMxCdO6PgSfTBolGOxx0tFOPiXO0LYnFgePgsWRAEfUhLU
	39ZMBjC1o5ipoUWhexC06JNZ652EU0J9485/nZPIesioOtVTXRIWUvMOEUNu9YMQvTr4
	fvOUois1YtXJ1iiHZBo2o9dvIH5musZzuFyNmH7rXvd7fHRQPj5npUk5tWbYN/RNbjy2
	b8Xt5LNdw7QAVCZMD+kcJ3Cl/aiZxKF4CaG3dLxC+gXvtWo0otfrN/4ZvZBiOgyAxu9U
	OMtQ==
X-Gm-Message-State: AD7BkJJHJewLgKJytiOP2pp0f3VMLT5BlAFBQTxful96zGl8QWM4DYAIASbCRDrM7tZxUA==
X-Received: by 10.194.242.202 with SMTP id ws10mr29320790wjc.3.1458554135977; 
	Mon, 21 Mar 2016 02:55:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j18sm11686091wmd.2.2016.03.21.02.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 02:55:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 10:59:52 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160321095952.GB2562@jama>
References: <1458313594-11011-1-git-send-email-adrian.ratiu@ni.com>
	<20160318160431.GC2555@jama>
	<20160321110104.0d6b67d0@adi-pc-linux.emea.corp.natinst.com>
	<20160321095727.GA2562@jama>
MIME-Version: 1.0
In-Reply-To: <20160321095727.GA2562@jama>
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
X-List-Received-Date: Mon, 21 Mar 2016 09:55:40 -0000
X-Groupsio-MsgNum: 60587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 10:57:27AM +0100, Martin Jansa wrote:
> On Mon, Mar 21, 2016 at 11:01:04AM +0200, Ioan-Adrian Ratiu wrote:
> > On Fri, 18 Mar 2016 17:04:31 +0100
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> > > On Fri, Mar 18, 2016 at 05:06:34PM +0200, Ioan-Adrian Ratiu wrote:
> > > > PT Sans is an open source licensed font released in 2010 by ParaTyp=
e.
> > > > The ParaTypeFFL-1.3 license file has been submitted to OE-core.
> > > >=20
> > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > ---
> > > >  .../recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb  | 39 ++++++++++=
++++++++++++
> > > >  1 file changed, 39 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_=
1.1.bb
> > > >=20
> > > > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> > > > new file mode 100644
> > > > index 0000000..dcfa080
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> > > > @@ -0,0 +1,39 @@
> > > > +SUMMARY =3D "PT Sans Fonts"
> > > > +DESCRIPTION =3D "The PT Sans TTF font set"
> > > > +HOMEPAGE =3D "http://www.paratype.com/public/"
> > > > +
> > > > +SECTION =3D "x11/fonts"
> > > > +
> > > > +LICENSE =3D "ParaTypeFFL-1.3"
> > > > +LIC_FILES_CHKSUM =3D "file://../PT%20Free%20Font%20License_eng.txt=
;md5=3Dd720f3a281ed81c3f4cfc465e11b1d0d"
> > > > +
> > > > +inherit fontcache =20
> > >=20
> > > Still missing layer.conf additions.
> >=20
> > I am not sure I understand what are these layer.conf additions.
> > Do I need to add the recipe to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS? (i doub=
t it since I'm not using ttf.inc)
>=20
> Yes, fontconfig-utils dependency is added by fontcache.bbclass which
> you're using.

Ahh now I see that you've dropped allarch inherit in v2.
So it will work without SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

But you can still "optimise" it by returning allarch and adding
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS

> > > Use 4 spaces for indentation.
> > >=20
> > > > +# Downloading from fedora because upstream doesn't version its zip=
 file
> > > > +# and causes hash build failures
> > > > +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-s=
ans-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
> > > > +
> > > > +SRC_URI[md5sum] =3D "c3f5a0e20a75cf628387510a720924a7"
> > > > +SRC_URI[sha256sum] =3D "0164f824e03c32c99e8a225853ec168893a04a09ad=
e132e93a674e85ae033b2e"
> > > > +
> > > > +do_install () {
> > > > +	install -d ${D}${datadir}/fonts/X11/TTF/
> > > > +	cd ..
> > > > +	for i in *.ttf; do
> > > > +		install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
> > > > +	done
> > > > +}
> > > > +
> > > > +FILES_${PN} +=3D "${datadir}"
> > > > +
> > > > +pkg_postinst_${PN} () {
> > > > +        set -x
> > > > +        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
> > > > +                mkfontdir $fontdir
> > > > +                mkfontscale $fontdir
> > > > +        done
> > > > +        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
> > > > +                mkfontdir $fontdir
> > > > +                mkfontscale $fontdir
> > > > +        done
> > > > +}
> > > > --=20
> > > > 2.7.3
> > > >  =20
> > >=20
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbvxhcACgkQN1Ujt2V2gBxRRACePXxXNZkn7MgHmyVLw74ranwg
XWIAoKkx8yiGy0S6vsNwtw4HDdEMeGwv
=u/xh
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
