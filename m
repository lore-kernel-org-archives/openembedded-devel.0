Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrKXD-0002jk-NB for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 01:21:24 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrKUJ-0003DX-L8 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 00:18:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268694629.16974.52.camel@mattotaupa>
References: <1268692500.16974.50.camel@mattotaupa>
	<1268694629.16974.52.camel@mattotaupa>
Date: Tue, 16 Mar 2010 01:18:21 +0100
Message-ID: <1268698701.16974.55.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2 v2] ffmpeg: Stage `attributes.h` and `avconfig.h`.
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
X-List-Received-Date: Tue, 16 Mar 2010 00:21:24 -0000
X-Groupsio-MsgNum: 17701
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-183WF6k+s6p3W6bBz6Rr"

--=-183WF6k+s6p3W6bBz6Rr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 16.03.2010, 00:10 +0100 schrieb Paul Menzel:
> Some programs as `libvalhalla` need those headers.
>=20
> v2: Also stage `avconfig.h`.

That did not work, since `avconfig.h` is built.

So please scratch this version and please apply the one Mon, 15 Mar 2010
23:35:00 +0100. I will send a separate patch for `avconfig.h`.


Thanks,

Paul

--=-183WF6k+s6p3W6bBz6Rr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuezk0ACgkQPX1aK2wOHVjmSwCfb/qLdCXcDPGUUADt6jyoR5Qc
VxYAn1vg8bCKAMqCIsY0F7L6QMQ1hijA
=Dld+
-----END PGP SIGNATURE-----

--=-183WF6k+s6p3W6bBz6Rr--
