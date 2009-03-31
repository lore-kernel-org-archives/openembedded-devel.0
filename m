Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LokD1-0003JB-Ip
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 22:05:19 +0200
Received: (qmail invoked by alias); 31 Mar 2009 20:02:51 -0000
Received: from f053009074.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.74]
	by mail.gmx.net (mp063) with SMTP; 31 Mar 2009 22:02:51 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/luKU5BtDl+ILwgsS0oLlzGZcp0aos3gSxSnxo7Z
	EG1PeTNiAdXVEF
Message-ID: <49D276F0.2060701@gmx.net>
Date: Tue, 31 Mar 2009 22:02:56 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903311837.28324.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.5600000000000001
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Tue, 31 Mar 2009 20:05:19 -0000
X-Groupsio-MsgNum: 8880
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigB2734854CDD709E2EF19CF2C"

--------------enigB2734854CDD709E2EF19CF2C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
is it possible/allowed to port things into the stable which IMO make its
maintenance easier? E.g. I've just cleaned up the llvm recipes and made
them side by side installable (multiple version). The stable branch
would be more of a burden when these things differ so much from each othe=
r.

Apart from that llvm is not used from anything but the llvm-gcc recipes
which I saw and which look not inspiring confidence.

Last but not least I was going to base the Jalimo recipes on that and
then finally move them into OE.

Regards
Robert

Marcin Juszkiewicz schrieb:
> Hi
>=20
> I would like to announce creation of new branch: stable/2009 in=20
> OpenEmbedded repository. It was branched few days ago, build tested and=
=20
> got some bugfixes which were added to .dev tree (and back to=20
> stable/2009).
>=20
> What was in build test? Distro "angstrom-2008.1", machines: qemuarm=20
> (armv5te), at91sam9263ek (armv5te), beagleboard (armv7a), qemux86 (i586=
)=20
> and vortex86sx (486sx). I tested building of next images: console,=20
> console-base, x11, beagleboard-demo for each of those machines. So far =

> only glibc builds were tested, uclibc one is queued.
>=20
> I also imported BitBake 1.8.12 (last release) into "stable/2009" branch=
=20
> as this is minimal stable version which works with this repository.
>=20
> Feel free to clone and do tests. I will write more later.
>=20
> Regards,=20



--------------enigB2734854CDD709E2EF19CF2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknSdvAACgkQG9cfwmwwEto02wCfR7h2dNhGjPv/CX9zQAOOUFyM
WrIAnAvoT3S65XrDSerDYBxwyRM1bY/k
=VEPA
-----END PGP SIGNATURE-----

--------------enigB2734854CDD709E2EF19CF2C--
