Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E213E73FDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 12:56:24 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1Ys9jV-0000Kl-7H from Joe_MacDonald@mentor.com ;
	Tue, 12 May 2015 05:56:25 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 05:56:24 -0700
Received: by burninator (Postfix, from userid 1000)	id DF457580439; Tue, 12
	May 2015 08:56:29 -0400 (EDT)
Date: Tue, 12 May 2015 08:56:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150512125629.GA5914@mentor.com>
References: <1429778709-4188-1-git-send-email-rongqing.li@windriver.com>
	<5551BB03.1070204@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5551BB03.1070204@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] strongswan: upgrade to 5.3.0
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
X-List-Received-Date: Tue, 12 May 2015 12:56:25 -0000
X-Groupsio-MsgNum: 55467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking] strongswan: upgrade to 5.3.0] On 15.05.1=
2 (Tue 16:34) Rongqing Li wrote:

> ping

I'll get a look at these soon.  I don't know why, but some of your
patches are not being picked up by patchwork.

-J.

>=20
> Thanks
>=20
> -Roy
>=20
> =E5=9C=A8 2015=E5=B9=B404=E6=9C=8823=E6=97=A5 16:45, rongqing.li@windrive=
r.com =E5=86=99=E9=81=93:
> >From: Roy Li <rongqing.li@windriver.com>
> >
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >---
> >  .../strongswan/{strongswan_5.2.1.bb =3D> strongswan_5.3.0.bb}         =
  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-support/strongswan/{strongswan_5.2.1.bb=
 =3D> strongswan_5.3.0.bb} (92%)
> >
> >diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.1=
=2Ebb b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> >similarity index 92%
> >rename from meta-networking/recipes-support/strongswan/strongswan_5.2.1.=
bb
> >rename to meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> >index 6b91319..0b45ab6 100644
> >--- a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> >+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> >@@ -11,8 +11,8 @@ SRC_URI =3D "http://download.strongswan.org/strongswan=
-${PV}.tar.bz2 \
> >          file://fix-funtion-parameter.patch \
> >  "
> >
> >-SRC_URI[md5sum] =3D "dd3717c0aa59ab4591ca1812941ebb82"
> >-SRC_URI[sha256sum] =3D "ea51ab33b5bb39fecaf10668833a9936583b42145948ae9=
da1ab98f74e939215"
> >+SRC_URI[md5sum] =3D "c52d4228231c2025d9c320d0e9990327"
> >+SRC_URI[sha256sum] =3D "824da31a1ff89ac2500d56705e6f9ce06fe5260f9caaeb1=
da35ea13a8691d284"
> >
> >  EXTRA_OECONF =3D "--enable-gmp \
> >          --enable-openssl \
> >
>=20
--=20
-Joe MacDonald.
:wq

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVUfh9AAoJEEn8ffcsOfaWP/MH/206SLmiWAZcuIxWz/7JVOhS
/RNO/McXrkE9mZ9i15PzwBbpjJkNJTKwzBJgstsrmXULn0TF3fI7hnGZ41zV1B93
B8DRlEA9z5MX9d5FVsOGC0uyVoDgY0+0F+4x8+hXxK4p81qyv7JFstwU53OS7/M0
WgShmLe+yrguM0jDjqAVdrKg/qyl5S95Y5rNGwpRdG3Ah1vNXl132Y1XgHUSWg/A
Z59JSxrA1LTSt9QqIJFLgh5TH9aOLum6GJ+mnrYL6IAH6Ri0JpbLxV1smP/iQfEh
PEBbw5jDH84RR6J6+Q0AftgoPdvykTUrGORk5UV3FgVreZ9nhBcWMwmPPlQlm2w=
=mtvc
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
