Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QI3nu-0006Sk-O6 for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 21:01:38 +0200
Received: from f053036225.adsl.alicedsl.de ([78.53.36.225]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QI3mR-0002aZ-Ch for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 19:00:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC2C5DA.10909@cioinfoindus.fr>
References: <4DC2C5DA.10909@cioinfoindus.fr>
Date: Thu, 05 May 2011 20:58:59 +0200
Message-ID: <1304621939.18082.6.camel@mattotaupa>
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
X-List-Received-Date: Thu, 05 May 2011 19:01:38 -0000
X-Groupsio-MsgNum: 31639
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dBGKkRHiBzhevfeoCRiP"

--=-dBGKkRHiBzhevfeoCRiP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Donnerstag, den 05.05.2011, 17:44 +0200 schrieb Christian Charreyre:

> I've an additional question regarding build configuration :
>=20
> Le 04/05/2011 17:34, Eric B=C3=A9nard a =C3=A9crit :

> >  On 04/05/2011 10:56, Paul Menzel wrote:
> >>  Please remember to add what build configuration you used. (You can ju=
st
> >>  paste it from the BitBake output.)
> >>
> >  You asked this several times on the list but this part is not in the
> >  commit log policy :
> >  http://wiki.openembedded.org/index.php/Commit_log_example
>=20
> [...]
>=20
> how must build configuration described : which information to add,
> where, and how do I get it from bitbake output ?
>=20
> Can you give me an example ?
>=20
> For your information, my machine is derived from beagleboard (very few
> differences),

Great.

> and my distribution is derived from angstrom, because I'm
> building a complete distribution, not using a standard one.

I guess that information would be enough.

I would think that the following printed by `bitbake mypaint` would be
enough. Maybe add the OE repository revision your distribution is based
on.

        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "73593c5"
        METADATA_REVISION =3D "7f22ddc"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "v20110505"
        TARGET_FPU        =3D "hard"


Thanks,

Paul

--=-dBGKkRHiBzhevfeoCRiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk3C83MACgkQPX1aK2wOHVgj7QCWOaYqFNkjmOlvjxScm0q3G/yb
WwCffbe5hRateASPQISLIviRVQNN154=
=ng9C
-----END PGP SIGNATURE-----

--=-dBGKkRHiBzhevfeoCRiP--
