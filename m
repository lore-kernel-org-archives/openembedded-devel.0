Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoFAa-0000ej-KL for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 14:33:36 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoFA7-0003lb-Av for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 12:33:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinTAbx5g2SOB8dGjyPbSGOJCAoeD6YCf2=MUa+F@mail.gmail.com>
References: <AANLkTinTAbx5g2SOB8dGjyPbSGOJCAoeD6YCf2=MUa+F@mail.gmail.com>
Date: Wed, 25 Aug 2010 14:33:00 +0200
Message-ID: <1282739580.3880.88.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sysvinit_2.86.bb: change sysvinit-utils for compatible with upstart
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
X-List-Received-Date: Wed, 25 Aug 2010 12:33:36 -0000
X-Groupsio-MsgNum: 22641
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DcXHZWaC+VYnrwI1j/Vn"

--=-DcXHZWaC+VYnrwI1j/Vn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 17:04 +0600 schrieb Anatoly Shipitsin:
> From: Anatoly Shipitsin <norguhtar@gmail.com>
>=20
> * move shutdown to sysvinit package
> * move killall5 to sysvinit-utils
> * change PR =3D "r59"
>=20
> Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
>=20
> ---
> recipes/sysvinit/sysvinit_2.86.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

[=E2=80=A6]

Same here. Please resend the patch not mangled and mark the patch
iteration [v3] (`git help format-patch` =E2=86=92 `--subject-prefix`) pleas=
e.


Thanks,

Paul

--=-DcXHZWaC+VYnrwI1j/Vn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx1DXwACgkQPX1aK2wOHVjKBwCeKATzkCB9oRfPFkzyM6PmQEBB
Fi8Ani/2Ym++NEilo2e+/qQa58tevtdt
=mrZu
-----END PGP SIGNATURE-----

--=-DcXHZWaC+VYnrwI1j/Vn--
