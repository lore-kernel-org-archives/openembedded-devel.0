Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JO01d-0005QU-8D
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 01:26:29 +0100
Received: (qmail invoked by alias); 10 Feb 2008 00:26:41 -0000
Received: from e178097129.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.97.129]
	by mail.gmx.net (mp056) with SMTP; 10 Feb 2008 01:26:41 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/1Uc9GVID1YQMD23zUon2nRv19h2CK1PsAtx8nAy
	zLfUpQEvm0UQVQ
Message-ID: <47AE44BC.7000801@gmx.net>
Date: Sun, 10 Feb 2008 01:26:36 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JNg11-0007uM-FU@linuxtogo.org>
	<20080209131935.795df89c@widy.localdomain>
In-Reply-To: <20080209131935.795df89c@widy.localdomain>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev rxtx: New recipe.
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
X-List-Received-Date: Sun, 10 Feb 2008 00:26:29 -0000
X-Groupsio-MsgNum: 4097
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig4B095C3020DCA075BB9B6117"

--------------enig4B095C3020DCA075BB9B6117
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Paul Sokolovsky schrieb:
>> +MAINTAINER =3D "Robert Schuster, tarent GmbH Bonn <robert.schuster@ta=
rent.de>"=20
>=20
> MAINTAINER field is deprecated in recipes. It's a distro setting
> meaning an entity who is responsible for binary packages shipped to
> users. To note maintainreship of recipe, add it to your entry in
> MAINTAINERS file at top-level OE dir.
Fixed (and this and other recipes).

Thanks for the pointer.

Regards
Robert



--------------enig4B095C3020DCA075BB9B6117
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHrkTAG9cfwmwwEtoRCBWEAJ4upyjkB5EkqXdcmC5W7MUGs05OSQCeM2j2
D22vKJIrxtlf9l8jPff0YZY=
=4fln
-----END PGP SIGNATURE-----

--------------enig4B095C3020DCA075BB9B6117--
