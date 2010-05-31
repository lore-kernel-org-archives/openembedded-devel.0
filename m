Received: from smtp-out29.alice.it ([85.33.2.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ3sX-0002qG-0r
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 14:14:01 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out29.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 14:07:46 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 14:07:46 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 14:07:45 +0200
Date: Mon, 31 May 2010 14:07:32 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100531140732.759c1804.ospite@studenti.unina.it>
In-Reply-To: <4C039DE8.8000400@freyther.de>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<20100531102012.GA12125@excalibur.local>
	<4C039DE8.8000400@freyther.de>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 31 May 2010 12:07:45.0275 (UTC)
	FILETIME=[E0ECB4B0:01CB00B9]
X-SA-Exim-Connect-IP: 85.33.2.29
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 00/12] motorola-ezx related changes
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
X-List-Received-Date: Mon, 31 May 2010 12:14:02 -0000
X-Groupsio-MsgNum: 19692
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__31_May_2010_14_07_32_+0200_oYqAMxeoto9rD45B"

--Signature=_Mon__31_May_2010_14_07_32_+0200_oYqAMxeoto9rD45B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2010 19:30:48 +0800
Holger Freyther <holger+oe@freyther.de> wrote:

> On 05/31/2010 06:20 PM, Stefan Schmidt wrote:
>=20
>=20
> > Over time he already did a lot patches for EZX, but was also willing to=
 dig into
> > related problems and work on them until a solution was found. He also s=
howed
> > good reactions on review comments and I think he is ready for write-acc=
ess now.
>=20
>=20
> +1 for write review, and a little general reminder that review doesn't
> remove the need for review.
>

"_write access_ doesn't remove the need for review":
I can see that, on trivial motorola-ezx stuff (SRCREV bumps, for
instance) I guess I will commit directly, on anything else I am going to
send patches here some days before pushing, or until I get sufficient
ACKs.

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

--Signature=_Mon__31_May_2010_14_07_32_+0200_oYqAMxeoto9rD45B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwDpoQACgkQ5xr2akVTsAF+/QCgmmehBofAaP9Xy6TBxaVAp1K5
OOMAoJTt0cT0TPij7IpMZdjJUDpaq6PK
=bGq3
-----END PGP SIGNATURE-----

--Signature=_Mon__31_May_2010_14_07_32_+0200_oYqAMxeoto9rD45B--
