Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IoUuR-0006pT-11
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Nov 2007 03:08:21 +0100
Received: (qmail invoked by alias); 04 Nov 2007 02:07:46 -0000
Received: from e178125207.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.125.207]
	by mail.gmx.net (mp049) with SMTP; 04 Nov 2007 03:07:46 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18M0XkQeS0MYSqPA7Aa/+T7lQIz1pPrwsiAoTOJcr
	jL9iomJuCqqOVv
Message-ID: <472D296B.5020506@gmx.net>
Date: Sun, 04 Nov 2007 03:07:39 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: debian package names with deb packaging
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
X-List-Received-Date: Sun, 04 Nov 2007 02:08:22 -0000
X-Groupsio-MsgNum: 3279
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig28F8492DFB9DE686C466BFE8"

--------------enig28F8492DFB9DE686C466BFE8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
when I build a recipe whose package needs gtk+ at runtime I would expect
that the depends line in the control file says libgtk2.0-0 when using
the debian.bbclass (as well as package_deb.bbclass). Instead the line
contains an entry saying "gtk+ (>=3D some version)".

Is this a known issue? File a bug? More info needed?

Regards
Robert


--------------enig28F8492DFB9DE686C466BFE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHLSlvG9cfwmwwEtoRCF++AJ4wzScsI7x5AWV7pURmcvT/urvAVwCdGQZD
NwTe3Ds5KfrgVtoYpTh+FOA=
=T2jP
-----END PGP SIGNATURE-----

--------------enig28F8492DFB9DE686C466BFE8--
