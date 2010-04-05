Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NysPM-0006NF-RX
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 21:56:30 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NysM4-0000lc-Vt
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 23:53:10 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Apr 2010 23:49:46 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1268415992-19603-3-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1268415992-19603-3-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201004052349.55933.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] sane-toolchain: add PREFERRED_UCLIBC_VERSION
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
X-List-Received-Date: Mon, 05 Apr 2010 19:56:30 -0000
X-Groupsio-MsgNum: 18428
Content-Type: multipart/signed; boundary="nextPart3137647.I9IqVYBI62";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3137647.I9IqVYBI62
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 12 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 20:46:31 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fischer=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  conf/distro/include/sane-toolchain-uclibc.inc |    7 +++++++
>  conf/distro/include/sane-toolchain.inc        |    3 +--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3137647.I9IqVYBI62
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAku6PuMACgkQXJ70z+XgVcPNSQCfcm4C6B4oSennxTbH3cHeajtB
cM8AoIYG13PPRjY60EmxMAoO4pldffGt
=E7X0
-----END PGP SIGNATURE-----

--nextPart3137647.I9IqVYBI62--
