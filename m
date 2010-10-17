Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7XBE-0007su-N3 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 19:37:57 +0200
Received: from f053038064.adsl.alicedsl.de ([78.53.38.64]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7XAk-0007rw-Gh for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 17:37:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CBB3187.6010100@eukrea.com>
References: <FD3ED125-4701-4F36-88EA-E70AAB057103@chumby.com>
	<4CBB3187.6010100@eukrea.com>
Date: Sun, 17 Oct 2010 19:37:23 +0200
Message-ID: <1287337043.3748.16.camel@mattotaupa>
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
Subject: Re: [PATCH v2] live555: Add version 20101015 and remove older versions
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
X-List-Received-Date: Sun, 17 Oct 2010 17:37:58 -0000
X-Groupsio-MsgNum: 24985
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-A9rDXm0PI/3Y6qmNRZy2"

--=-A9rDXm0PI/3Y6qmNRZy2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Sonntag, den 17.10.2010, 19:25 +0200 schrieb Eric B=C3=A9nard:

> Le 17/10/2010 19:05, Sean Cross a =C3=A9crit :
> > Live555 gets downloaded from http://www.live555.com/liveMedia/public/ b=
ut they only have the latest version available.  This patch adds support fo=
r the latest version, and removes older packages which cannot build due to =
missing tarballs.
> >
> > ---
> >   recipes/live555/live555_20051005.bb |   26 --------------------
> >   recipes/live555/live555_20090602.bb |   45 --------------------------=
---------
> >   recipes/live555/live555_20100409.bb |    7 -----
> >   recipes/live555/live555_20100529.bb |    7 -----
> >   recipes/live555/live555_20101015.bb |    7 +++++++
> >   5 files changed, 7 insertions(+), 85 deletions(-)
> >   delete mode 100644 recipes/live555/live555_20051005.bb
> >   delete mode 100644 recipes/live555/live555_20090602.bb
> >   delete mode 100644 recipes/live555/live555_20100409.bb
> >   delete mode 100644 recipes/live555/live555_20100529.bb
> >   create mode 100644 recipes/live555/live555_20101015.bb
> >
> 2010.05.29 & 2010.04.09 & 2009.06.02 are mirrored on angstrom's sources m=
irror :
> http://www.angstrom-distribution.org/unstable/sources/

Do you need the recipes for the old versions?


Thanks,

Paul

--=-A9rDXm0PI/3Y6qmNRZy2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky7NFMACgkQPX1aK2wOHVgJBgCfWyjanoqmIc8eBjRMqaU1l2Q+
jcMAoIuEpCd/15XGgDaMHlWjSrQs1lCm
=Az/1
-----END PGP SIGNATURE-----

--=-A9rDXm0PI/3Y6qmNRZy2--
