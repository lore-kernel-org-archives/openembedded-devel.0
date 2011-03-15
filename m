Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzPSe-0007vw-Aq for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 09:18:36 +0100
Received: from f053032095.adsl.alicedsl.de ([78.53.32.95]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzPR2-0007vH-RC for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 08:16:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300156772037897500@rkmorris.us>
References: <1300156772037897500@rkmorris.us>
Date: Tue, 15 Mar 2011 09:16:55 +0100
Message-ID: <1300177015.3759.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [solved] OpenEmbedded (Wiki) Web Site Down
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
X-List-Received-Date: Tue, 15 Mar 2011 08:18:36 -0000
X-Groupsio-MsgNum: 30215
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ga41T5/vtOiFYkdmQViu"

--=-ga41T5/vtOiFYkdmQViu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Russell,


Am Montag, den 14.03.2011, 21:39 -0500 schrieb Russell Morris:

> Just a heads up, but the Wiki / site seems to be down. Here is the error =
message that I receive (tried from two different PC's, on two different net=
works),
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Database error
>=20
> A database error has occurred
> Query: SELECT lc_value FROM `l10n_cache` WHERE lc_lang =3D 'en' AND lc_ke=
y =3D 'deps' LIMIT 1=20
> Function: LCStore_DB::get
> Error: 1146 Table 'oe_mediawiki.l10n_cache' doesn't exist (10.10.10.7)
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

it works for me now, so I guess the problem has been fixed.


Thanks,

Paul

--=-ga41T5/vtOiFYkdmQViu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1/IGsACgkQPX1aK2wOHVjyQwCeODL50QatNIts/nS5zGYFQSaL
1bsAoIF4ZVry0hncSEt3QPSXq//4o6cu
=f7UN
-----END PGP SIGNATURE-----

--=-ga41T5/vtOiFYkdmQViu--
