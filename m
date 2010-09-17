Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwWs7-0003Ux-TD for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 11:04:44 +0200
Received: from f053032065.adsl.alicedsl.de ([78.53.32.65]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwWrK-0007Ys-U5 for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 09:03:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284713102.3861.3.camel@mattotaupa>
References: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
	<4C91D544.7070702@dresearch.de>
	<AANLkTinQbPD21+gAvEoBEn3KaPUvz3cK4u9+LjkL1JqC@mail.gmail.com>
	<AANLkTinb2TrxJtgb5T6eQXOM6obNmBq-moJBfeCm_1-j@mail.gmail.com>
	<1284713102.3861.3.camel@mattotaupa>
Date: Fri, 17 Sep 2010 11:03:53 +0200
Message-ID: <1284714233.3861.4.camel@mattotaupa>
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
Subject: Re: [solved/over] melo git outage
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
X-List-Received-Date: Fri, 17 Sep 2010 09:04:44 -0000
X-Groupsio-MsgNum: 23667
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-t0pDo8AvHTJmfl61Rh1m"

--=-t0pDo8AvHTJmfl61Rh1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 17.09.2010, 10:45 +0200 schrieb Paul Menzel:
> Am Donnerstag, den 16.09.2010, 20:56 -0700 schrieb Steve Sakoman:
>=20
> [=E2=80=A6]
>=20
> > Unfortunately for many others it is still broken:
> >=20
> > steve@www:~/openembedded$ git pull
> > git.openembedded.org[0: 140.211.169.165]: errno=3DConnection refused
> > fatal: unable to connect a socket (Connection refused)
>=20
> It looks like the Git Daemon is not running (?), since SSH access is
> working.
>=20
> > Is anyone working on this?

It is working for me now!

Thank you to everyone having been involved in getting this done!


Thanks,

Paul

--=-t0pDo8AvHTJmfl61Rh1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyTLvkACgkQPX1aK2wOHVgMfACeMFntUEK4twxOMjv5mUmGVZgm
7UwAn1+mG3kfn9SQc7mjMMGJBiv6uOd5
=DjNa
-----END PGP SIGNATURE-----

--=-t0pDo8AvHTJmfl61Rh1m--
