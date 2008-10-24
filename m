Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1KtJH1-00069T-49
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 11:48:03 +0200
Received: (qmail invoked by alias); 24 Oct 2008 09:47:27 -0000
Received: from p579E187A.dip.t-dialin.net (EHLO [192.168.10.21])
	[87.158.24.122]
	by mail.gmx.net (mp032) with SMTP; 24 Oct 2008 11:47:27 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1911LptmlR1/E3lHA5lhaw5etQAQFP7izRyhwD9Nn
	1aN5VStvbsIkSV
Message-ID: <490199AE.6070901@gmx.net>
Date: Fri, 24 Oct 2008 11:47:26 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48F825DE.90104@miromico.ch> <48F8745B.2030001@gmx.net>
	<449dbc2c021997d20314e77536d2f770@mail.nine.ch>
In-Reply-To: <449dbc2c021997d20314e77536d2f770@mail.nine.ch>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6899999999999999
Subject: Re: Adding support for our
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
X-List-Received-Date: Fri, 24 Oct 2008 09:48:03 -0000
X-Groupsio-MsgNum: 6374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB9E43A46D2A8F9D5E320CEF1"

--------------enigB9E43A46D2A8F9D5E320CEF1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

mailinglist@miromico.ch schrieb:
> Yes, I know. I have an ATNGW100 as well. The problem is, that the oe fo=
r
> atngw100=20
> fails. It does compile (console-image), but I can't boot. I get a segfa=
ult
> in init (sysvinit).
>=20
That is too bad and should be considered a bug. Since there are so few
AVR32-using people in OE toolchain changes (and I somehow believe this
is again a toolchain issue) which broke that arch went in undetected.

OTOH it would really help if Atmel would push their binutils et al
patches upstream ...

Regards
Robert


--------------enigB9E43A46D2A8F9D5E320CEF1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFJAZmuG9cfwmwwEtoRApfAAJwIhitKjlYRkOwX7ubj4KN+gtpUvACeLyxa
l3fLqpBDrYIZmHKO4WAPMK4=
=Dnxb
-----END PGP SIGNATURE-----

--------------enigB9E43A46D2A8F9D5E320CEF1--
