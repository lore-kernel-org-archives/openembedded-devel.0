Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IwhHM-0002yz-A1
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2007 17:57:52 +0100
Received: (qmail invoked by alias); 26 Nov 2007 16:55:06 -0000
Received: from e178067048.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.67.48]
	by mail.gmx.net (mp035) with SMTP; 26 Nov 2007 17:55:06 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+vUF0z0QyvZNkvdtBh4fWkRX28ube4Ib7xPbUjaP
	14xbAkaptMzYw9
Message-ID: <474AFA66.30509@gmx.net>
Date: Mon, 26 Nov 2007 17:55:02 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: python skills and bug 2412
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
X-List-Received-Date: Mon, 26 Nov 2007 16:57:52 -0000
X-Groupsio-MsgNum: 3440
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigFD1A867C57DB97A6A25955DB"

--------------enigFD1A867C57DB97A6A25955DB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi
Rodigo and me are suffering from bug 2412[0]. We talked a bit about the
issue and I provided an idea on how to fix it. Unfortunately I lack the
python experience to do it. I do not understand how the name conversion
in debian.bbclass is actually done and where I could add code to replace
slashes with hyphens.

Can anyone who has a better understanding of this help us out?

Regards
Robert

[0] - http://bugs.openembedded.org/show_bug.cgi?id=3D2412



--------------enigFD1A867C57DB97A6A25955DB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHSvpoG9cfwmwwEtoRCGydAJ44m70YYXR1w3KTh/1g+mJ77jrTmgCfUeuh
X1GXc5PGzE/IOMfaj0z9Vs4=
=d/JR
-----END PGP SIGNATURE-----

--------------enigFD1A867C57DB97A6A25955DB--
