Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NsOlE-0007CC-CU
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 00:04:20 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NsMvs-0000d4-AT
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 00:07:08 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 00:04:30 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru> <hnu2gb$ehr$1@dough.gmane.org>
	<201003182347.06715.roman@khimov.ru>
In-Reply-To: <201003182347.06715.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201003190004.37865.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Thu, 18 Mar 2010 23:04:21 -0000
X-Groupsio-MsgNum: 17846
Content-Type: multipart/signed; boundary="nextPart2719167.PHXuCOBsr2";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2719167.PHXuCOBsr2
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D7=E5=F2=E2=E5=F0=E3 18 =EC=E0=F0=
=F2=E0 2010 23:47:01 =E0=E2=F2=EE=F0 Roman I Khimov =ED=E0=EF=E8=F1=E0=EB:
> No. You mean, this one?
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=3Dca5f36ee6ad756e1e5402=
88a5
> 6a504c1d8ecc7a3
>=20
> Looks like a good thing to have, so if Richard will push it to OE.dev I c=
an
>  do a rebase of my patchset.

Actually, the better sequence is
 * drop 5.8.4 and 5.8.7
 * bring in staging changes
 * bring in 5.10.1

I'll prepare 5.8.4/5.8.7 removal patch.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2719167.PHXuCOBsr2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuilWUACgkQXJ70z+XgVcMSbACgu3Ut6II5A1bh1Yn/5mPr19jz
DA0AoIOS/jomWVNgEPqjMvX3l/jbLFgE
=rheg
-----END PGP SIGNATURE-----

--nextPart2719167.PHXuCOBsr2--
