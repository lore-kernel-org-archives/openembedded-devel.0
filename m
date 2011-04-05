Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q77P6-0002aP-AO
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 16:38:48 +0200
Received: by bwz5 with SMTP id 5so358905bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7FAQMXNAYh8hShAuY2ppOVjmhJYCkmGvebX1bLA32z8=;
	b=PKFZMUSsK13d1DA60TkTzRLFz/uOOGiAwZ/T8fS9tPK3Ej9xd4MeF90AhAPULHYFvs
	FE150gHj8tldqSEpZgZLt1+Y+/CrtfitLdK/QtV50TorYTkBvjV8y//w3ojCwNpW8+HD
	RYXk83oyeeplrV3TB16zUIznuM6+FVJr7qoTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HWSZxB23VEV4WXcsX9IqG4/4CPu52/vL9uAnn0+duLvZY6J39B3WMXwNrdVdnZ3EKX
	YAsfl/PfgEgS5fZWBOXFkUOLtYszO/j2TcuNplUuMImpGlBWDj3HaAkkceQErpfIlu1J
	5fr/B2hhvY19jll7g6dO6ovsEAnjGalQwygPY=
Received: by 10.204.154.194 with SMTP id p2mr7325352bkw.58.1302014202629;
	Tue, 05 Apr 2011 07:36:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3799128bkm.6.2011.04.05.07.36.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 07:36:41 -0700 (PDT)
Date: Tue, 5 Apr 2011 16:36:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110405143634.GF30816@jama.jama.net>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
	<20110405143320.GE30816@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110405143320.GE30816@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 14:38:48 -0000
X-Groupsio-MsgNum: 30938
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline

--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2011 at 04:33:20PM +0200, Martin Jansa wrote:
> On Mon, Apr 04, 2011 at 09:31:20PM -0400, Bob Foerster wrote:
> > Signed-off-by: Bob Foerster <robert@erafx.com>
> > ---
> >  ...code-native_2011d.bb =3D> tzcode-native_2011e.bb} |   11 ++++++-----
> >  1 files changed, 6 insertions(+), 5 deletions(-)
> >  rename recipes/tzcode/{tzcode-native_2011d.bb =3D> tzcode-native_2011e=
=2Ebb} (51%)
>=20
> Hi,
>=20
> Can you please add LICENSE and LIC_FILES_CHKSUM fields? The same for tzda=
ta.
>=20
> Something like this:
> OE nokia900@shr ~/shr-core $ grep LIC
> openembedded-core/meta/recipes-extended/tzdata/tzdata_2010o.bb
> LICENSE =3D "PD"
> LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D3;md5=3D06468c0=
e84ef4d4c97045a4a29b08234"
> OE nokia900@shr ~/shr-core $ grep LIC
> openembedded-core/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
> LICENSE =3D "Public Domain"
> LIC_FILES_CHKSUM =3D "file://${WORKDIR}/README;md5=3D3ae8198f82258417ce29=
066d3b034035"

or a bit newer tzcode :)

OE nokia900@shr ~/shr-core $ grep LIC meta-shr/recipes-extended/tzcode/tzco=
de-native_2011d.bb
LICENSE =3D "PD"
LIC_FILES_CHKSUM =3D "file://README;md5=3D3ae8198f82258417ce29066d3b034035"

>=20
> Thanks,
>=20
> > diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/tzc=
ode-native_2011e.bb
> > similarity index 51%
> > rename from recipes/tzcode/tzcode-native_2011d.bb
> > rename to recipes/tzcode/tzcode-native_2011e.bb
> > index 1cc7757..39b172b 100644
> > --- a/recipes/tzcode/tzcode-native_2011d.bb
> > +++ b/recipes/tzcode/tzcode-native_2011e.bb
> > @@ -6,11 +6,12 @@ require tzcode-native.inc
> >  # Also, tzdata (and it is needed to build tzcode) version can differ f=
rom
> >  # tzcode version, thus this variable
> > =20
> > -TZDATA_PV =3D "2011d"
> > +TZDATA_PV =3D "2011e"
> > =20
> >  PR =3D "${INC_PR}.0"
> > =20
> > -SRC_URI[tzcode-2011d.md5sum] =3D "95095242ee368e6a7e107f154590ac11"
> > -SRC_URI[tzcode-2011d.sha256sum] =3D "68f2c07471c5390199c09fe9fee6a22f8=
a4dac24713af88b92da17b33ad98cc7"
> > -SRC_URI[tzdata-2011d.md5sum] =3D "03c5793502b7c41985edd73146bf7e36"
> > -SRC_URI[tzdata-2011d.sha256sum] =3D "415a54774094e8dcdc9ba141fafbee4b3=
b2f2140a5b8cf012eea4b37fb9a23bd"
> > +SRC_URI[tzcode-2011e.md5sum] =3D "fbfc05dbf9ebcfe7c4bba18549870173"
> > +SRC_URI[tzcode-2011e.sha256sum] =3D "8fb00f8763aa51d83d6f3190d144124bb=
7176ca829fc08823d6205297bf0426b"
> > +SRC_URI[tzdata-2011e.md5sum] =3D "044a07072300a0ee72b046e5a9a4ec90"
> > +SRC_URI[tzdata-2011e.sha256sum] =3D "44fef01de4589a4979eb6b5fdbbfd21a3=
b135852af1ecbfb9e0368ae47392c79"
> > +
> > --=20
> > 1.7.0.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2bKPIACgkQN1Ujt2V2gBx7xwCeLemprEcDPU5m9cMX5tHOGMs0
EKYAoINiGTn4iPdPlGzOyTNqkkFB7cO3
=mNw9
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
