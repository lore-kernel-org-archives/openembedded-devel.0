Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LomlY-0006zE-G6
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 00:49:08 +0200
Received: (qmail invoked by alias); 31 Mar 2009 22:46:51 -0000
Received: from f053009074.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.74]
	by mail.gmx.net (mp058) with SMTP; 01 Apr 2009 00:46:51 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/r9Q0gNj3r2SV0KEXliWM743zt/WLTFXPZrOZKUA
	8w+ytvgU8uhn+y
Message-ID: <49D29D5E.8040901@gmx.net>
Date: Wed, 01 Apr 2009 00:46:54 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49CEAF3E.2050805@gmx.net>	<5c5e5c350903300148j5c4ec665o176a4a1ed0f5b48d@mail.gmail.com>	<49D0A271.3010902@gmx.net>	<1238436006.11483.5.camel@port4>
	<49D1177F.6040200@gremlin.it>
In-Reply-To: <49D1177F.6040200@gremlin.it>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.57
Cc: openembedded-devel@openembedded.org
Subject: Re: OE presentations
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
X-List-Received-Date: Tue, 31 Mar 2009 22:49:08 -0000
X-Groupsio-MsgNum: 8902
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigEA0357C1FB1D72931D312C2C"

--------------enigEA0357C1FB1D72931D312C2C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Alessandro,

Alessandro GARDICH schrieb:
> Hi all
>=20
> this is a presentation I did about Linux Embedded and OpenEmbedded in
> Italian for Linux Day (in Italy) in 2007.
>=20
> http://www.gremlin.it/download/index.php?dir=3D&file=3DLinuxDay2007%20-=
%20GNU%20Linux%20Embedded.pdf
This link provokes some anti-leech thingie ... disturbing .. :$

Anyway. I don't understand itialian but your slides look like you argue
that an embedded system has certain system parameters like RAM, storage,
CPU speeds that are much lower to what you expect from a desktop
machine. While this may be true for some time you are always risking
that next years' technology catches up with your assumptions very quickly=
=2E

Just think about the Sheeva CPU which supports clockspeed up to 1.2GHz,
or the OMAP4 which will comes with 2 CPU cores.

A better way to argue is IMO the great integration an embedded system
provides. The chip that makes up the system often contains various
controllers for e.g. ethernet, wireless, sound, lcd, bluetooth, ...
Often there is also a graphics core and a DSP added.

And while having all these shiny stuff in they consume a fraction of the
power a desktop CPU does.

That is at least the way I would introduce people to the embedded world. =
:)

Regards
Robert


--------------enigEA0357C1FB1D72931D312C2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknSnWEACgkQG9cfwmwwEto70QCfW0iFqSkwkSSyTJZ4oNNwR/qE
Bx4Ani5eaLnZ3NChN1EmOpywMY2P1tQ/
=kI/a
-----END PGP SIGNATURE-----

--------------enigEA0357C1FB1D72931D312C2C--
