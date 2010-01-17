Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWYng-0000WR-Ii for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 18:20:36 +0100
Received: from g225080206.adsl.alicedsl.de ([92.225.80.206]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWYlZ-0004NC-8o for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 17:18:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001171200010.16324@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<20100117165403.GP30938@jama>
	<alpine.LFD.2.00.1001171200010.16324@localhost>
Date: Sun, 17 Jan 2010 18:18:19 +0100
Message-ID: <1263748699.3210.56.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 17:20:36 -0000
X-Groupsio-MsgNum: 15805
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-3Gly/4j4CkUZ9XLbCegB"

--=-3Gly/4j4CkUZ9XLbCegB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 12:06 -0500 schrieb Robert P. J. Day:
> On Sun, 17 Jan 2010, Martin Jansa wrote:
> > On Sun, Jan 17, 2010 at 11:47:06AM -0500, Robert P. J. Day wrote:
> > >   it seems counter-productive to allow a single games package to put
> > > the brakes on an entire build.
> >
> > Maybe you want to build with -k?
> >
> > If there is some build problem in games package, then it should be
> > fixed, not silenced by whole task removal.
>=20
>   i've reported the breakage related to gnome-games before:
>=20
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg=
02124.html
>=20
> note in that posting that philip balister appears to confirm the
> problem, and there's a reference to someone else who is working with
> an update that might solve the problem.
>=20
>   that was a *month* ago, and things are still broken.  if there's a
> fix, then it should be applied.  if there isn't, then the reference to
> gnome-games should be removed.  allowing a single broken package
> that's been broken for over a month to be the single obstacle to a
> successful build would seem to be entirely counter-productive.

As written, I think you should enter this in the bugtracker where it
will not get forgotten. You can also publish your diff to make it easier
for others.

And lastly people can always use the online rootfs builder [1].=20


[1] http://www.angstrom-distribution.org/online-rootfs-builder-moved-=C3=A5=
ngstr=C3=B6m-domain

--=-3Gly/4j4CkUZ9XLbCegB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktTRlsACgkQPX1aK2wOHVgOGwCgjPKLpIbcxbik62TTEhMbc966
zf4An2hUiPEPv1Q4C7zku/FtGUsOGgNc
=zhgJ
-----END PGP SIGNATURE-----

--=-3Gly/4j4CkUZ9XLbCegB--
