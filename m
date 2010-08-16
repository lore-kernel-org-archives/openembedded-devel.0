Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Ol5K9-0008VR-51
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:26:45 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Ol5Jq-00089u-1p
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 23:26:05 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 23:25:52 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
In-Reply-To: <AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008162325.59305.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Mon, 16 Aug 2010 19:26:46 -0000
X-Groupsio-MsgNum: 22275
Content-Type: multipart/signed; boundary="nextPart1625841.oTOVWFbK7m";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1625841.oTOVWFbK7m
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 16 =D0=
=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 22:59:53 =D0=B0=D0=B2=D1=82=D0=
=BE=D1=80 Frans Meulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> One small question: Do we want to keep this recipe at
> DEFAULT_PREFERENCE =3D "-1" ??

Well, we're using 1.0.0 since the day it's been released, and it's a perfec=
t=20
fit for us, but I know that it _might_ break some things, just google for=20
openssl 1.0.0 breakage/compatibility patches/etc, that's why I've pushed it=
=20
that way so that distro maintainers could test whether it works for them wi=
th=20
their particular package sets and act accordingly.

I certainly have nothing against removing that line if everyone is OK with=
=20
that.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1625841.oTOVWFbK7m
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxpkMcACgkQXJ70z+XgVcPfZQCgll9BynpfnFXACvRq/Q49z96j
py0AoKzv32BKT3S+Q6NX7SoysS0LManp
=Jx1d
-----END PGP SIGNATURE-----

--nextPart1625841.oTOVWFbK7m--
