Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q76Qt-000078-Nt
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 15:36:35 +0200
Received: from jcn (82.57.80.195) by smtp206.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4D49918D053FEE3B; Tue, 5 Apr 2011 15:34:29 +0200
Date: Tue, 5 Apr 2011 15:34:24 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20110405153424.35cdac31.ospite@studenti.unina.it>
In-Reply-To: <1302002906-16491-1-git-send-email-robert@erafx.com>
References: <1302002906-16491-1-git-send-email-robert@erafx.com>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.3; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 13:36:35 -0000
X-Groupsio-MsgNum: 30934
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__5_Apr_2011_15_34_24_+0200_cSblhKUt=uYvsRuB"

--Signature=_Tue__5_Apr_2011_15_34_24_+0200_cSblhKUt=uYvsRuB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue,  5 Apr 2011 07:28:25 -0400
Bob Foerster <robert@erafx.com> wrote:

> Signed-off-by: Bob Foerster <robert@erafx.com>

Acked-by: Antonio Ospite <ospite@studenti.unina.it>

Bob, do you want me to push those?

> ---
>  ...code-native_2011d.bb =3D> tzcode-native_2011e.bb} |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>  rename recipes/tzcode/{tzcode-native_2011d.bb =3D> tzcode-native_2011e.b=
b} (51%)
>=20
> diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/tzcod=
e-native_2011e.bb
> similarity index 51%
> rename from recipes/tzcode/tzcode-native_2011d.bb
> rename to recipes/tzcode/tzcode-native_2011e.bb
> index 1cc7757..2bf4f4c 100644
> --- a/recipes/tzcode/tzcode-native_2011d.bb
> +++ b/recipes/tzcode/tzcode-native_2011e.bb
> @@ -6,11 +6,11 @@ require tzcode-native.inc
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
> =20
> -TZDATA_PV =3D "2011d"
> +TZDATA_PV =3D "2011e"
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[tzcode-2011d.md5sum] =3D "95095242ee368e6a7e107f154590ac11"
> -SRC_URI[tzcode-2011d.sha256sum] =3D "68f2c07471c5390199c09fe9fee6a22f8a4=
dac24713af88b92da17b33ad98cc7"
> -SRC_URI[tzdata-2011d.md5sum] =3D "03c5793502b7c41985edd73146bf7e36"
> -SRC_URI[tzdata-2011d.sha256sum] =3D "415a54774094e8dcdc9ba141fafbee4b3b2=
f2140a5b8cf012eea4b37fb9a23bd"
> +SRC_URI[tzcode-2011e.md5sum] =3D "fbfc05dbf9ebcfe7c4bba18549870173"
> +SRC_URI[tzcode-2011e.sha256sum] =3D "8fb00f8763aa51d83d6f3190d144124bb71=
76ca829fc08823d6205297bf0426b"
> +SRC_URI[tzdata-2011e.md5sum] =3D "044a07072300a0ee72b046e5a9a4ec90"
> +SRC_URI[tzdata-2011e.sha256sum] =3D "44fef01de4589a4979eb6b5fdbbfd21a3b1=
35852af1ecbfb9e0368ae47392c79"
> --=20

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Tue__5_Apr_2011_15_34_24_+0200_cSblhKUt=uYvsRuB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2bGmAACgkQ5xr2akVTsAHUHwCgglnTbB53erbJLltgiLi5vSWo
rtIAniZ+a1U/09MOlQti9ZDdHL0+8lpR
=epC+
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Apr_2011_15_34_24_+0200_cSblhKUt=uYvsRuB--
