Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q76Rn-0000CY-43
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 15:37:31 +0200
Received: from jcn (82.57.80.195) by smtp208.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4C1A2716163DB12B; Tue, 5 Apr 2011 15:35:25 +0200
Date: Tue, 5 Apr 2011 15:35:19 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20110405153519.9ca49ebe.ospite@studenti.unina.it>
In-Reply-To: <1302002906-16491-2-git-send-email-robert@erafx.com>
References: <1302002906-16491-1-git-send-email-robert@erafx.com>
	<1302002906-16491-2-git-send-email-robert@erafx.com>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.3; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/2] tzdata: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 13:37:31 -0000
X-Groupsio-MsgNum: 30935
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__5_Apr_2011_15_35_19_+0200_qxRrr+NA=sfNkxF+"

--Signature=_Tue__5_Apr_2011_15_35_19_+0200_qxRrr+NA=sfNkxF+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue,  5 Apr 2011 07:28:26 -0400
Bob Foerster <robert@erafx.com> wrote:

> Signed-off-by: Bob Foerster <robert@erafx.com>

Acked-by: Antonio Ospite <ospite@studenti.unina.it>

> ---
>  .../tzdata/{tzdata_2011d.bb =3D> tzdata_2011e.bb}    |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes/tzdata/{tzdata_2011d.bb =3D> tzdata_2011e.bb} (64%)
>=20
> diff --git a/recipes/tzdata/tzdata_2011d.bb b/recipes/tzdata/tzdata_2011e=
.bb
> similarity index 64%
> rename from recipes/tzdata/tzdata_2011d.bb
> rename to recipes/tzdata/tzdata_2011e.bb
> index ca225bf..581ced3 100644
> --- a/recipes/tzdata/tzdata_2011d.bb
> +++ b/recipes/tzdata/tzdata_2011e.bb
> @@ -6,5 +6,5 @@ require tzdata.inc
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "03c5793502b7c41985edd73146bf7e36"
> -SRC_URI[sha256sum] =3D "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf01=
2eea4b37fb9a23bd"
> +SRC_URI[md5sum] =3D "044a07072300a0ee72b046e5a9a4ec90"
> +SRC_URI[sha256sum] =3D "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb=
9e0368ae47392c79"
> --=20
> 1.7.0.4

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Tue__5_Apr_2011_15_35_19_+0200_qxRrr+NA=sfNkxF+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2bGpcACgkQ5xr2akVTsAHqpACaAotq437gJc2BZWLoxnGahGBL
4UYAoKi/T4O+Ijn/q0vPKbCG+MvKjDog
=J5g4
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Apr_2011_15_35_19_+0200_qxRrr+NA=sfNkxF+--
