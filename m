Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSnu9-0006EQ-Na
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 09:02:53 +0200
Received: (qmail invoked by alias); 12 Aug 2008 07:02:21 -0000
Received: from e178072149.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.72.149]
	by mail.gmx.net (mp005) with SMTP; 12 Aug 2008 09:02:21 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19PCu1pQMVPAsluxUWhM/StvVUUCdnAArliJP25u4
	H8dCrQ2F4ILex7
Message-ID: <48A135E2.2090606@gmx.net>
Date: Tue, 12 Aug 2008 09:04:02 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.75
Subject: RFC: avr32 kernel - make ext2/3 builtin for mmc/sd boot
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
X-List-Received-Date: Tue, 12 Aug 2008 07:02:54 -0000
X-Groupsio-MsgNum: 5724
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig8C9380B127EE9BE870398EAA"

--------------enig8C9380B127EE9BE870398EAA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
in order to boot the ngw100 from mmc/sd it needs to have ext2/3 support
builtin instead of having it as a module.

I'd like to modify the defconfig in this regard. Is everyone OK with
that change?

Do we want ext2, ext3 or both?

Regards
Robert


--------------enig8C9380B127EE9BE870398EAA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkihNeYACgkQG9cfwmwwEtpgWwCeLXFrLnMVLoCzrsbGs46MIrhw
RkQAoJMmm2zC0seOp2NXllFt/lfFPG3j
=2gvZ
-----END PGP SIGNATURE-----

--------------enig8C9380B127EE9BE870398EAA--
