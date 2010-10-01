Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1TMF-0005MH-Vm for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 02:20:16 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1TM3-00086j-TN for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 00:20:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201009302338.38026.schnitzeltony@gmx.de>
References: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
	<AANLkTikzbm2zfbDbXc2a6AJTHuvQC9FaZYmw65udiJq-@mail.gmail.com>
	<201009240055.34347.schnitzeltony@gmx.de>
	<201009302338.38026.schnitzeltony@gmx.de>
Date: Fri, 01 Oct 2010 02:20:02 +0200
Message-ID: <1285892402.3689.0.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Fri, 01 Oct 2010 00:20:17 -0000
X-Groupsio-MsgNum: 24244
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-U5qApgkHzQde36/U4B6g"

--=-U5qApgkHzQde36/U4B6g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 23:38 +0200 schrieb Andreas Mueller:
> On Friday 24 September 2010 00:55:34 you wrote:
> > On Thursday 23 September 2010 09:44:30 pm Frans Meulenbroeks wrote:
> > > Frans (btw still interested to learn how it is tested)
> >=20
> > My configuration (untouched since I started with OE)
> >=20
> > MACHINE =3D "overo"
> > DISTRO =3D "angstrom-2008.1"
> > #ANGSTROM_MODE =3D "uclibc" -> glibc
> >=20
> > I did=20
> >=20
> > 'bitbake clutter-gtk' with org.openembedded.dev / the *.ipk are install=
ed on overo-machine.
> >=20
> > and=20
> >=20
> > a full image on gumstix.overo branches containing all clutter recipes.
> >=20
> > Tested are the example applications shipped with *-examples package. Al=
l were working fine. The only application which was working 'weak' was=20
> > gtk-clutter-multistage mentioning that there was an icon missing in the=
 current theme.
> >=20
> > meanwhile Paul did further build tests - also omap3 based.
> >=20
> > Andreas
> >=20
> The world is not running down without it but could someone take care of t=
his?

My build results from PATCH v2 remain the same.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

--=-U5qApgkHzQde36/U4B6g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkylKSwACgkQPX1aK2wOHVj2OACdHZuvnaSZAYrjwcpPHniHvQWR
0twAn3k0BsYntnrOCCMXx5mf+xD1WRhr
=JTqr
-----END PGP SIGNATURE-----

--=-U5qApgkHzQde36/U4B6g--
