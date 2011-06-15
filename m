Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpOW-0006IQ-U0 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:40:28 +0200
Received: from f053045092.adsl.alicedsl.de ([78.53.45.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpMJ-0003Gp-7s for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 12:38:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTi=Qkq50xcTwbC76wSiSKf1WR9AhKw@mail.gmail.com>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
	<1308132031.4304.9.camel@mattotaupa>
	<BANLkTi=Qkq50xcTwbC76wSiSKf1WR9AhKw@mail.gmail.com>
Date: Wed, 15 Jun 2011 14:37:03 +0200
Message-ID: <1308141423.7961.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [[meta-oe][PATCH 3/3] freerdp-extension-xpunlimited: bump SRCREV due library renaming
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
X-List-Received-Date: Wed, 15 Jun 2011 12:40:29 -0000
X-Groupsio-MsgNum: 32691
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WyObsBuDd50MbJAmKiLS"

--=-WyObsBuDd50MbJAmKiLS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 15.06.2011, 12:18 +0000 schrieb Otavio Salvador:
> On Wed, Jun 15, 2011 at 10:00, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > nitpick: I think it is due *to*.
>=20
> AFAIK Koen has already put it on his queue.

But he has not pushed them yet.

> > Additionally it would be nice, if you could be more elaborate what
> > library was renamed. An URL would be good enough.
>=20
> FreeRDP has not a big refactoring and thus libfreerdp has been renamed
> to libfreerdp-core.

Thank you.

> > Additionally in my opinion it would be great if you could add a short
> > note what build configuration you used for testing.
>=20
> I don't see this on commit messages comming to the ml; why is it need
> for this case?

It is not required. But I had enough cases where I had (build) problems
with commits and it would have saved me time to be able to reproduce a
successful build. That is why I ask for it when I do reviews.


Thanks,

Paul


--=-WyObsBuDd50MbJAmKiLS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk34p28ACgkQPX1aK2wOHVgwXgCfYJ8rwz6RcSHGikhJevyrA4e/
EdsAn1LTSXbppYZihytSYTri3WoYGhln
=2j5g
-----END PGP SIGNATURE-----

--=-WyObsBuDd50MbJAmKiLS--
