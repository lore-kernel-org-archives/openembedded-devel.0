Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LolpE-00006P-ND
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 23:48:57 +0200
Received: (qmail invoked by alias); 31 Mar 2009 21:46:36 -0000
Received: from f053009074.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.74]
	by mail.gmx.net (mp048) with SMTP; 31 Mar 2009 23:46:36 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19fajUrS31faib5ZWaGkUq/BbwrnzkTCmYUyS0bl8
	82ragHxyAUv/Be
Message-ID: <49D28F41.1050005@gmx.net>
Date: Tue, 31 Mar 2009 23:46:41 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
In-Reply-To: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: Does your own system matter
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
X-List-Received-Date: Tue, 31 Mar 2009 21:49:00 -0000
X-Groupsio-MsgNum: 8899
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig49FADC94C64B897EA39D94E7"

--------------enig49FADC94C64B897EA39D94E7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
please provide a log of the failed action. Otherwise we can only guess.

Btw: Have you checked that /bin/sh is /bin/bash on your box?

Regards
Robert

Mauri Sandberg schrieb:
> 	  Does your own system play important part when building stuff with Op=
enEmbedded? I am building on Ubuntu 8.10 and I do seem to be getting fail=
ed builds where other people do not judging on build statuses they report=
=2E
>=20
> I am trying to build for DNS-323 using angstrom-2008.1 distro in stable=
/2009 branch now. I have tried other branches, stable and dev, earlier to=
o. Building always breaks at uclibc.
>=20
> I was able to compile uclibc 0.9.29 for cm-x270, though. Unfortunately =
that build failed later on also.
>=20
> Before complaining about broken stuff I'd like to get my own end sorted=
 out.
>=20
> -- Mauri
>=20
>=20
> _________________________________________________________________
> Invite your mail contacts to join your friends list with Windows Live S=
paces. It's easy!
> http://spaces.live.com/spacesapi.aspx?wx_action=3Dcreate&wx_url=3D/frie=
nds.aspx&mkt=3Den-us
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig49FADC94C64B897EA39D94E7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknSj0EACgkQG9cfwmwwEtoNLwCdHjMZs3jD1Oowc9ZW+HBwJGjR
szkAniaDRkqgj5xG1DNE3QJjXxvyWix6
=/iiI
-----END PGP SIGNATURE-----

--------------enig49FADC94C64B897EA39D94E7--
