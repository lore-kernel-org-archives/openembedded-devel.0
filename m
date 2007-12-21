Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5W4D-0007Ez-1Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 01:48:45 +0100
Received: (qmail invoked by alias); 21 Dec 2007 00:43:33 -0000
Received: from e178116109.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.116.109]
	by mail.gmx.net (mp038) with SMTP; 21 Dec 2007 01:43:33 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+LlK5EWLWLOK5Oo+zpH+CH+ECAI6heB5PQGB85Px
	qvmcFqO2N55ALt
Message-ID: <476B0C30.4030905@gmx.net>
Date: Fri, 21 Dec 2007 01:43:28 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1J5L4z-0004um-WD@linuxtogo.org>
	<200712201540.11149.openembedded@haerwu.biz>
In-Reply-To: <200712201540.11149.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2007 00:48:45 -0000
X-Groupsio-MsgNum: 3718
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig98ACB9A0CECF2D0226123583"

--------------enig98ACB9A0CECF2D0226123583
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hi!

Marcin Juszkiewicz schrieb:
> Dnia czwartek, 20 grudnia 2007, pfalcon commit napisa=B3:
>=20
>> distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
>> * Only package building is supported (not images).
>> * Uses SDK tarballs from OpenWRT projects.
>> * The distro itself is fully target-agnostic, you should just install
>> correct SDK tarball and pass correct TARGET_ARCH (using environment vs=

>> local.conf is highly recommended).
>=20
> MACHINE=3Dwrt54 + DISTRO=3Dwrt54oe builds toolchain which builds packag=
es=20
> usable under OpenWRT. At least it worked like that when I tested it ove=
r=20
> year ago.
>=20
Would be cool to have OE to build packages for OpenWrt!

Which kind of OpenWRT distribution does this support? WhiteRussian,
Kamikaze or even both?

Regards
Robert


--------------enig98ACB9A0CECF2D0226123583
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHawwzG9cfwmwwEtoRCI/WAKCGJJAA5upCQqNB/yRTxa+uF6Vj3ACfQb8j
EY+DonwQ49xJPAKyFdvT7lA=
=rt+l
-----END PGP SIGNATURE-----

--------------enig98ACB9A0CECF2D0226123583--
