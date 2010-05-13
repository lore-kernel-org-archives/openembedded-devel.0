Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OCRQi-0002gf-CO
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 07:57:57 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OCRMv-0005da-A8
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 09:54:02 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 09:53:54 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
In-Reply-To: <alpine.DEB.2.00.1005121722300.14972@lynx>
MIME-Version: 1.0
Message-Id: <201005130953.59314.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 05:57:58 -0000
X-Groupsio-MsgNum: 19218
Content-Type: multipart/signed; boundary="nextPart9437361.HpaZjMkkmh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart9437361.HpaZjMkkmh
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 13 =D0=BC=D0=B0=D1=8F 2010 01:30=
:53 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Robert P. J. Day =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> * on http://wiki.openembedded.net/index.php/OEandYourDistro#Ubuntu,
> there's a reference to configuring for qemu-arm:
>=20
>   echo 128 > /proc/sys/vm/mmap_min_addr
>=20
> from memory, i always simply set that to zero on fedora.  is there
> something magic about the value 128?  at the moment, it's at the
> default value of 65536 on this ubuntu system.

With current qemu in OE mmap_min_addr tricks are not needed at all.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart9437361.HpaZjMkkmh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvrk/cACgkQXJ70z+XgVcPNWwCeKA88h4EHEgXfOHvNVK5kWa9g
4PIAoIK9S0xP/KSGx5UkxpPXZkyip2M/
=Z5BK
-----END PGP SIGNATURE-----

--nextPart9437361.HpaZjMkkmh--
