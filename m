Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSAnq-0008Up-D5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Aug 2008 15:17:46 +0200
Received: (qmail invoked by alias); 10 Aug 2008 13:17:21 -0000
Received: from e178119108.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.119.108]
	by mail.gmx.net (mp068) with SMTP; 10 Aug 2008 15:17:21 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/cqJVxdBrcpDIHlg4ozfa5Zpb4t72R9sp+4uiav2
	tOvZIfOw/x2uNl
Message-ID: <489EEAC6.1030300@gmx.net>
Date: Sun, 10 Aug 2008 15:19:02 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4883BCB1.7020102@atmel.com>
	<c384c5ea0807221042y5018e7f2ka7b2915e82e9a554@mail.gmail.com>
In-Reply-To: <c384c5ea0807221042y5018e7f2ka7b2915e82e9a554@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Sun, 10 Aug 2008 13:17:46 -0000
X-Groupsio-MsgNum: 5717
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigB994E1CA86EBA637EB37F8DE"

--------------enigB994E1CA86EBA637EB37F8DE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
got an ngw100 and wanted to build angstrom for it and have the same
issues as Ulf with binutils-cross.

Leon Woestenberg schrieb:
>> Anyone got the AVR32 toolchain to build properly using a recent versio=
n?
>>
> Yes, I am building a AVR32 project using
> 478afd231213fcf731ddefac0314beee5d95b5fb which works fine for me.
>=20
> I upgrade every now and then. Will see about more recent revisions of O=
E.
Can you try with a current one?

Regards
Robert


--------------enigB994E1CA86EBA637EB37F8DE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkie6sYACgkQG9cfwmwwEtpmRQCbBoJTYN5iHg/3O/7SQZ8HyC7T
220An2e31ZqnJ+f1jaGNnZZW9Kj2Mkse
=KF8m
-----END PGP SIGNATURE-----

--------------enigB994E1CA86EBA637EB37F8DE--
