Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1KjAM0-0008Nq-HS
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Sep 2008 12:15:16 +0200
Received: (qmail invoked by alias); 26 Sep 2008 10:11:29 -0000
Received: from p579E1BED.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.27.237]
	by mail.gmx.net (mp020) with SMTP; 26 Sep 2008 12:11:29 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/E3OotJNbESPTNViMYIoq0xCrEyFxZnU3cKSUggd
	hme/RQ6uSIdJjB
Message-ID: <48DCB539.9000703@gmx.net>
Date: Fri, 26 Sep 2008 12:11:05 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	openembedded-users@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
Subject: Who wants to finish mysql 5.0.67 support?
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
X-List-Received-Date: Fri, 26 Sep 2008 10:15:17 -0000
X-Groupsio-MsgNum: 5976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4F8AAD51679B95E146702EA3"

--------------enig4F8AAD51679B95E146702EA3
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I recently worked on recipes for mysql 5.0.67 but was not able to finish
them.

If you are interested in mysql 5 in OE or are new to OpenEmbedded recipe
development and are looking for a low hanging fruit, you might want to
check out this bug report:

http://bugs.openembedded.org/show_bug.cgi?id=3D4577

I uploaded a few things already so you won't start from zero. Details
are in the PR.

Regards
Robert


--------------enig4F8AAD51679B95E146702EA3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI3LU5G9cfwmwwEtoRAkY/AJsFaV9hfOuyiOBPux6yXVNx6wrzKACfSLtA
YCnX619ewAAztsMv9BbUT54=
=Tgoj
-----END PGP SIGNATURE-----

--------------enig4F8AAD51679B95E146702EA3--
