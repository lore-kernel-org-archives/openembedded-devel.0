Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr5vP-0005lW-70 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:45:27 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr5sV-0001cj-Hh for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:42:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003150510.16376.holger+oe@freyther.de>
References: <1268609269.3809.7.camel@mattotaupa>
	<201003150510.16376.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 09:42:21 +0100
Message-ID: <1268642542.3759.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libmusicbrainz: Include header to fix build with g++ 4.4.
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
X-List-Received-Date: Mon, 15 Mar 2010 08:45:27 -0000
X-Groupsio-MsgNum: 17623
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-s1SdQjREQqcONOkhAEyz"

--=-s1SdQjREQqcONOkhAEyz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 15.03.2010, 05:10 +0100 schrieb Holger Hans Peter Freyther:
> On Monday 15 March 2010 00:27:49 Paul Menzel wrote:
> > Patch taken from [1] and adapted.
> >=20
> > [1] http://bugs.musicbrainz.org/ticket/4301
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> thanks... do you have commit access by now?

No I do not. It would be great if you could commit this patch.


Thanks,

Paul

--=-s1SdQjREQqcONOkhAEyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkud8u0ACgkQPX1aK2wOHVh3lwCfVuOrZI4Y+seqRJ1dL358pKyf
jYwAn3Lqfn6PmdIQaE5m455B6vm7NSIN
=iqy4
-----END PGP SIGNATURE-----

--=-s1SdQjREQqcONOkhAEyz--
