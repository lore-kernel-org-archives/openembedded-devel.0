Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QI3ka-00060F-PT for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 20:58:12 +0200
Received: from f053036225.adsl.alicedsl.de ([78.53.36.225]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QI3j7-0002Zk-3z for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 18:56:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC2C611.8010408@cioinfoindus.fr>
References: <4DC2C611.8010408@cioinfoindus.fr>
Date: Thu, 05 May 2011 20:55:33 +0200
Message-ID: <1304621733.18082.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Thu, 05 May 2011 18:58:12 -0000
X-Groupsio-MsgNum: 31638
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qd526d6dsVZjKXDAU5Vc"

--=-qd526d6dsVZjKXDAU5Vc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Donnerstag, den 05.05.2011, 17:45 +0200 schrieb Christian Charreyre:
> Le 04/05/2011 10:56, Paul Menzel a =C3=A9crit :

[=E2=80=A6]

> I think your right, I have tried to update correctly DEPENDS, but as
> swig-native was already there for me I've missed it.
>=20
> Thanks for your patience to review it and teach me good practices....
>=20
> Do I submit a v5 with DEPENDS updated ?

since you know acknowledged my suggestion I will amend your patch and
commit it tomorrow. I will add my build configuration, `angstrom-2010.x`
and `minimal{,-uclibc}` for `MACHINE =3D "beagleboard"`.


Thank you very much again,

Paul

--=-qd526d6dsVZjKXDAU5Vc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3C8p8ACgkQPX1aK2wOHVjbTACfSvIUeCwXWr0g7FlhIvoXKUwW
TjQAnRP31Rr357Aks3XbwQ+0X/wENi++
=VYvc
-----END PGP SIGNATURE-----

--=-qd526d6dsVZjKXDAU5Vc--
