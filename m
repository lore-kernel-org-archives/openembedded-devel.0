Received: from [76.96.62.80] (helo=QMTA08.westchester.pa.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jims@russound.com>) id 1LmEl1-0002VD-Ie
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 23:06:03 +0100
Received: from OMTA05.westchester.pa.mail.comcast.net ([76.96.62.43])
	by QMTA08.westchester.pa.mail.comcast.net with comcast
	id X3Hq1b00B0vyq2s58A4WHn; Tue, 24 Mar 2009 22:04:30 +0000
Received: from agogo ([98.216.198.0])
	by OMTA05.westchester.pa.mail.comcast.net with comcast
	id XA4W1b00U010Ks23RA4XiR; Tue, 24 Mar 2009 22:04:31 +0000
Date: Tue, 24 Mar 2009 18:04:11 -0400
From: Jim Sheldon <jims@russound.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20090324180411.212efd82@agogo>
In-Reply-To: <49C93B2B.5040002@bolloretelecom.eu>
References: <49BFA406.6030802@bolloretelecom.eu>
	<20090317143526.3e79150c@vanille.zapto.org>
	<49BFADB1.3090207@bolloretelecom.eu>
	<20090317171705.208a7d31@kmfms>
	<49C93B2B.5040002@bolloretelecom.eu>
Organization: Russound
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i486-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 24 Mar 2009 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Jeremy,

It works!  I updated my git tree.  I'm only inheriting qt4e, I made no
changes to my recipes, and now they compile.

My company will most likely be doing some development with an OMAP3x
board using OE and Qt embedded 4.5 soon.

Thanks for the help!

On Tue, 24 Mar 2009 15:57:31 -0400
Jeremy Lain=C3=A9 <jeremy.laine@bolloretelecom.eu> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi Jim!
>=20
> > Greetings!  I had a couple of Qt recipes that used "inherit
> > qtopia4core" and worked just fine.
> >
> > Now if I "inherit qt4e" they fail with something like this:
> >
> > | NOTE: using qmake spec in
> > /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux-=
gnueabi-oe-g++,
> >  using profiles '' | NOTE: qmake prevar substitution:
> > QT_LIBINFIX=3DE | Failure to read QMAKESPEC conf
>=20
> I have just commited some cleanups to the Qt packages, could you
> please let me know if it works for you?
> - --
> Jeremy LAINE
> Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>=20
> iEYEARECAAYFAknJOyoACgkQCL1n3lVB9EYu5gCdGiwOuPFHo/JGmkAjgOW0Osnk
> td8AoKH5iRCXqF9Mos8MuNTWc8D2U3MY
> =3DpeGe
> -----END PGP SIGNATURE-----
>=20


