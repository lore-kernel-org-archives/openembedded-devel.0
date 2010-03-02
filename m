Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NmUB3-000161-QK
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 16:38:34 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Mar 2010 16:35:38 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Mar 2010 16:35:38 +0100
Received: from badebec ([87.6.141.74]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 2 Mar 2010 16:35:37 +0100
Date: Tue, 2 Mar 2010 16:35:27 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Khem Raj <raj.khem@gmail.com>
Message-Id: <20100302163527.e6a1c9b3.ospite@studenti.unina.it>
In-Reply-To: <19c1b8a91003011507o83cf215k8da55bbadbae8b4c@mail.gmail.com>
References: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
	<19c1b8a91003011414p3610b861k136ea412526bff19@mail.gmail.com>
	<20100301233537.dc587174.ospite@studenti.unina.it>
	<19c1b8a91003011507o83cf215k8da55bbadbae8b4c@mail.gmail.com>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 02 Mar 2010 15:35:37.0513 (UTC)
	FILETIME=[01C7B190:01CABA1E]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, PATCH] distros: prettier notation for dev snapshots version strings
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
X-List-Received-Date: Tue, 02 Mar 2010 15:38:39 -0000
X-Groupsio-MsgNum: 17252
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__2_Mar_2010_16_35_28_+0100_1TrdIfaykChXsqVO"

--Signature=_Tue__2_Mar_2010_16_35_28_+0100_1TrdIfaykChXsqVO
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Mar 2010 15:07:53 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 1, 2010 at 2:35 PM, Antonio Ospite <ospite@studenti.unina.it>=
 wrote:
> > On Mon, 1 Mar 2010 14:14:13 -0800
> > Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Sun, Feb 28, 2010 at 10:32 AM, Antonio Ospite
> >> <ospite@studenti.unina.it> wrote:
> >> > Make archives names look a little better. Compare the current:
> >> > =A0minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-t=
oolchain.tar.bz2
> >> > to the proposed:
> >> > =A0minimal-dev.snapshot.20100216-i686-linux-armv5te-linux-gnueabi-to=
olchain.tar.bz2
> >>
> >> may be just getting rid of that '-.' and using just '-' would be enoug=
h ?
> >> is there any advantage of using . over -
> >>
> >
> > I thought that using some dot-notation would make more clear both that
> > the string indicates a _version_ and that it is a single field on its
> > own.
>=20
> if there a post processing tool that would benefit  from this  then I
> would say its fine.
>=20

Not that I know of. The benefit is mainly aesthetic.

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

--Signature=_Tue__2_Mar_2010_16_35_28_+0100_1TrdIfaykChXsqVO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuNMEAACgkQ5xr2akVTsAHaegCePVlu3XE51MEpLbPBOkeux2/A
nTIAn0P3RebD/DevcgtTKpZ1tgbw5r/Q
=huuu
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Mar_2010_16_35_28_+0100_1TrdIfaykChXsqVO--
