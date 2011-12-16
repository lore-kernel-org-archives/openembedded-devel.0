Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbVwL-00064q-KL
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 12:27:02 +0100
Received: from mail167-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 11:04:54 +0000
Received: from mail167-ch1 (localhost [127.0.0.1])	by
	mail167-ch1-R.bigfish.com (Postfix) with ESMTP id 7C79A240649	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:05:03 +0000 (UTC)
X-SpamScore: -23
X-BigFish: VS-23(zz154cP9371I936eK542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail167-ch1 (localhost.localdomain [127.0.0.1]) by mail167-ch1
	(MessageSwitch) id 1324033503288850_11036;
	Fri, 16 Dec 2011 11:05:03 +0000 (UTC)
Received: from CH1EHSMHS015.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail167-ch1.bigfish.com (Postfix) with ESMTP id
	41BDB140048	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:05:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS015.bigfish.com
	(10.43.70.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 11:04:52 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.68]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 16 Dec 2011 05:04:52 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH meta-oe v2 6/8] strongswan: add
Thread-Index: AQHMu9aYMxdHRhlPikqHftXjJDn9mJXeq3kA//+ee2A=
Date: Fri, 16 Dec 2011 11:04:51 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A02CFE9@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
	<1324028520-16474-6-git-send-email-b19537@freescale.com>
	<jcf790$99u$2@dough.gmane.org>
In-Reply-To: <jcf790$99u$2@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH meta-oe v2 6/8] strongswan: add
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
X-List-Received-Date: Fri, 16 Dec 2011 11:27:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Koen,

Thanks a lot for the clarification, I am more clear now. :)


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Friday, December 16, 2011 6:42 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH meta-oe v2 6/8] strongswan: add
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-12-11 10:41, b19537@freescale.com schreef:
> > From: Zhenhua Luo <b19537@freescale.com>
> >
> > strongSwan is an OpenSource IPsec implementation for the Linux
> > operating system.
> >
> > Signed-off-by: Zhenhua Luo <b19537@freescale.com> ---
> > .../recipes-support/strongswan/strongswan_4.5.1.bb |   21
> > ++++++++++++++++++++ 1 files changed, 21 insertions(+), 0 deletions(-)
> > create mode 100644
> > meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> >
> > diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> > b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb new file mode
> > 100644 index 0000000..9c5e736 --- /dev/null +++
> > b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb @@ -0,0 +1,21
> > @@ +DESCRIPTION =3D "strongSwan is an OpenSource IPsec implementation
> > for the \ +Linux operating system." +HOMEPAGE =3D "http://www.strongswa=
n.org"
> > +SECTION =3D "console/network" +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =
=3D
> > "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3" + +SRC_URI =3D
> > "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
> > +SRC_URI[md5sum] =3D "81a4a699c4a1a49b74061dfa47b5a033"
> > ++SRC_URI[sha256sum]
> > =3D "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a" =
+
> > +EXTRA_OECONF =3D "--disable-curl --disable-soup --disable-ldap \ +
> > --enable-gmp --disable-mysql --disable-sqlite \ +		--enable-openssl" +
> > +inherit autotools + +DEPENDS =3D "gmp openssl flex-native flex
> > bison-native"
>=20
> Normal DEPENDS go at the top :) Same for the rng-tools recipe. The genera=
l idea
> is that 'recipe' variable go on top and other variables are ordered next =
to the
> tasks they are used in, e.g. RDEPENDS are for do_packages, so they go bel=
ow
> do_install, DEPENDS are for the recipe, so they go on top.
>=20
> > +RRECOMMENDS_${PN} =3D "kernel-module-ipsec" + +FILES_${PN}-dbg +=3D
> > "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7rIGAACgkQMkyGM64RGpHudwCgu3FhI+64lWnp7q6gzK1itDW3
> 2TYAn0lXYwRxN5vKcrErNyF4jZO8adfy
> =3DZmzb
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




