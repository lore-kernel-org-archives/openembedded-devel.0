Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Np4k7-0004uH-P1
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 20:05:28 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Np4hH-0007Bf-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 22:02:28 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Mar 2010 22:00:13 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003082201.30147.roman@khimov.ru>
	<201003091648.15596.khimov@altell.ru>
	<19c1b8a91003091050g2558abb9he0a5633205ba2dc8@mail.gmail.com>
In-Reply-To: <19c1b8a91003091050g2558abb9he0a5633205ba2dc8@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003092200.18460.roman@khimov.ru>
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
X-List-Received-Date: Tue, 09 Mar 2010 19:05:28 -0000
X-Groupsio-MsgNum: 17432
Content-Type: multipart/signed; boundary="nextPart1954371.TZOtsmD2Ku";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1954371.TZOtsmD2Ku
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 09 =CD=C1=D2=
=D4=C1 2010 21:50:35 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
> On Tue, Mar 9, 2010 at 5:48 AM, Roman Khimov <khimov@altell.ru> wrote:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=
=CB 08 =CD=C1=D2=D4=C1 2010 22:01:20 =C1=D7=D4=CF=D2 Roman I Khimov
> >
> > =CE=C1=D0=C9=D3=C1=CC:
> >> Comments are welcome.
> >
> > More ACK's are welcome also, since this touches sanity and qemu.
>=20
> sanity: remove /proc/sys/vm/mmap_min_addr check
> will older kernels like 2.6.21 etc. work well with newer qemu and wont
> require this check?

Well, as commit message says, 2.6.26 was also tested and worked fine with q=
emu=20
0.12.3 with three different mmap_min_addr-es.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1954371.TZOtsmD2Ku
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuWmsIACgkQXJ70z+XgVcNsAwCfQ46wuxcOzIUpJx401nSd0bc5
wHUAnitheR34juOY0j2rbTZKakACkOdH
=yq7X
-----END PGP SIGNATURE-----

--nextPart1954371.TZOtsmD2Ku--
