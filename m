Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcJ0N-0003Zf-5n for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 15:45:55 +0100
Received: from f053035160.adsl.alicedsl.de ([78.53.35.160]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcIzv-0005zn-Kq; Mon, 10 Jan 2011 14:45:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D2B0D23.4070003@nospam.arcornews.de>
References: <1294585014.4036.47.camel@mattotaupa>
	<4D29FC65.9010608@gmail.com> <1294659553.4342.69.camel@mattotaupa>
	<4D2B0D23.4070003@nospam.arcornews.de>
Date: Mon, 10 Jan 2011 15:45:26 +0100
Message-ID: <1294670726.4342.72.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Dirk Opfer <dirk@opfer-online.de>
Subject: Re: [PATCH] libcap, libcap2: use automatic packaging to fix QA errors
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
X-List-Received-Date: Mon, 10 Jan 2011 14:45:55 -0000
X-Groupsio-MsgNum: 27869
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XksD27/TuYVqgU4BQH4H"

--=-XksD27/TuYVqgU4BQH4H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 10.01.2011, 21:44 +0800 schrieb Rolf Leggewie:
> On 10.01.2011 19:39, Paul Menzel wrote
> >>>          FILES_${PN} =3D "${libdir}"
> >>>          FILES_${PN}-dev =3D "${includedir}"
> >=20
> > I am putting Rolf into CC to get the reasoning for the previous
> > behavior.
>=20
> My commit did not change the previous behaviour as far as I can see and
> thus I cannot comment on it.

Sorry, I misinterpreted `git blame`.

> Maybe you want to look deeper into the history of that file.  Sorry.

It looks Dirk committed these lines when adding 1.10 in commit b823b4
[1].

Dirk, could you please comment on [2].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db823b49=
470515182cb6f7a536d6a63fac53948aa
[2] http://patches.openembedded.org/patch/218/

--=-XksD27/TuYVqgU4BQH4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0rG4YACgkQPX1aK2wOHVjD9QCffru80ACKhNEZOp4IQKEDMGtU
0MAAnR1HQEkt8VMVX+B7KOR8qau0nCJr
=VcSE
-----END PGP SIGNATURE-----

--=-XksD27/TuYVqgU4BQH4H--
