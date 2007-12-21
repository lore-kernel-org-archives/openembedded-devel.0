Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5mtO-00085K-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 19:46:42 +0100
Received: (qmail invoked by alias); 21 Dec 2007 18:41:26 -0000
Received: from e178102245.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.102.245]
	by mail.gmx.net (mp011) with SMTP; 21 Dec 2007 19:41:27 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/fLboP4kvfTZxyC7lW5nmMl3Eq1P3QqZwAfo86Kl
	qJYIhSw9Ix7ZhN
Message-ID: <476C08D0.2060305@gmx.net>
Date: Fri, 21 Dec 2007 19:41:20 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: docbook native toolchain
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
X-List-Received-Date: Fri, 21 Dec 2007 18:46:43 -0000
X-Groupsio-MsgNum: 3735
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2E74B16E5C25CF5AA7187A22"

--------------enig2E74B16E5C25CF5AA7187A22
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I came across a package which wanted to use docbook-to-man and fall into
a deep dark hole of broken docbook recipes. I even found a posting from
2004 saying that the recipes are not working.

With the help of the linux from scratch manual, sed and patch I was able
to make the catalog and related tools work out of native staging.

Please test the patch and comment on the bug report:

http://bugs.openembedded.org/show_bug.cgi?id=3D3511

Regards
Robert


--------------enig2E74B16E5C25CF5AA7187A22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHbAjVG9cfwmwwEtoRCE9LAJ9jQTsm+Qf65WldlZpzU98umvLuuwCeMfOF
c1RjsF9JgmPJh3bs+c1BErs=
=dsj6
-----END PGP SIGNATURE-----

--------------enig2E74B16E5C25CF5AA7187A22--
