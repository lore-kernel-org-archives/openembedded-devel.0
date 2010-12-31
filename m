Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PYfpv-00037W-FZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 15:20:07 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PYfpZ-0007Bi-3y
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 17:19:46 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 17:19:36 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293803369.6161.23.camel@mattotaupa>
In-Reply-To: <1293803369.6161.23.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201012311719.43538.roman@khimov.ru>
Subject: Re: perl program breakage: `Can't locate Config_heavy-arm-oe-linux-gnueabi.pl`
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
X-List-Received-Date: Fri, 31 Dec 2010 14:20:07 -0000
X-Groupsio-MsgNum: 27607
Content-Type: multipart/signed; boundary="nextPart1360691.u0Nk3QfdKM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1360691.u0Nk3QfdKM
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =CF=FF=F2=ED=E8=F6=E0 31 =E4=E5=EA=
=E0=E1=F0=FF 2010 16:49:29 =E0=E2=F2=EE=F0 Paul Menzel =ED=E0=EF=E8=F1=E0=
=EB:
>         $ more libhtml-treebuilder-perl-3.23-r4/temp/log.do_configure.282=
13
>         Can't locate Config_heavy-arm-oe-linux-gnueabi.pl in @INC (@INC

Should be fixed by 2be79cc83040d2540f41c9224baa76a388f194c5. Sorry for the=
=20
breakage.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1360691.u0Nk3QfdKM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0d5n8ACgkQXJ70z+XgVcMGSACgomzZB2W+iC6Y+jXrmElVTzr0
HuoAniOxGBMm8SPjBY2tvXbk+73KGgy0
=vnrh
-----END PGP SIGNATURE-----

--nextPart1360691.u0Nk3QfdKM--
