Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KTCx8-0004Db-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Aug 2008 11:47:38 +0200
Received: (qmail invoked by alias); 13 Aug 2008 09:47:02 -0000
Received: from e178124028.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.124.28]
	by mail.gmx.net (mp039) with SMTP; 13 Aug 2008 11:47:02 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/Bt79i7QrBO3uPROacIa6jEOpzPBbdjat7Os6ANV
	tn675n7hfnETmG
Message-ID: <48A2ADFE.4090108@gmx.net>
Date: Wed, 13 Aug 2008 11:48:46 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48A1D100.8070102@gmx.net> <g7sp3d$kte$1@ger.gmane.org>
In-Reply-To: <g7sp3d$kte$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.66
Subject: Re: oprofile updates
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
X-List-Received-Date: Wed, 13 Aug 2008 09:47:38 -0000
X-Groupsio-MsgNum: 5741
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig80BE0DAAF921512E7938DF19"

--------------enig80BE0DAAF921512E7938DF19
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Koen Kooi schrieb:
> For which archs? It's already there for armv7a (it's part of the demo
> image):
> http://www.angstrom-distribution.org/repo/?action=3Ddetails&pnm=3Doprof=
ile
Interesting.

I assumed there would be PREFFERRED_VERSION for oprofile in Angstrom but
there is not (there is one for OpenMoko). Then bitbake chose the latest
and highest version: 0.9.4. :)

Regards
Robert


--------------enig80BE0DAAF921512E7938DF19
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiirgAACgkQG9cfwmwwEto1OQCdE6y2d1AVa0llMxM3iS0XC4Q7
zxgAnRwkGw/kXA/rGnZzQ/x0qfsuNfed
=GRQF
-----END PGP SIGNATURE-----

--------------enig80BE0DAAF921512E7938DF19--
