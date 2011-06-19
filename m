Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYOLc-0004Ln-I7 for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 22:11:57 +0200
Received: from f053044243.adsl.alicedsl.de ([78.53.44.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYOIH-0002hy-Io for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 20:08:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DFE4918.9000800@gravedo.de>
References: <1308477368.18748.7.camel@mattotaupa> <4DFE4918.9000800@gravedo.de>
Date: Sun, 19 Jun 2011 22:08:25 +0200
Message-ID: <1308514105.4141.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] shiboken: Add `apiextrator-native` to `DEPENDS`
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
X-List-Received-Date: Sun, 19 Jun 2011 20:11:57 -0000
X-Groupsio-MsgNum: 32757
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-t9ocYR1MQAXilv0c47CD"

--=-t9ocYR1MQAXilv0c47CD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 19.06.2011, 21:08 +0200 schrieb Simon Busch:
> On 19.06.2011 11:56, Paul Menzel wrote:
> > unfortunately I am not able to test this, because of Qt4 build problems=
 [1].=20
> > Could you please test this.
>=20
> I gave this a quick run an I am fine with it. You can put my
>=20
> Acked-by: Simon Busch <morphis@gravedo.de>
>=20
> below the commit.

Thank you. I pushed it in 1b9260e7 [1] and updated the state in the
patch queue.

	$ ~/src/patchwork/apps/patchwork/bin/pwclient update -s Accepted -c 1b9260=
e7a6c756d6938821f013a41c371065980a 6125


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1b9260e=
7a6c756d6938821f013a41c371065980a

--=-t9ocYR1MQAXilv0c47CD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3+VzkACgkQPX1aK2wOHViLOgCggrRJalpcs5jyDOjfnBY8HisJ
lPkAnjf+Bgf3PhkUNngnxA5HvgdCkH2Z
=KXeV
-----END PGP SIGNATURE-----

--=-t9ocYR1MQAXilv0c47CD--
