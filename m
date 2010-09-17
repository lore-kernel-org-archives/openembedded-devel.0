Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwWZt-0006io-Ar for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 10:45:53 +0200
Received: from f053032065.adsl.alicedsl.de ([78.53.32.65]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwWZ6-0007G7-5u for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 08:45:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinb2TrxJtgb5T6eQXOM6obNmBq-moJBfeCm_1-j@mail.gmail.com>
References: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
	<4C91D544.7070702@dresearch.de>
	<AANLkTinQbPD21+gAvEoBEn3KaPUvz3cK4u9+LjkL1JqC@mail.gmail.com>
	<AANLkTinb2TrxJtgb5T6eQXOM6obNmBq-moJBfeCm_1-j@mail.gmail.com>
Date: Fri, 17 Sep 2010 10:45:02 +0200
Message-ID: <1284713102.3861.3.camel@mattotaupa>
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
Subject: Re: melo git outage
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
X-List-Received-Date: Fri, 17 Sep 2010 08:45:53 -0000
X-Groupsio-MsgNum: 23666
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tbz05eN8MUcgBawhdHsY"

--=-tbz05eN8MUcgBawhdHsY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 16.09.2010, 20:56 -0700 schrieb Steve Sakoman:

[=E2=80=A6]

> Unfortunately for many others it is still broken:
>=20
> steve@www:~/openembedded$ git pull
> git.openembedded.org[0: 140.211.169.165]: errno=3DConnection refused
> fatal: unable to connect a socket (Connection refused)

It looks like the Git Daemon is not running (?), since SSH access is
working.

> Is anyone working on this?


Thanks,

Paul

--=-tbz05eN8MUcgBawhdHsY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyTKocACgkQPX1aK2wOHVh7cACfZGsiwxvew9v9Cxe18uDAp0sd
3VsAnibNLUYNHk1wge8cc13mICsfP5v5
=5aYy
-----END PGP SIGNATURE-----

--=-tbz05eN8MUcgBawhdHsY--
