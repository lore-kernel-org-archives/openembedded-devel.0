Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L8Yll-00071v-Il
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Dec 2008 12:22:50 +0100
Received: (qmail invoked by alias); 05 Dec 2008 11:19:09 -0000
Received: from e178110213.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.110.213]
	by mail.gmx.net (mp071) with SMTP; 05 Dec 2008 12:19:09 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+9DqU2sDm9vt90hQjXMHuPKlGngtmdNwlZVef/0V
	jFskyVtyefud3w
Message-ID: <49390E5B.5090600@gmx.net>
Date: Fri, 05 Dec 2008 12:19:55 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49382D2D.1030504@gmx.net> <4938446B.8020100@balister.org>
In-Reply-To: <4938446B.8020100@balister.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64
Subject: Re: RFC: remove boost-jam-native 3.1.11
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
X-List-Received-Date: Fri, 05 Dec 2008 11:22:50 -0000
X-Groupsio-MsgNum: 6870
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD0D19F2E3DBAA8C3A9403FD9"

--------------enigD0D19F2E3DBAA8C3A9403FD9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Philip Balister schrieb:
>> On a related note: I invested some time to get boost 1.34.1 being buil=
d
>> nicely including the bzip2 and gzip support. Now I see that in the 1.3=
6
>> recipe those are disabled again. That is unfortunate because wesnoth
>> needs them.
>=20
> I think I added the recipe. I use it on the beagle, which uses gcc 4.3,=

> which may have had some trouble with parts of boost. I'm OK with moving=

> to a newer boost, but there are some non-backward compatible changes in=

> boost that we will need to watch out for. I needed only a couple pieces=

> from boost 1.36, so I built the ones I needed and set the recipe to
> DEFAULT_PREFERENCE=3D"-1".
ok. I just saw that in Debian they allow installation of all kinds of
boost versions side by side. IMHO that is reasonable since boost makes
no promises regards backward compatibility.

Do want to follow this approach?

Regards
Robert


--------------enigD0D19F2E3DBAA8C3A9403FD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkk5Dl0ACgkQG9cfwmwwEtoztQCeIvcwsGJBSi6flq5naSZKWV8x
8+oAoJ9FuzbL2EpfRdd4+NtbwHTBAXsm
=CeCa
-----END PGP SIGNATURE-----

--------------enigD0D19F2E3DBAA8C3A9403FD9--
