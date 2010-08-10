Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Oii39-0003SH-Kd
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 08:11:02 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Oii2v-0003m7-Pr
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 10:10:46 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 10:10:42 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1281420092-883-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1281420092-883-1-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
Message-Id: <201008101010.45082.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode-native: bump version to 2010k
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
X-List-Received-Date: Tue, 10 Aug 2010 06:11:02 -0000
X-Groupsio-MsgNum: 22031
Content-Type: multipart/signed; boundary="nextPart2047599.oypunNi43x";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2047599.oypunNi43x
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 10 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2010 10:01:31 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Simon Busch =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> ---
>  recipes/tzcode/tzcode-native_2010j.bb |   16 ----------------
>  recipes/tzcode/tzcode-native_2010k.bb |   16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 16 deletions(-)
>  delete mode 100644 recipes/tzcode/tzcode-native_2010j.bb
>  create mode 100644 recipes/tzcode/tzcode-native_2010k.bb

"Signed-off-by" is missing in the first patch, please resend it with SOB=20
added.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2047599.oypunNi43x
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxg7WUACgkQXJ70z+XgVcNwRQCbBqN9NtOcm+7YIdvSyE6zw5B1
iLAAmwSPD5fiUIz0VxohHcY7UT3ndG8z
=SXxN
-----END PGP SIGNATURE-----

--nextPart2047599.oypunNi43x--
