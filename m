Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oq71k-0002gX-Bn for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:16:09 +0200
Received: from g225140092.adsl.alicedsl.de ([92.225.140.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oq71G-0004rj-Cm for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 16:15:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201008301808.10029.marcin@juszkiewicz.com.pl>
References: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
	<201008301808.10029.marcin@juszkiewicz.com.pl>
Date: Mon, 30 Aug 2010 18:15:35 +0200
Message-ID: <1283184935.3795.27.camel@mattotaupa>
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
Subject: Re: branch namespace clutter
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
X-List-Received-Date: Mon, 30 Aug 2010 16:16:09 -0000
X-Groupsio-MsgNum: 22913
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Tw/bi/zWHNPMqzMdy4wh"

--=-Tw/bi/zWHNPMqzMdy4wh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 30.08.2010, 18:08 +0200 schrieb Marcin Juszkiewicz:
> Dnia poniedzia=C5=82ek, 30 sierpnia 2010 o 17:56:52 Cliff Brake napisa=C5=
=82(a):

> > If there are any branches in the OE git repo that are no longer in
> > use, please let me know and I'll delete them.  Our branch namespace is
> > getting rather cluttered.
>=20
> Drop:
> hrw/linux-updates
>=20
> Most of those >1y old branches got merged or are totally obsolete.

I think creators of these branches can delete those themselves.

	git push origin :hrw/linux-updates

Where origin is the name of the remote OE repository.


Thanks,

Paul

--=-Tw/bi/zWHNPMqzMdy4wh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx72ScACgkQPX1aK2wOHVjRegCcC/kzAnJt2Og5KLtX6H0v+2gG
DJoAn2fVFKRByDdWXDR4oxPsbI0Np/8q
=JWFt
-----END PGP SIGNATURE-----

--=-Tw/bi/zWHNPMqzMdy4wh--
