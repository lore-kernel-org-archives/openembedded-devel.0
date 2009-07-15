Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1MR2gm-0005AA-8a
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 13:30:20 +0200
Received: (qmail invoked by alias); 15 Jul 2009 11:16:53 -0000
Received: from p5DDC6558.dip.t-dialin.net (EHLO entw2.localnet) [93.220.101.88]
	by mail.gmx.net (mp065) with SMTP; 15 Jul 2009 13:16:53 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/r+kMWiErrslbZQTPLZocKXmow7L2oOg5r2YVnv0
	btatEITK0GqaYJ
From: Robert Schuster <thebohemian@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 13:16:32 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.28-13-generic; KDE/4.2.4; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200907151316.33659.thebohemian@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71,0.71
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: remove guile-native 1.8.2, switch to 1.8.6
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
X-List-Received-Date: Wed, 15 Jul 2009 11:30:22 -0000
X-Groupsio-MsgNum: 11946
Content-Type: multipart/signed; boundary="nextPart1323167.n3Mc0nKLHF";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1323167.n3Mc0nKLHF
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
guile-native 1.8.2 fails for me with distribution 'openmoko'. I get the sam=
e=20
error as this one: http://tinderbox.openembedded.net/packages/96906/

guile-native 1.8.6 builds fine though. anyone unhappy about dumping 1.8.2 ?

Regards
Robert

--nextPart1323167.n3Mc0nKLHF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpdupEACgkQG9cfwmwwEtrgwACeL0v3bHsH+5Kb7HJ6mPkU8Cjx
1n4AnjR4fgi3lKq48HTrGleOX9Fl4kKz
=z4FW
-----END PGP SIGNATURE-----

--nextPart1323167.n3Mc0nKLHF--
