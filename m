Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwHCx-0003MC-0p for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 18:21:11 +0200
Received: from f053044210.adsl.alicedsl.de ([78.53.44.210]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwHCA-00070O-Tu for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 16:20:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=VC0YNXYb4JfOtXrsyq_FWkXbxeg_aOXLYUnfZ@mail.gmail.com>
References: <4C90A7E1.4030401@dresearch.de> <4C91EF7C.7080209@dresearch.de>
	<1284633626.3825.52.camel@mattotaupa>
	<AANLkTi=VC0YNXYb4JfOtXrsyq_FWkXbxeg_aOXLYUnfZ@mail.gmail.com>
Date: Thu, 16 Sep 2010 18:20:21 +0200
Message-ID: <1284654021.3747.15.camel@mattotaupa>
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
X-List-Received-Date: Thu, 16 Sep 2010 16:21:11 -0000
X-Groupsio-MsgNum: 23654
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BXrg0m1ErNJ3BeD7mhgF"

--=-BXrg0m1ErNJ3BeD7mhgF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 16.09.2010, 14:12 +0200 schrieb Frans Meulenbroeks:
> 2010/9/16 Paul Menzel <paulepanter@users.sourceforge.net>:
> > Am Donnerstag, den 16.09.2010, 12:20 +0200 schrieb Steffen Sledz:
> >> Am 15.09.2010 13:02, schrieb Steffen Sledz:
> >> > Can't push my changes today. :(
> >> >
> >> >> git push -v upstream
> >> > Pushing to git://git.openembedded.net/openembedded
> >> > fatal: The remote end hung up unexpectedly
> >>
> >> Sorry, my mistake. Local configuration error.
> >>
> >> git://git.openembedded.net/openembedded vs. git@git.openembedded.org:o=
penembedded
> >
> > I do not have commit access so I have to use
> >
> >    git://git.openembedded.net/openembedded
> >
> > which is failing for me.
>=20
> For ro you can also try the repo.or.cz mirror (especially if you are in E=
U)

It looks like it is not up to date [1]. There are commits missing from
the =E2=80=9Cmaster=E2=80=9D repository. I guess it has the same problems a=
s I do.


Thanks,

Paul


[1] http://repo.or.cz/w/openembedded.git

--=-BXrg0m1ErNJ3BeD7mhgF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkySQ8UACgkQPX1aK2wOHVhHpwCgjZ0TLzc9kvobNbMVtYc0XDm8
r/oAn2fl1ri0cjKn9YCoQEMXTr0oYbhJ
=9mI+
-----END PGP SIGNATURE-----

--=-BXrg0m1ErNJ3BeD7mhgF--
