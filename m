Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpMT-000663-HV for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:38:21 +0200
Received: from f053045092.adsl.alicedsl.de ([78.53.45.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpKF-0003G6-Ue for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 12:36:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
	<1308131824.4304.6.camel@mattotaupa>
	<BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>
Date: Wed, 15 Jun 2011 14:34:54 +0200
Message-ID: <1308141294.7961.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 12:38:21 -0000
X-Groupsio-MsgNum: 32690
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Chvgmz5/riTuNx4zyOnm"

--=-Chvgmz5/riTuNx4zyOnm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 15.06.2011, 12:22 +0000 schrieb Otavio Salvador:
> On Wed, Jun 15, 2011 at 09:57, Paul Menzel wrote:
> > 2. Please add the necessary information to the commit message as
> > recommended in the commit message guidelines [1].
> >
> > As far as I can see you imported this recipe from oe.dev.
>=20
> In fact no ... it is based on an old version from OE that I changes to
> look like we're using today.

So you just changed the checksums and added the `LICENSE` field?

Could also please answer why setting `PE` is needed.

> But AFAIK it is on Koen queue already so too late to change.

Koen has not pushed them yet so it is not too late in my opinion.


Thanks,

Paul

--=-Chvgmz5/riTuNx4zyOnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk34pukACgkQPX1aK2wOHViDZgCXaUlT+zZmnKLDVraVVr6e7azM
/gCeJWF+DwQ9hEO3nUbPWo5IZvP8X30=
=P6+f
-----END PGP SIGNATURE-----

--=-Chvgmz5/riTuNx4zyOnm--
