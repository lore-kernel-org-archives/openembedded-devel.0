Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Oarov-0006m3-Lb
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 17:00:02 +0200
Received: from jcn (87.3.144.61) by smtp206.alice.it (8.5.124.08)
	id 4C1A268C02127CA9 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 16:54:14 +0200
Date: Mon, 19 Jul 2010 16:54:03 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100719165403.315ea4e5.ospite@studenti.unina.it>
In-Reply-To: <20100714215011.7db929c1.ospite@studenti.unina.it>
References: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
	<20100714215011.7db929c1.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 82.57.200.102
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] libgpsbt_0.1: adding dbus-glib to DEPENDS
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
X-List-Received-Date: Mon, 19 Jul 2010 15:00:18 -0000
X-Groupsio-MsgNum: 21133
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__19_Jul_2010_16_54_03_+0200_4i5nNnk0ydB9m3Hz"

--Signature=_Mon__19_Jul_2010_16_54_03_+0200_4i5nNnk0ydB9m3Hz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jul 2010 21:50:11 +0200
Antonio Ospite <ospite@studenti.unina.it> wrote:

> On Tue, 13 Jul 2010 16:08:56 +0200
> Nicola Ranaldo <nicola.ranaldo@gmail.com> wrote:
>=20
> > ---
> >  recipes/maemo4/libgpsbt_0.1.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
>=20
> Hi Nicola, would you mind telling something more about these patches?
> Why are they needed: are they urgent fixes for non building recipes, are
> they "only" improvements?
>=20
> If you are the same Nicola Ranaldo from unina.it I might consider
> pushing them for you in OE "upon trust" (if others confirm me that it
> is ok to do so), but that's just because I know you from fame;
> generally a more verbose commit message would help people in picking up
> patches about areas of a project they are not directly interested in.
>=20
> Ah, and you should increase PR when changing a recipe like you are
> doing.
>

Ok, I am taking these, btw Martin told Nicola that increasing PR is not
needed as the recipes were failing to build at all before these fixes,
and this looks OK to me too.

Regards,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Mon__19_Jul_2010_16_54_03_+0200_4i5nNnk0ydB9m3Hz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkxEZwsACgkQ5xr2akVTsAET1wCgj3T2D7NONwNAJJe8DWV9ugpW
EUAAoItRujtpPOLgeuBZv4WZsiuOHi2Y
=O1Dc
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jul_2010_16_54_03_+0200_4i5nNnk0ydB9m3Hz--
