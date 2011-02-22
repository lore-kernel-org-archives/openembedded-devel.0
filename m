Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PrwAl-0001si-Hj
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 18:38:26 +0100
Received: from [93.100.16.104] (helo=mate.hex)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>)
	id 1Prw9R-0007aN-PV; Tue, 22 Feb 2011 20:35:56 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 20:35:51 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.7-desktop; KDE/4.4.4; x86_64; ; )
References: <4D62B96F.3010908@mwester.net>
	<20110222063404.GA13792@sakrah.homelinux.org>
In-Reply-To: <20110222063404.GA13792@sakrah.homelinux.org>
MIME-Version: 1.0
Message-Id: <201102222035.52584.roman@khimov.ru>
Subject: Re: [PATCH v2] squid: fix references to host headers and libs
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
X-List-Received-Date: Tue, 22 Feb 2011 17:38:51 -0000
X-Groupsio-MsgNum: 29573
Content-Type: multipart/signed; boundary="nextPart2013847.8FbdO7Yi2M";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2013847.8FbdO7Yi2M
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 22 =D1=84=D0=B5=D0=B2=D1=80=D0=
=B0=D0=BB=D1=8F 2011 09:34:04 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On (21/02/11 13:13), Mike Westerhof wrote:
> > This patch changes hard-coded references to /usr and /opt in the various
> > squid config.test scripts to point to the correct sysroot paths.
> > This version accommodates the strange staging dir layout used by micro.
> >=20
> > Signed-off-by: Mike Westerhof <mike@mwester.net>
>=20
> this patch is good. It does not break micro more than what it would be
> without this patch
>=20
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2013847.8FbdO7Yi2M
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk1j8/gACgkQXJ70z+XgVcMFEwCcCs19oAbdRnNBBtc+PLgO8INi
LmwAoNA1uNzrc/Ji5a9uy4+D96GxuD8X
=NxPY
-----END PGP SIGNATURE-----

--nextPart2013847.8FbdO7Yi2M--
