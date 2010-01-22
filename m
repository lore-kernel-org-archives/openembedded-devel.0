Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYJHp-0000zE-JE for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 14:10:56 +0100
Received: from f053040144.adsl.alicedsl.de ([78.53.40.144]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYJFd-0008Rd-UQ for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 13:08:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20100122T100408-864@post.gmane.org>
References: <4B564B3D.7020108@atmel.com>
	<loom.20100122T100408-864@post.gmane.org>
Date: Fri, 22 Jan 2010 14:08:36 +0100
Message-ID: <1264165716.3307.23.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Fri, 22 Jan 2010 13:10:56 -0000
X-Groupsio-MsgNum: 16024
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VLTMuAv/O0ZQj4haPKUh"

--=-VLTMuAv/O0ZQj4haPKUh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 22.01.2010, 09:05 +0000 schrieb Graeme Gregory:
> Ulf Samuelsson <ulf.samuelsson <at> atmel.com> writes:
>=20
> > +PACKAGES =3D "fbv"
>=20
> NAK
>=20
> PACKAGES is never set in a recipe only added to.

More information seems to available in the user manual [1].


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_packages.html

--=-VLTMuAv/O0ZQj4haPKUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktZo1QACgkQPX1aK2wOHViyQQCdFoNqEwT5hO32pdnSgcI9T0Vv
M8EAn1g1XRCbVHWfM9ZL/7koCllLKl7U
=mZGS
-----END PGP SIGNATURE-----

--=-VLTMuAv/O0ZQj4haPKUh--
