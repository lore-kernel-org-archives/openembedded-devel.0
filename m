Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q7DXf-0000LV-VB
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 23:12:04 +0200
Received: from jcn (82.57.80.195) by smtp208.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4C1A271616483C68; Tue, 5 Apr 2011 23:09:56 +0200
Date: Tue, 5 Apr 2011 23:09:47 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Robert Foerster <robert@erafx.com>
Message-Id: <20110405230947.aaa39ee0.ospite@studenti.unina.it>
In-Reply-To: <BANLkTiksYsGVCr7HH_WM_47kkz-+d6R_DQ@mail.gmail.com>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
	<20110405143320.GE30816@jama.jama.net>
	<20110405143634.GF30816@jama.jama.net>
	<20110405172059.50829132.ospite@studenti.unina.it>
	<BANLkTiksYsGVCr7HH_WM_47kkz-+d6R_DQ@mail.gmail.com>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.3; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 05 Apr 2011 21:12:04 -0000
X-Groupsio-MsgNum: 30964
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__5_Apr_2011_23_09_47_+0200_ypdPDz6_05Y7fC8Q"

--Signature=_Tue__5_Apr_2011_23_09_47_+0200_ypdPDz6_05Y7fC8Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Apr 2011 11:32:41 -0400
Robert Foerster <robert@erafx.com> wrote:

> On Tue, Apr 5, 2011 at 11:20 AM, Antonio Ospite <ospite@studenti.unina.it=
>wrote:
>=20
[...]
> > > or a bit newer tzcode :)
> > >
> > > OE nokia900@shr ~/shr-core $ grep LIC meta-shr/recipes-extended/tzcod=
e/
> > tzcode-native_2011d.bb
> > > LICENSE =3D "PD"
> > > LIC_FILES_CHKSUM =3D "file://README;md5=3D3ae8198f82258417ce29066d3b0=
34035"
> > >
> >
> > Bob tell us if you are interested about adding those yourself and if so,
> > if you are going to send incremental patches on top of your v2, so we
> > separate the version update from the recipe upgrade about LICENSE, and
> > I can merge your v2 as it is now.
>=20
> Commit v2 as it as.  I will submit new patches later today with the LIC
> info.

Pushed, thanks.

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Tue__5_Apr_2011_23_09_47_+0200_ypdPDz6_05Y7fC8Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2bhRsACgkQ5xr2akVTsAG9IQCfffXqaer6qMXgQyXyvGh80B6l
W9gAnix3T+HhipuGWizgUfpIf48058JS
=EVly
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Apr_2011_23_09_47_+0200_ypdPDz6_05Y7fC8Q--
