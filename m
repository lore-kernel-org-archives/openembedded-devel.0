Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NmDIu-0003Ao-3P
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:37:33 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 22:33:35 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 22:33:33 +0100
Received: from badebec ([87.3.28.51]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 1 Mar 2010 22:33:33 +0100
Date: Mon, 1 Mar 2010 22:33:20 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Tom Rini <tom_rini@mentor.com>
Message-Id: <20100301223320.9d48c325.ospite@studenti.unina.it>
In-Reply-To: <1267477680.4739.225.camel@trini-m4400>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
	<1267464991.9295.397.camel@trini-m4400>
	<20100301214153.a74a73f6.ospite@studenti.unina.it>
	<1267477680.4739.225.camel@trini-m4400>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2010 21:33:33.0652 (UTC)
	FILETIME=[D824B140:01CAB986]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Mon, 01 Mar 2010 21:37:33 -0000
X-Groupsio-MsgNum: 17208
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__1_Mar_2010_22_33_20_+0100_a.XTGYdo8ye405TV"

--Signature=_Mon__1_Mar_2010_22_33_20_+0100_a.XTGYdo8ye405TV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 01 Mar 2010 14:08:00 -0700
Tom Rini <tom_rini@mentor.com> wrote:

> On Mon, 2010-03-01 at 21:41 +0100, Antonio Ospite wrote:
> > On Mon, 01 Mar 2010 10:36:31 -0700
> > Tom Rini <tom_rini@mentor.com> wrote:
> >=20
> > > On Fri, 2010-02-19 at 00:34 +0000, Antonio Ospite wrote:
> > > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > > >=20
> > > > ---
> > > > In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more l=
ogical to
> > > > put it just before the target system info.
> > >=20
> > > Pushed, thanks.
> > >=20
> >=20
> > You pushed v1, really not a big deal :)
>=20
> Bah... Not my day.  Was it just commit message that changed?

Yep, don't worry :)

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

--Signature=_Mon__1_Mar_2010_22_33_20_+0100_a.XTGYdo8ye405TV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuMMqAACgkQ5xr2akVTsAGbqwCeP9L+cGOBJjV9HePsr7w0AmN9
7OcAn3f87OkFNQFrPMBgTy3qAzDfTVrg
=b4mw
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_22_33_20_+0100_a.XTGYdo8ye405TV--
