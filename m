Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Okyui-00048J-UP for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 14:35:41 +0200
Received: from f053039031.adsl.alicedsl.de ([78.53.39.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OkyuT-00037r-Hi for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 12:35:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=xMwTUONg0ugaR29hnJr8-tGcMUsd6JsQb0aat@mail.gmail.com>
References: <AANLkTi=immHiyS5p0WWmCYaii-5xBruCuBi3_jC_s5Pw@mail.gmail.com>
	<AANLkTimLboPPcFegwhZJswLr2cpYayryZMS6zu0SVn9E@mail.gmail.com>
	<AANLkTi=xMwTUONg0ugaR29hnJr8-tGcMUsd6JsQb0aat@mail.gmail.com>
Date: Mon, 16 Aug 2010 14:35:20 +0200
Message-ID: <1281962120.3911.53.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Unable to build system
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
X-List-Received-Date: Mon, 16 Aug 2010 12:35:41 -0000
X-Groupsio-MsgNum: 22235
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Cum+ceXzQ8OyRl49Ebn4"

--=-Cum+ceXzQ8OyRl49Ebn4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.08.2010, 17:18 +0530 schrieb Kousik Maiti:
> Thanks Frans.
>=20
> But now I am facing another problem.

Please open a now thread for each new problem and use a precise and
descriptive subject line.

> bitbake task-base
> /var/lib/python-support/python2.6/bb/COW.py:30: DeprecationWarning: the s=
ets
> module is deprecated
>   import os, types, sets
> ERROR: no files to build.
>=20
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.

[=E2=80=A6]

> I have changed into /usr/share/bitbake/conf/bitbake.conf according to
> http://forums.xkcd.com/viewtopic.php?f=3D20&t=3D50227
>=20
> Can anybody help???

BitBake does not find your recipes, so the paths are set up incorrectly.
Double check that please. If you do not get it too work, please paste a
link to the tutorial you followed, attach your config files and an
overview of your directory setup.


Thanks,

Paul

--=-Cum+ceXzQ8OyRl49Ebn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxpMIgACgkQPX1aK2wOHVi/3wCeLHV7bJ58FHcfO2ge/9QqJTnn
euQAn1378EVnrJWlKntTbtRYHus7AsNJ
=08+u
-----END PGP SIGNATURE-----

--=-Cum+ceXzQ8OyRl49Ebn4--
