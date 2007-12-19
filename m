Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J4zSu-0002KR-Q9
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 15:00:05 +0100
Received: (qmail invoked by alias); 19 Dec 2007 13:55:02 -0000
Received: from e178077011.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.77.11]
	by mail.gmx.net (mp004) with SMTP; 19 Dec 2007 14:55:02 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+1ILBxjVq1TJkxp4Ss5ebjAtzjI4fLAMkyVEmR/s
	OfOEKmUSayfXPz
Message-ID: <476922B1.4090102@gmx.net>
Date: Wed, 19 Dec 2007 14:54:57 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <475EDA2B.8080109@gmx.net>
In-Reply-To: <475EDA2B.8080109@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: merging recipes from Jalimo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2007 14:00:05 -0000
X-Groupsio-MsgNum: 3699
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigF62D768C6DC81DF968564439"

--------------enigF62D768C6DC81DF968564439
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
thanks for all the information. Contrary to what I said in other posts I
will look in providing a completely self-hosting java toolchain. This
will include building one additional instance of classpath and cacao
only (this does not takes as long as the gcc+glibc combo :) ).

The reason for not going the host-provided java route is that I find it
troublesome to add logic to the recipe to find the java's class library
in case it is host provided or self-built.

Regards
Robert

Robert Schuster schrieb:
> Hi,
> since I've gotten r/w access to the repo (thanks again!) I have begun t=
o
> slowly merge the Jalimo recipes. It all starts with this one:
>=20
> http://bugs.openembedded.org/show_bug.cgi?id=3D3457
>=20
> The recipe that builts the initial Java5-capable Java compiler.
>=20
> Please comment on the bug and tell me whether it should go in or what
> you would like to see changed.
>=20
> Regards
> Robert
>=20
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enigF62D768C6DC81DF968564439
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHaSK0G9cfwmwwEtoRCHcXAJ0XIcmwImD/w0n0ANd1N0DdGJSlqACggaYU
oynNIzRnZAdM9zcNveCN62E=
=Hf4i
-----END PGP SIGNATURE-----

--------------enigF62D768C6DC81DF968564439--
