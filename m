Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4r9L-00077u-1M for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 10:20:55 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4r8y-0005zq-IX for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 08:20:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286664909.15886.13.camel@saphir>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir>
Date: Sun, 10 Oct 2010 10:20:31 +0200
Message-ID: <1286698831.3808.2.camel@mattotaupa>
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
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sun, 10 Oct 2010 08:20:58 -0000
X-Groupsio-MsgNum: 24592
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iDmpZc8mPZgl0Np8PsHH"

--=-iDmpZc8mPZgl0Np8PsHH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 00:55 +0200 schrieb Michael 'Mickey' Lauer:
> Am Samstag, den 09.10.2010, 22:58 +0200 schrieb Frans Meulenbroeks:
> > libgee-native configure is failing:
> > http://tinderbox.openembedded.net/public/logs/task/8568667.txt
>=20
> Does it contain 72c2ac940065948cb688fde821e51efac6b71b4b, which was
> supposed to fix that?

That is the exact same issues I reported 12 hours earlier [1].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5222.html
    "DEPENDS not honored: `do_configure` runs before `do_populate_sysroot` =
of dependencies"

--=-iDmpZc8mPZgl0Np8PsHH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyxd0gACgkQPX1aK2wOHVhp6gCfZ4Z7YcQzttuJYHzC1utJbxvq
QEoAn0OT2RU37fJNw+qfztqEIMZrMiry
=89bx
-----END PGP SIGNATURE-----

--=-iDmpZc8mPZgl0Np8PsHH--
