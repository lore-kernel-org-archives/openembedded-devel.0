Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L0uXD-00059Y-PM
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Nov 2008 10:00:12 +0100
Received: (qmail invoked by alias); 14 Nov 2008 08:58:03 -0000
Received: from e178125038.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.125.38]
	by mail.gmx.net (mp002) with SMTP; 14 Nov 2008 09:58:03 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+d/qcxdoqdZmU7qdXZNMYHmPKjBsc7UF15MNwZH+
	a/PW3X9HcTykUm
Message-ID: <491D3DA5.5070503@gmx.net>
Date: Fri, 14 Nov 2008 09:58:13 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF52A@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF52A@hiob.intern.dresearch.de>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64
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
X-List-Received-Date: Fri, 14 Nov 2008 09:00:12 -0000
X-Groupsio-MsgNum: 6594
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig29D6703A23EDAFEB3E3D18DC"

--------------enig29D6703A23EDAFEB3E3D18DC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Steffen,
please open a bug report and attach some of your files there. E.g.
the machine configuration.

Regards
Robert

Sledz, Steffen schrieb:
> Sorry for sending this message again in a new thread. But i did not got=
 any response to my first try. May be the original thread was in the kill=
file of the relevant guys. Or is nobody interested in support for new har=
dware?
>=20
>> I'm planning to make OXE810 machine support available for the=20
>> community in a few days (i'm waiting for some feedback from=20
>> Oxford Semiconductors before).
>=20
> Everything is ready now for the community. :)
>=20
>> Now my question is, what's the preferred way to do this (i've=20
>> no git commit access yet)?
>>
>> The wiki says "Aspiring developers are encouraged to request=20
>> a personal git tree where they can store and share changes.=20
>> They can then submit these patches for review on the mailing=20
>> list and when ready, someone with commit rights can merge or=20
>> if needed cherry pick the changes into the main development branch."
>>
>> That sounds OK for me. But i miss a description *how* to do=20
>> all that (sorry, i'm a CVS, SVN & Co. user/admin for a long=20
>> time, but i'm not that familiar with the git philosophy). How=20
>> to create this personal tree? Or means "tree" a "branch"=20
>> here? How to keep this tree/branch up to date from the dev=20
>> branch? How to submit the patches to the mailing list? ...?
>=20
> So herewith i request "a personal git tree" (could be named oxe810) for=
 this stuff or an alternative instruction how to continue.
>=20
> Steffen
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig29D6703A23EDAFEB3E3D18DC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkkdPagACgkQG9cfwmwwEtqmgwCfVaWiYjRoo7rsXJtNxvDgs51r
qgoAn3S9nPkO2w8TlrImtUKwtsUDmwtm
=9wJq
-----END PGP SIGNATURE-----

--------------enig29D6703A23EDAFEB3E3D18DC--
