Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8Qwt-0003wb-Gw
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 06:38:36 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8QtH-0006QH-5Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 08:34:52 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 May 2010 08:34:50 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
	<1272765352.21120.118.camel@trini-m4400>
In-Reply-To: <1272765352.21120.118.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201005020834.50438.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode: update tzdata to latest version (2010i).
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
X-List-Received-Date: Sun, 02 May 2010 04:38:36 -0000
X-Groupsio-MsgNum: 18923
Content-Type: multipart/signed; boundary="nextPart1657242.YcQOXDTSRV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1657242.YcQOXDTSRV
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 02 =D0=
=BC=D0=B0=D1=8F 2010 05:55:52 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Sat, 2010-05-01 at 23:12 +0200, Adrian-Ken Rueegsegger wrote:
> > Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
> > ---
> >  recipes/tzcode/tzcode-native_2010f.bb |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes/tzcode/tzcode-native_2010f.bb
> > b/recipes/tzcode/tzcode-native_2010f.bb index f2fbffd..8585de2 100644
> > --- a/recipes/tzcode/tzcode-native_2010f.bb
> > +++ b/recipes/tzcode/tzcode-native_2010f.bb
> > @@ -6,11 +6,11 @@ require tzcode-native.inc
> >  # Also, tzdata (and it is needed to build tzcode) version can differ
> > from # tzcode version, thus this variable
> >
> > -TZDATA_PV =3D "2010h"
> > +TZDATA_PV =3D "2010i"
> >
> >  SRC_URI[tzcode-2010f.md5sum] =3D "e530cc9bbdfd5e8c1eac21a68f4d5656"
> >  SRC_URI[tzcode-2010f.sha256sum] =3D
> > "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
> > -SRC_URI[tzdata-2010h.md5sum] =3D "d384ac091e6d56802f9b3e6b3d3f0f2e"
> > -SRC_URI[tzdata-2010h.sha256sum] =3D
> > "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
> > +SRC_URI[tzdata-2010i.md5sum] =3D "4d2a90afd5bffe8df97f3def245e178e"
> > +SRC_URI[tzdata-2010i.sha256sum] =3D
> > "bee0a26cca54db3413416d968c0a6361d83188b112d2512559d0e3602f254dc3"
>=20
> You weren't the first but can you please do the git mv like in your
> tzdata patch instead (and drop the 2010f sums).  Thanks!

No, tzcode is still at 2010f, it's tzdata that moved again. That's exactly=
=20
what the comment above says:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# Also, tzdata (and it is needed to build tzcode) version can differ from
# tzcode version, thus this variable
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1657242.YcQOXDTSRV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvdAOoACgkQXJ70z+XgVcOw/ACfQErLRQxhSXpRnzLTOjx3AWT+
mtMAoLdBoJsy0avx9KKdjFoo8BEGwdY1
=BlD7
-----END PGP SIGNATURE-----

--nextPart1657242.YcQOXDTSRV--
