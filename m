Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q7864-0007ZJ-3O
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:23:12 +0200
Received: from jcn (82.57.80.195) by smtp205.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4D0D00380941136C; Tue, 5 Apr 2011 17:21:06 +0200
Date: Tue, 5 Apr 2011 17:20:59 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20110405172059.50829132.ospite@studenti.unina.it>
In-Reply-To: <20110405143634.GF30816@jama.jama.net>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
	<20110405143320.GE30816@jama.jama.net>
	<20110405143634.GF30816@jama.jama.net>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.3; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 15:23:13 -0000
X-Groupsio-MsgNum: 30944
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__5_Apr_2011_17_20_59_+0200_sCHL4S_Q3n20Ow7O"

--Signature=_Tue__5_Apr_2011_17_20_59_+0200_sCHL4S_Q3n20Ow7O
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Apr 2011 16:36:34 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Apr 05, 2011 at 04:33:20PM +0200, Martin Jansa wrote:
> > On Mon, Apr 04, 2011 at 09:31:20PM -0400, Bob Foerster wrote:
> > > Signed-off-by: Bob Foerster <robert@erafx.com>
> > > ---
> > >  ...code-native_2011d.bb =3D> tzcode-native_2011e.bb} |   11 ++++++--=
---
> > >  1 files changed, 6 insertions(+), 5 deletions(-)
> > >  rename recipes/tzcode/{tzcode-native_2011d.bb =3D> tzcode-native_201=
1e.bb} (51%)
> >=20
> > Hi,
> >=20
> > Can you please add LICENSE and LIC_FILES_CHKSUM fields? The same for tz=
data.
> >=20
> > Something like this:
> > OE nokia900@shr ~/shr-core $ grep LIC
> > openembedded-core/meta/recipes-extended/tzdata/tzdata_2010o.bb
> > LICENSE =3D "PD"
> > LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D3;md5=3D06468=
c0e84ef4d4c97045a4a29b08234"
> > OE nokia900@shr ~/shr-core $ grep LIC
> > openembedded-core/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
> > LICENSE =3D "Public Domain"
> > LIC_FILES_CHKSUM =3D "file://${WORKDIR}/README;md5=3D3ae8198f82258417ce=
29066d3b034035"
>=20
> or a bit newer tzcode :)
>=20
> OE nokia900@shr ~/shr-core $ grep LIC meta-shr/recipes-extended/tzcode/tz=
code-native_2011d.bb
> LICENSE =3D "PD"
> LIC_FILES_CHKSUM =3D "file://README;md5=3D3ae8198f82258417ce29066d3b03403=
5"
>=20

Bob tell us if you are interested about adding those yourself and if so,
if you are going to send incremental patches on top of your v2, so we
separate the version update from the recipe upgrade about LICENSE, and
I can merge your v2 as it is now.

Regards,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Tue__5_Apr_2011_17_20_59_+0200_sCHL4S_Q3n20Ow7O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2bM1sACgkQ5xr2akVTsAFhhwCffsNF16z1aGP6Z4fx7DIEw8uI
4UIAoKddEm902jt+c5SBKMagLklmHDSn
=uikg
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Apr_2011_17_20_59_+0200_sCHL4S_Q3n20Ow7O--
