Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5501560D5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:36:06 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so2999990eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dSCHYsaUcLA0ZzkXHtGZMosoyYpLwD4kLZbxshf8XLo=;
	b=xhr8ja5+xs6aund2zj+TBK0NcD/GmL6gFKH3Kri6FIg3P0aMX+A7llyE1rltnhbY2A
	xr+ObK3ujKpTiXyYGHFxbKSt0uYb+7ypLHV3T3WDYh2/oRgC1pTr/YeklEXQwWQNRLI6
	XrfXeoAjyRNLf5e3OLAzTOskM5ZA69aj12rTIK9cl+oQyuoIDH5Cv2JGQJbci5whmVwH
	TGq1WWLjjuEptV0Hp/OtGtHsEVkaNYZywqJ8Iwpkf+XqW5LqTplkISB1LYpUaequoNqZ
	t72YcrI9ivKYP7RVdxHfDVc0X1yoNm8ezPYWNGf1/aaYZrRBFbDA6tn0fiHxc1aaMYUT
	GZyA==
X-Received: by 10.15.22.137 with SMTP id f9mr15090803eeu.30.1387301766867;
	Tue, 17 Dec 2013 09:36:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm54939142eeo.17.2013.12.17.09.36.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 09:36:05 -0800 (PST)
Date: Tue, 17 Dec 2013 18:36:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131217173636.GI3706@jama>
References: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
	<CAF+NyK5patvnud=V=DUC28y4b8BKEXL1vc67brY8FNir7T5d_g@mail.gmail.com>
	<2191053.tE6l0jqt1n@helios>
MIME-Version: 1.0
In-Reply-To: <2191053.tE6l0jqt1n@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-perl][PATCH V2] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Tue, 17 Dec 2013 17:36:07 -0000
X-Groupsio-MsgNum: 47486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XigHxYirkHk2Kxsx"
Content-Disposition: inline

--XigHxYirkHk2Kxsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2013 at 04:29:04PM +0000, Paul Eggleton wrote:
>=20
> Hongxu, could you please look at this and the other outstanding meta-perl=
=20
> patch?
>=20
> http://patchwork.openembedded.org/project/oe/list/?q=3Dmeta-perl&archive=
=3Dboth

This is even better link:
http://patchwork.openembedded.org/bundle/jama/meta-perl/?archive=3Dboth

and also
http://patchwork.openembedded.org/bundle/jama/meta-filesystems/?archive=3Db=
oth

>=20
> Thanks,
> Paul
>=20
> On Tuesday 17 December 2013 16:34:38 patrick patat wrote:
> > ping
> >=20
> > On Wed, Dec 4, 2013 at 3:59 PM, Patrick Patat=20
> <patrick.patat@innotis.org>wrote:
> > > This recipe build cpan module Crypt-OpenSSL-RSA
> > >=20
> > > Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
> > > ---
> > >=20
> > >  .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   24
> > >=20
> > > ++++++++++++++++++++
> > >=20
> > >  1 file changed, 24 insertions(+)
> > >  create mode 100644 meta-perl/recipes-perl/libcrypt/
> > >=20
> > > libcrypt-openssl-rsa-perl_0.28.bb
> > >=20
> > > diff --git a/meta-perl/recipes-perl/libcrypt/
> > > libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/
> > > libcrypt-openssl-rsa-perl_0.28.bb
> > > new file mode 100644
> > > index 0000000..f0c610f
> > > --- /dev/null
> > > +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.=
bb
> > > @@ -0,0 +1,24 @@
> > > +SUMMARY =3D "Crypt Openssl RSA cpan module"
> > > +SECTION =3D "libs"
> > > +LICENSE =3D "Artistic-1.0 | GPL-1.0+"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D385c55653886acac3821999a3=
ccd17b3"
> > > +
> > > +SRC_URI =3D "
> > > http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.t=
ar.gz
> > > "
> > > +
> > > +SRC_URI[md5sum] =3D "86217a5036fc63779c30420b5fd84129"
> > > +SRC_URI[sha256sum] =3D
> > > "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
> > > +
> > > +DEPENDS +=3D "openssl"
> > > +
> > > +RDEPENDS_${PN}=3D"libcrypt-openssl-random-perl"
> > > +
> > > +EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING=
_LIBDIR}
> > > -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
> > > +
> > > +S =3D "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> > > +
> > > +inherit cpan
> > > +
> > > +do_compile() {
> > > +    export OTHERLDFLAGS=3D'-Wl,-rpath'
> > > +    cpan_do_compile
> > > +}
> > > --
> > > 1.7.10.4
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XigHxYirkHk2Kxsx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKwi6QACgkQN1Ujt2V2gByn6gCgkuAinh39DZaBbHkp6c5QqpwU
AYcAoLQqMueaeYiFfg9rvbANSVQ2GLdK
=4czX
-----END PGP SIGNATURE-----

--XigHxYirkHk2Kxsx--
