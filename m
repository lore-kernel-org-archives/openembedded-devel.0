Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0HKK-0003Az-9Q for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 19:17:21 +0200
Received: from f053041104.adsl.alicedsl.de ([78.53.41.104]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0HKC-0003xv-2h for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 17:17:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik0xGJH-ebYzEXyP-Xka37DGHS4fjWywGmAdpfm@mail.gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-13-git-send-email-raj.khem@gmail.com>
	<1285578597.11101.12.camel@mattotaupa>
	<AANLkTik0xGJH-ebYzEXyP-Xka37DGHS4fjWywGmAdpfm@mail.gmail.com>
Date: Mon, 27 Sep 2010 19:17:11 +0200
Message-ID: <1285607831.11101.14.camel@mattotaupa>
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
Subject: Re: [PATCH 12/12] netbase: Add interface information for qemumips64 and qemumips64el
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
X-List-Received-Date: Mon, 27 Sep 2010 17:17:23 -0000
X-Groupsio-MsgNum: 24065
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9f4rP/u/rKPeq4YWgYpR"

--=-9f4rP/u/rKPeq4YWgYpR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 27.09.2010, 07:16 -0700 schrieb Khem Raj:
> On Mon, Sep 27, 2010 at 2:09 AM, Paul Menzel wrote:

[=E2=80=A6]

> > is there a way to share one interfaces file for all qemu configurations=
?
> >
>=20
> it could be made so but then I you wont be able to start more than one
> instance of networking enabled qemu with different machines easily

Good point!

> > If not, then this patch is
> >
> > Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-9f4rP/u/rKPeq4YWgYpR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyg0ZcACgkQPX1aK2wOHVikUQCfUh8W9fpMlkWXk3H7fKmscXS7
2/QAoIKhUgOT9gBlF9VeX3SruvCJ0cc3
=xA5x
-----END PGP SIGNATURE-----

--=-9f4rP/u/rKPeq4YWgYpR--
