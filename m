Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1InHC9-0001nO-07
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 18:17:33 +0100
Received: (qmail invoked by alias); 31 Oct 2007 17:17:21 -0000
Received: from e178072012.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.72.12]
	by mail.gmx.net (mp037) with SMTP; 31 Oct 2007 18:17:21 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18BCdohtO0BhT6A1RKt/uM4+OFwKbW5qNW64MrscQ
	q3p746932wEI3h
Message-ID: <4728B89C.1040405@gmx.net>
Date: Wed, 31 Oct 2007 18:17:16 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: *Very* newbie question: OE and Cygwin?
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
X-List-Received-Date: Wed, 31 Oct 2007 17:17:33 -0000
X-Groupsio-MsgNum: 3261
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5DC31F57C9BC398999D4502A"

--------------enig5DC31F57C9BC398999D4502A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
if you gain some experience with OE on Cygwin it would be nice if you
leave some of that in the Wiki regardless of whether it does not
altogether or at least builts some simple packages.

Regards
Robert

Tiller, Jason schrieb:
> Hi, All, :)
>=20
> =20
>=20
> [Main question: Can I use OE on cygwin to target a PXA270-based board?]=

>=20
> =20
>=20
> My name is Jason Tiller and I'm a software engineer at St. Jude
>=20
> Medical, a heart-related medical device company.  I'm the only
>=20
> software engineer in a division that builds high-intensity focused
>=20
> ultrasound cardiac ablation devices for the relief of atrial
>=20
> fibrillation.
>=20
> =20
>=20
> I'm evaluating a new microprocessor for a next-generation power
>=20
> generator.  We hope to use a linux kernel inside the instrument.  I'm
>=20
> using a Logic Devices PXA270-based Zoom eval board.  I saw on one of
>=20
> the LD boards that OE has support for this micro/board combination.
>=20
> I'd like to try OE to build a kernel and throw up some simple apps,
>=20
> but I have to do the host development in Windows, which means Cygwin.
>=20
> =20
>=20
> In fact, the LD SDK is built on cygwin - they provide pre-built win32
>=20
> gnu cross-tools that rely on cygwin apps.  I'm in the process of
>=20
> updating my Cygwin installation with all of the tools that the wiki
>=20
> (http://www.openembedded.org/wiki/RequiredSoftware) declares are
>=20
> required for OE.  Some of them aren't pre-built Cygwin packages
>=20
> (psyco, jade (but openjade is), sgmltools, docbook-utils, libsdl), but
>=20
> it looks like the really important ones are there.
>=20
> =20
>=20
> Should I expect a major headache in this effort?  My IT department is
>=20
> very cautious, and they won't certify my (desperately underpowered)
>=20
> Linux box for a net connection, so it's a lot easier to use my Windows
>=20
> box for development.
>=20
> =20
>=20
> Thanks for any heads up from a (hopefully) new OE user!
>=20
> =20
>=20
> ---Jason
>=20
> St. Jude Medical
>=20
> My product: http://tinyurl.com/e6gvq
>=20
> =20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig5DC31F57C9BC398999D4502A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHKLigG9cfwmwwEtoRCOzMAJ9JBXM4moKKhV4RKRVUCO6Am50i2wCeOwb8
ohMH/IqojCjAEDI9X9HqrhQ=
=N5oH
-----END PGP SIGNATURE-----

--------------enig5DC31F57C9BC398999D4502A--
