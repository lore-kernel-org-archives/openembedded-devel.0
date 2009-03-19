Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LkOBF-0007DW-Ak
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 20:45:29 +0100
Received: (qmail invoked by alias); 19 Mar 2009 19:44:28 -0000
Received: from f053000052.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.0.52]
	by mail.gmx.net (mp047) with SMTP; 19 Mar 2009 20:44:28 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1++F2AXK0a+JwQN57hU/t+6u/4G2ZttwmGluIL4w7
	V9CsjYn9k+WJjW
Message-ID: <49C2A169.4070806@gmx.net>
Date: Thu, 19 Mar 2009 20:47:53 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49B92F20.3060701@gmx.net>
In-Reply-To: <49B92F20.3060701@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.74
Subject: Re: RFC: CMAKE - support out of tree builds
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
X-List-Received-Date: Thu, 19 Mar 2009 19:45:29 -0000
X-Groupsio-MsgNum: 8569
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig25D898285E303F2B34899EC4"

--------------enig25D898285E303F2B34899EC4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I am going to push this 2009-03-20 aka tomorrow. Please speak if you do
not want it.

Regards
Robert

Robert Schuster schrieb:
> Hi,
> I am proposing the attached patch to make it possible to do out-of-tree=

> builds in OE. Out-of-tree builds should be preferred but I do not want
> to look at every recipe if it still works.
>=20
> OTOH I want to include llvm 2.5 with its new cmake-based build system
> which incidentally does *not* permit in-tree builds.
>=20
> Regards
> Robert
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig25D898285E303F2B34899EC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknCoWkACgkQG9cfwmwwEtop6ACfVQIw5Cbv69SBjrNOZddNIADO
xpQAn3o0ErLi4LKtWnon3cqUmKMRtR1u
=8H9l
-----END PGP SIGNATURE-----

--------------enig25D898285E303F2B34899EC4--
