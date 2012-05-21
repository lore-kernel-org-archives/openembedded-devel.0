Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1SWTia-0004u6-Dk for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:36:17 +0200
Received: from f053043087.adsl.alicedsl.de ([78.53.43.87]
	helo=[192.168.178.20])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1SWTYq-0008Ia-2U for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 14:26:12 +0000
Message-ID: <1337610364.4335.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2012 16:26:04 +0200
In-Reply-To: <7D46E86EC0A8354091174257B2FED10138E4605C@DLEE12.ent.ti.com>
References: <1337018980-29630-1-git-send-email-Chase.Maupin@ti.com>
	<1337417934.3976.13.camel@mattotaupa>
	<7D46E86EC0A8354091174257B2FED10138E4605C@DLEE12.ent.ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request 20120514
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
X-List-Received-Date: Mon, 21 May 2012 14:36:18 -0000
X-Groupsio-MsgNum: 38988
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-389jahBZL82eLR1v2Vuy"

--=-389jahBZL82eLR1v2Vuy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 21.05.2012, 13:53 +0000 schrieb Maupin, Chase:
> > -----Original Message-----
> > From: Paul Menzel [mailto:paulepanter@users.sourceforge.net]
> > Sent: Saturday, May 19, 2012 3:59 AM

[=E2=80=A6]

> > > Chase Maupin (69):
> > >       gnutls: update LICENSE setting
> >=20
> > I would have liked to have split those up. Update the license and
> > add the inherit line.
>=20
> I'll split this up then and regenerate the patch set.

If that patch set has already been submitted to meta-oe this way, please
do not spent your time doing that. If it is independent from meta-oe
please do so.

> > >       libtasn1: update LICENSE setting
> > >       bonnie: Update LICENSE field version
> >=20
> > It would have been great to have the changed license in the
> > commit message also.
> >=20
> > [=E2=80=A6]
> >=20
> > >       schroedinger: Update LICENSE field version
> >=20
> > A change in `schroedinger.inc` is preferred in my opinion.
>=20
> I didn't change the .inc because I did not validate all versions of schro=
edinger.

Understood.


Thanks,

Paul

--=-389jahBZL82eLR1v2Vuy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk+6UHwACgkQPX1aK2wOHVjZagCfWyNVMaKV71hoJKvlvth8Ac6i
6yUAn0AwhAVWliItlLU0FY6jhWyShpBi
=1P+F
-----END PGP SIGNATURE-----

--=-389jahBZL82eLR1v2Vuy--
