Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtyIZ-0007HU-Sx for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:49:59 +0200
Received: from f053044176.adsl.alicedsl.de ([78.53.44.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtyEE-0007U3-9c for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 08:45:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110818083723.GA6465@jama.jama.net>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
	<1313656223.4016.12.camel@mattotaupa>
	<20110818083723.GA6465@jama.jama.net>
Date: Thu, 18 Aug 2011 10:45:21 +0200
Message-ID: <1313657121.4016.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
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
X-List-Received-Date: Thu, 18 Aug 2011 08:50:00 -0000
X-Groupsio-MsgNum: 33686
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mr205QRlIWXr9zfde9Tg"

--=-mr205QRlIWXr9zfde9Tg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 18.08.2011, 10:37 +0200 schrieb Martin Jansa:
> On Thu, Aug 18, 2011 at 10:30:23AM +0200, Paul Menzel wrote:

[=E2=80=A6]

> > sorry for bothering. I do not have an overview yet. Could somebody
> > elaborate if such distribution overrides are now deprecated? Will that
> > patch be applied in the SHR layer?
>=20
> yes, distributions now have own layers to apply own patches and other
> changes with .bbappend
>=20
> the same should apply to machine overrides

Thank you for the explanation. So to find out if some distribution or
machine adapts something I might find interesting I need to look in all
layer (repositories) to find it instead of looking in one recipe. Is
there trick to do that or is that generally not needed?


Thanks,

Paul

--=-mr205QRlIWXr9zfde9Tg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5M0SEACgkQPX1aK2wOHVhgwgCghUwW5/rhZJVEYSNqyYYZF3JR
b6gAmwbE7/6uTq7spTmiVH+DpDdy8Pip
=02f/
-----END PGP SIGNATURE-----

--=-mr205QRlIWXr9zfde9Tg--
