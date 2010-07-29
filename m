Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OeLua-0003vk-KZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 07:44:09 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OeLuC-000247-Ql
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 09:43:48 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 09:43:36 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <i1chst$tq5$1@dough.gmane.org> <4C50D9DB.1070006@mentor.com>
In-Reply-To: <4C50D9DB.1070006@mentor.com>
MIME-Version: 1.0
Message-Id: <201007290943.42512.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Thu, 29 Jul 2010 05:44:10 -0000
X-Groupsio-MsgNum: 21573
Content-Type: multipart/signed; boundary="nextPart11993574.DLeFy2lYyO";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart11993574.DLeFy2lYyO
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 29 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 05:31:07 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> bitbake.conf: Unexport LIBC from the environment
>=20
> As spoted by Koen at least perl makes use of LIBC coming from the
> environment to be meaningful, so don't export it as it doesn't match our
> meaning.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart11993574.DLeFy2lYyO
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxRFQ4ACgkQXJ70z+XgVcP+UACg4X8iykTzryRiszsshXopqlJa
KdkAn2zkg3U/9U1JGbq3xhVpAWpAHyra
=G7kj
-----END PGP SIGNATURE-----

--nextPart11993574.DLeFy2lYyO--
