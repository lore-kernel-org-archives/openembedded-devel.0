Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1ImzlX-0002q3-TG
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 23:40:55 +0100
Received: (qmail invoked by alias); 30 Oct 2007 22:40:48 -0000
Received: from e178080251.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.80.251]
	by mail.gmx.net (mp028) with SMTP; 30 Oct 2007 23:40:48 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+toMIgj+utfKmSaSvx9nws1V43ohFBDgKxhgNbfg
	It5WSKm8qLOiA4
Message-ID: <4727B2EC.1000309@gmx.net>
Date: Tue, 30 Oct 2007 23:40:44 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: enforce armel for packages
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
X-List-Received-Date: Tue, 30 Oct 2007 22:40:56 -0000
X-Groupsio-MsgNum: 3252
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9CCCCA1D87C6AB2025B1A2CA"

--------------enig9CCCCA1D87C6AB2025B1A2CA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
on Debian-based distros ARM EABI is specified as architecture 'armel'.

How can I instruct OE to produce packages that emit 'armel' as their
architecture?

Regards
Robert


--------------enig9CCCCA1D87C6AB2025B1A2CA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHJ7LvG9cfwmwwEtoRCO+xAJ9vOLOZFlTklLOl/7rxzzQ5HdP2PwCeIUAy
V9MhkNJ93fCiMuzwh774nZs=
=bBv/
-----END PGP SIGNATURE-----

--------------enig9CCCCA1D87C6AB2025B1A2CA--
