Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ0Ad-0008D9-2g for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:58:22 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ08P-0004RA-SB for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 10:56:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001241138.01795.holger+oe@freyther.de>
References: <n> <20100122222101.GC2074@gmail.com>
	<1264242681.10526.2.camel@becca>
	<201001241138.01795.holger+oe@freyther.de>
Date: Sun, 24 Jan 2010 11:56:09 +0100
Message-ID: <1264330569.3810.44.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Sun, 24 Jan 2010 10:58:22 -0000
X-Groupsio-MsgNum: 16146
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Jycf4on71ZNeJUykQ/Fu"

--=-Jycf4on71ZNeJUykQ/Fu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 24.01.2010, 11:38 +0100 schrieb Holger Hans Peter Freyther:
> On Saturday 23 January 2010 11:31:21 Michael Lippautz wrote:
>=20
> > -SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> > +SRC_URI =3D "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=3D=
gpsd
> > \
>
> your mailer has wrapped this line making it impossible to to apply the pa=
tch.=20
> It would be nice if you could send a final patch without line wrapping.

Michael, you could also shorten that line using =C2=BB=E2=80=A6${P}=C2=AB [=
1].

        P: The package name and versions separated by a hyphen.
       =20
        P =3D "${PN}-${PV}"
        For the strace_4.5.14.bb recipe the P variable would be set to
        "strace-4.5.14".


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_versioning.html

--=-Jycf4on71ZNeJUykQ/Fu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcJ0kACgkQPX1aK2wOHVhI+ACdE7FIt9AybMbYx4E1/8lT5Odp
thEAoIbjn3vZyeRsMQ+mIw4RLU4LV4Qd
=pu72
-----END PGP SIGNATURE-----

--=-Jycf4on71ZNeJUykQ/Fu--
