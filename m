Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoF85-0000PI-3L for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 14:31:13 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoF7f-0002vi-9N for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 12:30:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikvLoGEKA-kmer4_QOVMPG+fynmOPDca03eWJ=X@mail.gmail.com>
References: <AANLkTikvLoGEKA-kmer4_QOVMPG+fynmOPDca03eWJ=X@mail.gmail.com>
Date: Wed, 25 Aug 2010 14:30:28 +0200
Message-ID: <1282739428.3880.82.camel@mattotaupa>
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
Subject: Re: [PATCH] upstart_0.3.11.bb: fix upstart sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 12:31:13 -0000
X-Groupsio-MsgNum: 22639
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-3oH0TS8PFH1li4dDdYOF"

--=-3oH0TS8PFH1li4dDdYOF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 17:13 +0600 schrieb Anatoly Shipitsin:
> From: Anatoly Shipitsin <norguhtar@gmail.com>
>=20
> * move shutdown to sysvinit package
> * move killall5 to sysvinit-utils
> * change PR =3D "r59"

The commit message does not seem to be correct but just copied from the
sysvinit commit message.

> Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
>=20
> ---
>  recipes/upstart/upstart.inc       |  111 +++++++++++++++++++++++++++++++=
++++-
>  recipes/upstart/upstart_0.3.11.bb |   15 ++++-
>  recipes/upstart/upstart_0.3.8.bb  |   14 +++--
>  3 files changed, 127 insertions(+), 13 deletions(-)

[=E2=80=A6]
Besides it looks like your MUA mangled the patch (inserted line breaks).
Please resend as v3. Please make sure to mark your patches as such.


Thanks,

Paul

--=-3oH0TS8PFH1li4dDdYOF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx1DOQACgkQPX1aK2wOHVgy8wCdGNpdPHuJgMbRguw4YPFEQk3+
PjkAn3geCrgDSC+GMdiEf+JLWFs05Sbf
=e5RE
-----END PGP SIGNATURE-----

--=-3oH0TS8PFH1li4dDdYOF--
