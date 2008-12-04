Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L8HI4-0000ky-H9
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 17:43:00 +0100
Received: (qmail invoked by alias); 04 Dec 2008 16:39:23 -0000
Received: from e178110213.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.110.213]
	by mail.gmx.net (mp065) with SMTP; 04 Dec 2008 17:39:23 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+dT4tNFvOd1yZIaJ1zlAWzmIhHbtN/vZRfS9sDy9
	MR3fY3pzj9ogL/
Message-ID: <493807E9.9050008@gmx.net>
Date: Thu, 04 Dec 2008 17:40:09 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>	<b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>	<20081203175143.GK16628@smtp.west.cox.net>
	<c384c5ea0812031200v541ef8f6m696f3d523436ffc2@mail.gmail.com>
In-Reply-To: <c384c5ea0812031200v541ef8f6m696f3d523436ffc2@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.77
Subject: Re: [RFC Wild Ideas Department] create soft-links from	<pkg>/<src>/patches/some_local.patch to	<oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Thu, 04 Dec 2008 16:43:00 -0000
X-Groupsio-MsgNum: 6845
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5F844C9A5E8D4F991AB6F8BD"

--------------enig5F844C9A5E8D4F991AB6F8BD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Leon Woestenberg schrieb:
> Exactly what I had in mind, for the reasons mentioned.
>=20
> I only care about the local patches.
>=20
> Edit source, quilt refresh, and my checkout has a modified patch.
I like the idea, especially since I had to redo a few patch because I
forgot to copy them back to the checkout dir before doing "bitbake -c
rebuild".

Regards
Robert


--------------enig5F844C9A5E8D4F991AB6F8BD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkk4B+kACgkQG9cfwmwwEtrZIwCgg8aQX4eJxVKsB6ChdqhdYpmf
j60AnjAooQtIozNj59xMS83W26EMqG6V
=27L1
-----END PGP SIGNATURE-----

--------------enig5F844C9A5E8D4F991AB6F8BD--
