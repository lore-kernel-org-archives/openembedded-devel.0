Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IUeG0-0005gh-EB
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2007 10:04:32 +0200
Received: (qmail invoked by alias); 10 Sep 2007 08:01:34 -0000
Received: from e178088152.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.88.152]
	by mail.gmx.net (mp048) with SMTP; 10 Sep 2007 10:01:34 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/NS0I11dnN7ykHYyx7E/VIouqQy7Wh9BaqFOWzuh
	SgGXApdAWy70dO
Message-ID: <46E4F9B0.3070806@gmx.net>
Date: Mon, 10 Sep 2007 10:00:48 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46E4E5DB.7050501@gmx.net> <46E4F12B.9080102@student.utwente.nl>
In-Reply-To: <46E4F12B.9080102@student.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-Y-GMX-Trusted: 0
Subject: Re: 3rd party feeds
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
X-List-Received-Date: Mon, 10 Sep 2007 08:04:35 -0000
X-Groupsio-MsgNum: 2869
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig4DA83C4C01D48718E94DEB53"

--------------enig4DA83C4C01D48718E94DEB53
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

> You ping the angstrom maintainers and they will build that package and =
put it in the
> angstrom feeds.
Right. Pushing things upstream is the best solution.

Sadly not every distribution has maintainers to ping. There are devices
which are equipped with OE-built distributions for which no public
distro.conf exists[0].

> Angstrom *highly* discourages people to add random feeds from the inter=
net.
Sure, but I am not convinced that this holds for other distributions.
Angstrom was meant to be a placeholder in my previous mail.

Regards
Robert

[0] - http://bugs.openembedded.org/show_bug.cgi?id=3D2664


--------------enig4DA83C4C01D48718E94DEB53
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFG5PmyG9cfwmwwEtoRCKXqAKCbfPYJ2mbXPFjTjtNbFaW8vTBa7gCeL8rP
ShfWtetLPqre18j7VoYkQso=
=1LOZ
-----END PGP SIGNATURE-----

--------------enig4DA83C4C01D48718E94DEB53--
