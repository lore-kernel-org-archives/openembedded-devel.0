Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwBu8-00061N-Qy for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 12:41:32 +0200
Received: from f053044210.adsl.alicedsl.de ([78.53.44.210]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwBtE-0007cc-PA for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 10:40:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C91EF7C.7080209@dresearch.de>
References: <4C90A7E1.4030401@dresearch.de>  <4C91EF7C.7080209@dresearch.de>
Date: Thu, 16 Sep 2010 12:40:26 +0200
Message-ID: <1284633626.3825.52.camel@mattotaupa>
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
Subject: Re: fatal: The remote end hung up unexpectedly
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
X-List-Received-Date: Thu, 16 Sep 2010 10:41:42 -0000
X-Groupsio-MsgNum: 23646
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4q/F0CZ/ZYUT/7xPYxQN"

--=-4q/F0CZ/ZYUT/7xPYxQN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 16.09.2010, 12:20 +0200 schrieb Steffen Sledz:
> Am 15.09.2010 13:02, schrieb Steffen Sledz:
> > Can't push my changes today. :(
> >=20
> >> git push -v upstream
> > Pushing to git://git.openembedded.net/openembedded
> > fatal: The remote end hung up unexpectedly
>=20
> Sorry, my mistake. Local configuration error.
>=20
> git://git.openembedded.net/openembedded vs. git@git.openembedded.org:open=
embedded

I do not have commit access so I have to use

    git://git.openembedded.net/openembedded

which is failing for me.

        $ git remote update
        Fetching origin
        git.openembedded.org[0: 140.211.169.165]: errno=3DConnection
        refused
        fatal: unable to connect a socket (Connection refused)
        error: Could not fetch origin
       =20

Thanks,

Paul

--=-4q/F0CZ/ZYUT/7xPYxQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyR9BoACgkQPX1aK2wOHVhMpACeKbU5H5/tMunXkLruj5vJWGvW
nZIAnjCQ1UhJBjRzhlVsSYTGuAymGIGP
=ETtJ
-----END PGP SIGNATURE-----

--=-4q/F0CZ/ZYUT/7xPYxQN--
