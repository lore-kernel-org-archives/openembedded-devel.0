Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1JoZTs-0002ze-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 09:33:28 +0200
Received: (qmail invoked by alias); 23 Apr 2008 07:33:21 -0000
Received: from brln-4db88a27.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.184.138.39]
	by mail.gmx.net (mp020) with SMTP; 23 Apr 2008 09:33:21 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19hdG581K9heEX+Z8F2c2cumRUe1KKD0gQnEAuHhc
	S9XqoFBLmrpPm2
Message-ID: <480EE63D.8070208@gmx.net>
Date: Wed, 23 Apr 2008 09:33:17 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>	<47FE2530.2@gmx.net>	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>	<4800DC3B.9080007@gmx.net>	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>	<480596E2.7030906@gmx.net>
	<35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
In-Reply-To: <35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 07:33:28 -0000
X-Groupsio-MsgNum: 4988
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD6EA55A5A906CA9E1AA46B36"

--------------enigD6EA55A5A906CA9E1AA46B36
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Matthijs,

Matthijs van de Water schrieb:
> Bad luck: my GCC/GCJ build seems flawless, but the filesystem I
> generated with it fails to run a Java Hello World :(
> It fails with a "terminate called without an active exception" before
> doing anything.
>=20
> I'll try to debug this, but I fear that I'll have to get this test
> based on GCC 4.3 before I can get any real support from the gcc-java
> mailing list...
Yeah, I've seen your thread over there. At least we have a good idea of
what is not working. Unfortunately I have this feeling that exception
handling on ARM with GCJ is an all time favorite. Hopefully we can get
things to fly with GCC 4.3 then.

Btw: Your statement that 4.3 is not widely in use is not quite right:
Fedora 9 and Debian Lenny are build with it or are in the process of
transition.

Regards
Robert


--------------enigD6EA55A5A906CA9E1AA46B36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIDuZAG9cfwmwwEtoRCPpQAJ9fPjtEYS63OPuH6qdW5APeg6wldQCfZFYD
XljWsULVPu+bgTq3E7YcYG0=
=BAQt
-----END PGP SIGNATURE-----

--------------enigD6EA55A5A906CA9E1AA46B36--
