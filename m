Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NzxFJ-0006mJ-4n
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 21:18:35 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NzxBw-0003RH-Gx
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 23:15:05 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Apr 2010 23:11:42 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
	<1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
Message-Id: <201004082311.48792.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode-native_2010f: Update tzdata SRC_URI and checksum
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
X-List-Received-Date: Thu, 08 Apr 2010 19:18:35 -0000
X-Groupsio-MsgNum: 18511
Content-Type: multipart/signed; boundary="nextPart2307855.5HgndZqu1F";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2307855.5HgndZqu1F
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 08 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 13:30:02 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Antonio Ospite =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> -	ftp://elsie.nci.nih.gov/pub/tzdata2010g.tar.gz;name=3Dtzdata-2010g \
> +	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=3Dtzdata-2010h \
=2E.........
>  +SRC_URI[tzdata-2010g.md5sum] =3D "d384ac091e6d56802f9b3e6b3d3f0f2e"
>  +SRC_URI[tzdata-2010g.sha256sum] =3D
>  "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"

Actually, it should be "SRC_URI[tzdata-2010h...]", fixed and pushed.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2307855.5HgndZqu1F
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAku+KnQACgkQXJ70z+XgVcPRTQCfd/hOUR610cJz5gXeKP05bQjC
SmcAoIiNFhftyjM7sFFtBaKriLWFckI8
=us3+
-----END PGP SIGNATURE-----

--nextPart2307855.5HgndZqu1F--
