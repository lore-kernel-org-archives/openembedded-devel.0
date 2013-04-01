Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UMjcx-0007uk-VI
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 20:38:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31ILYxX004362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 11:21:34 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 1 Apr 2013 11:21:34 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 3B65B7FCE;
	Mon,  1 Apr 2013 14:20:38 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id BE9D320087; Mon,
	1 Apr 2013 14:21:31 -0400 (EDT)
Date: Mon, 1 Apr 2013 14:21:31 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130401182131.GL10672@windriver.com>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
	<20130401181357.GK10672@windriver.com>
	<23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1
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
X-List-Received-Date: Mon, 01 Apr 2013 18:38:44 -0000
X-Groupsio-MsgNum: 43840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XRwESHC7KXlqFpSs"
Content-Disposition: inline

--XRwESHC7KXlqFpSs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1=
] On 13.04.01 (Mon 20:15) Koen Kooi wrote:

>=20
> Op 1 apr. 2013, om 20:13 heeft Joe MacDonald <Joe.MacDonald@windriver.com=
> het volgende geschreven:
>=20
> > Hey Koen,
> >=20
> > [[oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1=
] On 13.03.29 (Fri 15:25) Koen Kooi wrote:
> >=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> ...y-link-in-sysroot-not-in-host-directories.patch | 39 ++++++++++++++=
++++++++
> >> .../python/python-m2crypto_0.21.1.bb               | 19 +++++++++++
> >> 2 files changed, 58 insertions(+)
> >> create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto/000=
1-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb
> >>=20
> >> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setu=
p.py-link-in-sysroot-not-in-host-directories.patch b/meta-oe/recipes-devtoo=
ls/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directo=
ries.patch
> >> new file mode 100644
> >> index 0000000..bcbdf24
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-li=
nk-in-sysroot-not-in-host-directories.patch
> >> @@ -0,0 +1,39 @@
> >> +From f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 00:00:00 2001
> >> +From: Koen Kooi <koen@dominion.thruhere.net>
> >> +Date: Fri, 29 Mar 2013 15:17:17 +0100
> >> +Subject: [PATCH] setup.py: link in sysroot, not in host directories
> >> +
> >> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> +
> >> +Upstream-status: Unknown
> >=20
> > Does this mean you haven't determined if it should be sent upstream yet,
> > or you did and it's gone off into an apparent black hole of a mailing
> > list somewhere?
>=20
> The former

Okay.  Isn't that normally 'Pending' then?  I can make that tweak in my
merge, but I wanted to confirm I had the right information there first.

-J.

>=20
> >=20
> > -J.
> >=20
> >> +---
> >> + setup.py | 6 +++---
> >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/setup.py b/setup.py
> >> +index e7c49eb..8deaa34 100644
> >> +--- a/setup.py
> >> ++++ b/setup.py
> >> +@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
> >> +             self.openssl =3D 'c:\\pkg'
> >> +         else:
> >> +             self.libraries =3D ['ssl', 'crypto']
> >> +-            self.openssl =3D '/usr'
> >> ++            self.openssl =3D os.environ.get( "STAGING_DIR" )
> >> +       =20
> >> +    =20
> >> +     def finalize_options(self):
> >> +@@ -49,8 +49,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
> >> +=20
> >> +         build_ext.build_ext.finalize_options(self)
> >> +=20
> >> +-        opensslIncludeDir =3D os.path.join(self.openssl, 'include')
> >> +-        opensslLibraryDir =3D os.path.join(self.openssl, 'lib')
> >> ++        opensslIncludeDir =3D os.environ.get( "STAGING_INCDIR" )
> >> ++        opensslLibraryDir =3D os.environ.get( "STAGING_LIBDIR" )
> >> +        =20
> >> +         self.swig_opts =3D ['-I%s' % i for i in self.include_dirs + \
> >> +                           [opensslIncludeDir]]
> >> +--=20
> >> +1.8.1.4
> >> +
> >> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb=
 b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> >> new file mode 100644
> >> index 0000000..9babc04
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> >> @@ -0,0 +1,19 @@
> >> +DESCRIPTION =3D "A Python crypto and SSL toolkit"
> >> +HOMEPAGE =3D "http://chandlerproject.org/bin/view/Projects/MeTooCrypt=
o"
> >> +
> >> +DEPENDS =3D "openssl swig-native"
> >> +
> >> +LICENSE =3D "BSD"
> >> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db0e1f0b7d0ce8a62c18b1287b9=
91800e"
> >> +
> >> +SRC_URI =3D "http://pypi.python.org/packages/source/M/M2Crypto/M2Cryp=
to-${PV}.tar.gz \
> >> +           file://0001-setup.py-link-in-sysroot-not-in-host-directori=
es.patch"
> >> +
> >> +SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
> >> +SRC_URI[sha256sum] =3D "25b94498505c2d800ee465db0cc1aff097b1615adc3ac=
042a1c85ceca264fc0a"
> >> +
> >> +S =3D "${WORKDIR}/M2Crypto-${PV}"
> >> +
> >> +inherit setuptools
> >> +
> >> +BBCLASSEXTEND =3D "native"
> > --=20
> > -Joe MacDonald.
> > :wq
>=20

--=20
-Joe MacDonald.
:wq

--XRwESHC7KXlqFpSs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFZ0CsACgkQPN8S4W6ZZndSJwCfQx3pkSY0vdXDrk1vD0guyox2
MDMAn2b6wdYVD61YNyfynRL7tPNFrMbM
=yLMo
-----END PGP SIGNATURE-----

--XRwESHC7KXlqFpSs--
