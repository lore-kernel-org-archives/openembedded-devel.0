Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2Mhe-0007Pa-Cj for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:58:18 +0100
Received: from f053045005.adsl.alicedsl.de ([78.53.45.5] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2Mft-00026k-Lm for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 11:56:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
	<AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
Date: Wed, 23 Mar 2011 12:56:28 +0100
Message-ID: <1300881388.4101.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Wed, 23 Mar 2011 11:58:18 -0000
X-Groupsio-MsgNum: 30550
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7HcoIpnxdSJxm0SMwrGt"

--=-7HcoIpnxdSJxm0SMwrGt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 23.03.2011, 08:51 -0300 schrieb Otavio Salvador:
> On Tue, Mar 22, 2011 at 19:55, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > What kind of error do you get? The recipe build fine for me using
> > `angstrom-2010.x` for `MACHINE =3D "beagleboard"`.
>=20
> It fails to find lua.h so probably you had it built due other dependency.

No, I made a clean build, i. e. `rm -rf angstrom-dev`. Please post your
build configuration.


Thanks,

Paul

--=-7HcoIpnxdSJxm0SMwrGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2J3+wACgkQPX1aK2wOHVh6jQCcDAus98Gy4lz/nTRjCkdUeEmE
HaAAn3nqW5QHfmUMNNbLkMFvySv5XwwQ
=OTcF
-----END PGP SIGNATURE-----

--=-7HcoIpnxdSJxm0SMwrGt--
