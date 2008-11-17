Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1L21TJ-0000V9-Pm
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 11:36:45 +0100
Received: (qmail invoked by alias); 17 Nov 2008 10:34:24 -0000
Received: from p579E19C6.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.25.198]
	by mail.gmx.net (mp003) with SMTP; 17 Nov 2008 11:34:24 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/dch53T8zdSolXDpSKlviCcK+VCW1E93YAxd/Fck
	eM1LmUsnrbqQYX
Message-ID: <492148AA.3040908@gmx.net>
Date: Mon, 17 Nov 2008 11:34:18 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF52A@hiob.intern.dresearch.de><491D3DA5.5070503@gmx.net>	<69E6C70090A0A14498CC98FAE5E06B6E3CF52B@hiob.intern.dresearch.de>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF535@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF535@hiob.intern.dresearch.de>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.73
Subject: Re: OXE810 support
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
X-List-Received-Date: Mon, 17 Nov 2008 10:36:45 -0000
X-Groupsio-MsgNum: 6632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig2E67186E2C741705A8C6E35E"

--------------enig2E67186E2C741705A8C6E35E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

Sledz, Steffen schrieb:
>>> please open a bug report and attach some of your files there. E.g.
>>> the machine configuration.
>> I did, see http://bugs.openembedded.net/show_bug.cgi?id=3D4827
>=20
> What's the next step now?
sorry for the delay. As it seems no one else bothers testing,
so I am doing it. :)

I applied your patches, will build a minimal image and if everything
goes well I will push your changes.

Afterwards I will propose you for rw access since it would make no sense
if a machine maintainer needs people in between to fix problems for his
own machine.


Regards
Robert


--------------enig2E67186E2C741705A8C6E35E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkkhSKsACgkQG9cfwmwwEtphWwCfeo6MlNlb5sXreP6xF5fDak5T
6vMAn3YVrjIAoKydGcvbwlF7F/ZjVdln
=MpU/
-----END PGP SIGNATURE-----

--------------enig2E67186E2C741705A8C6E35E--
