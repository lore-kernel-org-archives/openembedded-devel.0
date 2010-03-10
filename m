Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NpGRv-0000BC-1K
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 08:35:30 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NpGP4-00089V-Hm
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 10:32:27 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Mar 2010 10:30:14 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003082201.30147.roman@khimov.ru>
	<201003092200.18460.roman@khimov.ru>
	<19c1b8a91003091426j2d226a43yc2e3635d1af3706@mail.gmail.com>
In-Reply-To: <19c1b8a91003091426j2d226a43yc2e3635d1af3706@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003101030.17054.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Wed, 10 Mar 2010 07:35:31 -0000
X-Groupsio-MsgNum: 17447
Content-Type: multipart/signed; boundary="nextPart1398392.WQmlOKYAqG";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1398392.WQmlOKYAqG
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 10 =CD=C1=D2=D4=C1 2=
010 01:26:34 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
> 2010/3/9 Roman I Khimov <roman@khimov.ru>:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 09 =CD=C1=
=D2=D4=C1 2010 21:50:35 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
> >> sanity: remove /proc/sys/vm/mmap_min_addr check
> >> will older kernels like 2.6.21 etc. work well with newer qemu and wont
> >> require this check?
> >
> > Well, as commit message says, 2.6.26 was also tested and worked fine wi=
th
> > qemu 0.12.3 with three different mmap_min_addr-es.
>=20
> well I have boxes with 2.6.21 but I can know by doing :)

I think it should be fine, but try it out, of course.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1398392.WQmlOKYAqG
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuXSokACgkQXJ70z+XgVcNF0wCg0p0KyQPljPwTZLLwMOW34MZa
ROQAoN7Oipapj4CvkbfJ8WfY5b1g6byQ
=NLCb
-----END PGP SIGNATURE-----

--nextPart1398392.WQmlOKYAqG--
