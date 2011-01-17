Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenZn-0002Nr-Jy for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 12:48:47 +0100
Received: from f053038247.adsl.alicedsl.de ([78.53.38.247]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PenZE-0000rw-GB for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 11:48:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ih0tpc$ra$2@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>
	<ih0tpc$ra$2@dough.gmane.org>
Date: Mon, 17 Jan 2011 12:48:11 +0100
Message-ID: <1295264891.4844.57.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/3] libomxil-bellagio: cosmetics: unify recipes
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
X-List-Received-Date: Mon, 17 Jan 2011 11:48:47 -0000
X-Groupsio-MsgNum: 28094
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-wwkCjjonkEmaLmlZJyJR"

--=-wwkCjjonkEmaLmlZJyJR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 17.01.2011, 09:14 +0100 schrieb Koen Kooi:
> On 17-01-11 00:32, Paul Menzel wrote:
> > Date: Sun, 16 Jan 2011 23:34:08 +0100
> >=20
> > Just reorder the lines to be consistent throughout all recipes and to a=
dhere to the style guide [1].
> >=20
> > [1] http://wiki.openembedded.org/index.php/Styleguide
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> >  recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ++----
> >  recipes/openmax/libomxil-bellagio_0.9.1.bb |   10 ++++------
>=20
>=20
> FWIW, the above two aren't used and can get deleted, I suspect they
> don't even build against our recent ffmpeg

Is it alright to send a follow-up patch after this patch series has been
committed?

> >  recipes/openmax/libomxil-bellagio_0.9.2.bb |   10 ++++------

Just for my interest, what is the reason to use 0.9.2 instead of
0.9.2.1?

[=E2=80=A6]


Thanks,

Paul

--=-wwkCjjonkEmaLmlZJyJR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk00LHsACgkQPX1aK2wOHViSpQCfensEpBfH9v84PMHnk59i4oq+
TIIAn1fbs/5XJRl7wmSDaihg2SGJlCC9
=KTZZ
-----END PGP SIGNATURE-----

--=-wwkCjjonkEmaLmlZJyJR--
