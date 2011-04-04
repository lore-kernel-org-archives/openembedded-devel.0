Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1Q6jam-0000JA-DW
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 15:13:16 +0200
Received: from jcn (87.11.136.76) by smtp206.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4D49918D0525C98D; Mon, 4 Apr 2011 15:05:14 +0200
Date: Mon, 4 Apr 2011 15:05:06 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20110404150506.3995e1f6.ospite@studenti.unina.it>
In-Reply-To: <1301416483-7255-1-git-send-email-ospite@studenti.unina.it>
References: <1301416483-7255-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.3; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Subject: Re: [RFC, PATCH] classes/mirrors.bbclass: add mirror for download.osgeo.org
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
X-List-Received-Date: Mon, 04 Apr 2011 13:13:16 -0000
X-Groupsio-MsgNum: 30889
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__4_Apr_2011_15_05_07_+0200_FWDWZf_EzHR3fdrb"

--Signature=_Mon__4_Apr_2011_15_05_07_+0200_FWDWZf_EzHR3fdrb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Mar 2011 18:34:43 +0200
Antonio Ospite <ospite@studenti.unina.it> wrote:

> The host download.osgeo.org is not reachable from some network/country
> because of some routing issue, and this makes the do_fetch task of the
> libtiff recipe to fail:
>=20
[..]

> Add a reachable mirror for it, so that the tiff recipe can build fine.
>=20
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>=20
> A less invasive solution would be to change the SRC_URI address directly =
in=20
> the recipe, but I don't know if that can affects anyone else, or we can e=
ven=20
> have a copy of the archive hosted on mirrors.openembedded.org and live wi=
th=20
> that until the next release. What is  your opinion?
>=20

Ping.

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Mon__4_Apr_2011_15_05_07_+0200_FWDWZf_EzHR3fdrb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2ZwgMACgkQ5xr2akVTsAFF2QCfagINqbhdy0q5vSzWdugtzN3P
mJYAoKa9q4DpdJ2BLAc4abmZ8fYuSLO9
=p0uV
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Apr_2011_15_05_07_+0200_FWDWZf_EzHR3fdrb--
