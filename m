Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIStb-0000XS-8e for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 23:49:11 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QISs9-0001H7-3w for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 21:47:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC46597.90606@cioinfoindus.fr>
References: <4DC2C5DA.10909@cioinfoindus.fr>
	<1304621939.18082.6.camel@mattotaupa> <4DC46597.90606@cioinfoindus.fr>
Date: Fri, 06 May 2011 23:46:30 +0200
Message-ID: <1304718390.3928.7.camel@mattotaupa>
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
X-List-Received-Date: Fri, 06 May 2011 21:49:11 -0000
X-Groupsio-MsgNum: 31669
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FX17U/2gTMKVhEARM+1y"

--=-FX17U/2gTMKVhEARM+1y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Freitag, den 06.05.2011, 23:18 +0200 schrieb Christian Charreyre:

> Le 05/05/2011 20:58, Paul Menzel a =C3=A9crit :
>=20
>=20
> [...]
>=20
> > I guess that information would be enough.
> >
> > I would think that the following printed by `bitbake mypaint` would be
> > enough. Maybe add the OE repository revision your distribution is based
> > on.
> >
> >          Build Configuration:
> >          BB_VERSION        =3D "1.12.0"
> >          METADATA_BRANCH   =3D "73593c5"
> >          METADATA_REVISION =3D "7f22ddc"
> >          TARGET_ARCH       =3D "arm"
> >          TARGET_OS         =3D "linux-gnueabi"
> >          MACHINE           =3D "beagleboard"
> >          DISTRO            =3D "angstrom"
> >          DISTRO_VERSION    =3D "v20110505"
> >          TARGET_FPU        =3D "hard"
>
> I'm using bitbake 1.8, that's the reason why these informations are not=
=20
> printed when I execute the recipe.

I see.

> Can I safely swap to bitbake 1.12.0 with recipes and classes quite old=
=20
> in my workspace ?
> Thanks for your advise on this point.

I am considering myself not knowledgeable enough to give any advises. I
can only say that I did not experience any problems switching to BitBake
1.12.0. I guess you just have to try. If you experienced any problems
you should open a new thread though.


Thanks,

Paul

--=-FX17U/2gTMKVhEARM+1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3EbDYACgkQPX1aK2wOHViquQCfQF3kxymr1agJcUlRbDZU/DWn
GTwAoIewQ0yp88LLzvwf3/1keDSg9Shm
=qbKY
-----END PGP SIGNATURE-----

--=-FX17U/2gTMKVhEARM+1y--
