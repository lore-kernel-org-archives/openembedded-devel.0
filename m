Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1PFCN1-0000R2-Bq
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 22:01:48 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PFCM8-000672-QP
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 00:00:53 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Nov 2010 00:00:48 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1288774920.3980.29.camel@mattotaupa>
	<201011071932.02392.khimov@altell.ru>
	<1289158359.3878.22.camel@mattotaupa>
In-Reply-To: <1289158359.3878.22.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011080000.52045.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: perl_5.8.8: fails with `ld: cannot find -lnsl` (was: libprelude: minimal-uclibc: task `install` fails with `sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No such file or directory`)
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
X-List-Received-Date: Sun, 07 Nov 2010 21:01:48 -0000
X-Groupsio-MsgNum: 26005
Content-Type: multipart/signed; boundary="nextPart1640499.GIL2BW7AGL";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1640499.GIL2BW7AGL
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =C2=EE=F1=EA=F0=E5=F1=E5=ED=FC=E5 07=
 =ED=EE=FF=E1=F0=FF 2010 22:32:39 =E0=E2=F2=EE=F0 Paul Menzel =ED=E0=EF=E8=
=F1=E0=EB:
> What is `-lnsl`?
>=20
> `perl` builds just fine for me. I tried it again with a clean temporary
> directory. My build host runs Debian Squeeze.

Lenny here, and although in theory it shouldn't matter, it's 100% reproduci=
ble=20
for me. I'd recommend you at least to try newer perl.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1640499.GIL2BW7AGL
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkzXE4QACgkQXJ70z+XgVcNRtQCeK6MJ9bawlsuq1oKHwxR99tKp
O+AAoJ+UFIzHhPinzr+rPEtyU1fE4A94
=/q1n
-----END PGP SIGNATURE-----

--nextPart1640499.GIL2BW7AGL--
