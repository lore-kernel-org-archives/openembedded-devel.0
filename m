Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgGDG-0008Ff-Br for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 13:35:34 +0100
Received: from f053036037.adsl.alicedsl.de ([78.53.36.37]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgGCc-0002Ua-Oi for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:34:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=LkWW3wOXJtmQsSPcCRrofqY15osKL2u9UBYvr@mail.gmail.com>
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
	<AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
	<4D38D77E.7070000@mentor.com>
	<AANLkTi=LkWW3wOXJtmQsSPcCRrofqY15osKL2u9UBYvr@mail.gmail.com>
Date: Fri, 21 Jan 2011 13:34:53 +0100
Message-ID: <1295613293.12720.52.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: ltp_20100831: `WARNING: Deprecated usage of 'patch' url param` (was: testing branch 2011-01-20)
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
X-List-Received-Date: Fri, 21 Jan 2011 12:35:34 -0000
X-Groupsio-MsgNum: 28272
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-v35TuqA55CoW3PpRWa/2"

--=-v35TuqA55CoW3PpRWa/2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 21.01.2011, 08:52 +0100 schrieb Frans Meulenbroeks:

[=E2=80=A6]

> The others seem to be more general. I'll copy from the sheevaplug log.
>=20
> on starting the builld, I get:
> Parsing .bb files, please wait...WARNING: Deprecated usage of 'patch'
> url param for '/home/hudson/jobs/OE_test/workspace/openembedded/recipes/l=
tp/ltp-20100831/runalltests.patch',
> please use 'apply=3D{yes,no}'

Khem fixed this in e4b91191 [1].

    ltp_20100831.bb: Fix deprecated usage to specify patch in SRC_URI

[=E2=80=A6]


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De4b9119=
1909d47a00b6e7de62ce1eea78a2a5a86

--=-v35TuqA55CoW3PpRWa/2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk05fW0ACgkQPX1aK2wOHVgrIACggseGeM0q8/MmcYZLEZCKMgP5
BxIAniXR0FLeLK01kn2KbjWM8KBLhn+h
=lAau
-----END PGP SIGNATURE-----

--=-v35TuqA55CoW3PpRWa/2--
