Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LmXOn-0006N3-EP
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 19:00:21 +0100
Received: (qmail invoked by alias); 25 Mar 2009 17:58:43 -0000
Received: from g225079201.adsl.alicedsl.de (EHLO [192.168.4.110])
	[92.225.79.201]
	by mail.gmx.net (mp040) with SMTP; 25 Mar 2009 18:58:43 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18HJU18DuEHFRdiw10UulbxVDRoUX0yd6VY8OQ5Lz
	98nh0hDZ5/GJ1p
Message-ID: <49CA71A6.4090501@gmx.net>
Date: Wed, 25 Mar 2009 19:02:14 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49CA28F4.9020001@gmx.net>
	<200903251442.44153.hs4233@mail.mn-solutions.de>
In-Reply-To: <200903251442.44153.hs4233@mail.mn-solutions.de>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
Subject: Re: RFC: rework llvm recipes
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
X-List-Received-Date: Wed, 25 Mar 2009 18:00:21 -0000
X-Groupsio-MsgNum: 8718
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig0FC3245D2B374E4063AA6D26"

--------------enig0FC3245D2B374E4063AA6D26
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi Holger,

Holger Schurig schrieb:
> +1
Good to know. :)
>=20
> Are there any users of LLVM inside OE, e.g. the D-compiler?
No idea.

> Have you already managed to make a cross-compiler llvm-gcc ?  In=20
> the llvm-mailinglist there was a thread about this recently.
I am not that into llvm ... well :)

At the moment I am using it for the Shark port of OpenJDK. That is a
platform independent JIT-compiler based upon LLVM.

Regards
Robert



--------------enig0FC3245D2B374E4063AA6D26
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknKcaoACgkQG9cfwmwwEtrUOQCeM6murSkgr5z40Mlz+HAIiJCk
FDwAn0Ipi9sBjLA44N8f9PI7JKslkO+D
=fDAb
-----END PGP SIGNATURE-----

--------------enig0FC3245D2B374E4063AA6D26--
