Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LoxTl-0006c8-3D
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 12:15:29 +0200
Received: (qmail invoked by alias); 01 Apr 2009 10:13:09 -0000
Received: from f053003157.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.3.157]
	by mail.gmx.net (mp030) with SMTP; 01 Apr 2009 12:13:09 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/v2jleWA/v2tdnNoH18ZwRe3J0JAOoMdsjAj02/+
	qwme8XIbHfM1tD
Message-ID: <49D33E39.4030303@gmx.net>
Date: Wed, 01 Apr 2009 12:13:13 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.7
Subject: RFC: removing libsdl-mixer-1.2.6
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
X-List-Received-Date: Wed, 01 Apr 2009 10:15:29 -0000
X-Groupsio-MsgNum: 8914
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig4DE2EDA4EFB41E161F93AD12"

--------------enig4DE2EDA4EFB41E161F93AD12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I would like to remove the recipe for libsdl-mixer 1.2.6. That one has
issues[0] with libtool and is a very old package anyway. In Debian it is
oldstable.

The only distribution (apart from chinook-compat which I maintain) using
it is openmoko.

1.2.8 (which the other version we have in OE) builds fine.

Is anyone against the removal? If not I will do it in a few days.

Regards
Robert

[0] - http://pastebin.com/m2ade815e


--------------enig4DE2EDA4EFB41E161F93AD12
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknTPjsACgkQG9cfwmwwEtql3QCfb5MPv6sGogr1UrM+C/qJyPzz
1IoAoJ4B/Zhftx8HVY/nDJjH8wJy3+Mv
=4puJ
-----END PGP SIGNATURE-----

--------------enig4DE2EDA4EFB41E161F93AD12--
