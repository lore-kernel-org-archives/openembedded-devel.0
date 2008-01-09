Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JCbUR-0006A7-7T
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2008 15:01:08 +0100
Received: (qmail invoked by alias); 09 Jan 2008 13:53:59 -0000
Received: from e178108047.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.108.47]
	by mail.gmx.net (mp001) with SMTP; 09 Jan 2008 14:53:59 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+4yw95gv+4x+RHCe2qlbKVIup2VJq65svtlzut6X
	LbgTXWtli23T4T
Message-ID: <4784D1F2.6080102@gmx.net>
Date: Wed, 09 Jan 2008 14:53:54 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: java-native merge
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
X-List-Received-Date: Wed, 09 Jan 2008 14:01:12 -0000
X-Groupsio-MsgNum: 3829
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig94A8791D481CD0DA3BD59788"

--------------enig94A8791D481CD0DA3BD59788
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I have finally pushed my patches for adding virtual/java-native and
virtual/javac-native (properly done) into the tree. Since existing
recipes used jikes-native and ecj-native and I would like to remove
those (at least ecj-native) they need some reworking. To track the
status of this work (or help me :) ) have a look at PR 3655[0].

Regards
Robert

[0] - http://bugs.openembedded.org/show_bug.cgi?id=3D3655


--------------enig94A8791D481CD0DA3BD59788
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD4DBQFHhNH2G9cfwmwwEtoRCP9MAJ9tHpNKg/eBBDdlGy9j2ygX51jFkwCYws/J
fKzY81cMfDi6qjA3nUNPzQ==
=lL0A
-----END PGP SIGNATURE-----

--------------enig94A8791D481CD0DA3BD59788--
