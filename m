Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PXuOv-000415-Dv
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 12:41:06 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PXuOY-0006xD-Nx
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 14:40:43 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 14:40:38 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
	<201012291041.07466.roman@khimov.ru>
In-Reply-To: <201012291041.07466.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201012291440.41718.roman@khimov.ru>
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Wed, 29 Dec 2010 11:41:06 -0000
X-Groupsio-MsgNum: 27557
Content-Type: multipart/signed; boundary="nextPart3775617.yXUtJmyZDu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3775617.yXUtJmyZDu
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D1=F0=E5=E4=E0 29 =E4=E5=EA=E0=E1=
=F0=FF 2010 10:41:00 =E0=E2=F2=EE=F0 Roman I Khimov =ED=E0=EF=E8=F1=E0=EB:
> I've built libdatetime-perl for qemuarm/angstrom-2010.x yesterday with no
> problems. Rebuilding perl, perl-native and libdatetime-perl now with fresh
> pull from oe.dev and building with sheevaplug/minimal combination in
>  parallel. But it might be that clean build results would be different for
> sheevaplug/minimal.

Both built just fine, commit 45316c97133b75f6b9ceec9667749648c2046d4d,=20
configurations mentioned above.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3775617.yXUtJmyZDu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0bHjkACgkQXJ70z+XgVcMrbwCg59zhXnqq+TLDwfbXVQloFd4I
igEAoJ1CNEP3osPZEtbvLhyHRBMXsuD+
=F9xx
-----END PGP SIGNATURE-----

--nextPart3775617.yXUtJmyZDu--
