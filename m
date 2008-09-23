Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Ki4LL-0002Qa-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 11:38:03 +0200
Received: (qmail invoked by alias); 23 Sep 2008 09:34:29 -0000
Received: from e178113046.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.113.46]
	by mail.gmx.net (mp064) with SMTP; 23 Sep 2008 11:34:29 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+KvfNfCIaKuYbsclNSHsPEVpbbbHtpvF+mVIpwVa
	DaMALSfJfSsiOg
Message-ID: <48D8B82F.6010103@gmx.net>
Date: Tue, 23 Sep 2008 11:34:39 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
In-Reply-To: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.79
Subject: Re: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 09:38:03 -0000
X-Groupsio-MsgNum: 5922
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2256483FE4E7DB379E257644"

--------------enig2256483FE4E7DB379E257644
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
is there a way to override this being reported as a problem in case of
these problems:

> non dev contains .so, gcc,
> /work/armv5teb-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc/usr/lib/=
gcc/armeb-angstrom-linux-gnueabi/4.2.4/libgcc_s.so

I ask because boost on purpose distributes lib*.so files and creates a
lot of binary packages.

Regards
Robert


--------------enig2256483FE4E7DB379E257644
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkjYuDAACgkQG9cfwmwwEtrO9wCfYjuaM+aLTy5Rhj7/Nra3SlG8
8RwAn26VcTrdNiTsfk9J6d1Es6K4HcRZ
=MdNE
-----END PGP SIGNATURE-----

--------------enig2256483FE4E7DB379E257644--
