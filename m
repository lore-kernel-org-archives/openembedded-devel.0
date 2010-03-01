Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NmCUG-0000VG-Dl
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 21:45:13 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 21:42:18 +0100
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 21:42:16 +0100
Received: from badebec ([87.3.28.51]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 1 Mar 2010 21:42:12 +0100
Date: Mon, 1 Mar 2010 21:41:53 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Tom Rini <tom_rini@mentor.com>
Message-Id: <20100301214153.a74a73f6.ospite@studenti.unina.it>
In-Reply-To: <1267464991.9295.397.camel@trini-m4400>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
	<1267464991.9295.397.camel@trini-m4400>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2010 20:42:12.0526 (UTC)
	FILETIME=[ABA62CE0:01CAB97F]
X-SA-Exim-Connect-IP: 85.37.17.100
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
X-List-Received-Date: Mon, 01 Mar 2010 20:45:13 -0000
X-Groupsio-MsgNum: 17202
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__1_Mar_2010_21_41_53_+0100_tDJmFM.lxL7_l7qU"

--Signature=_Mon__1_Mar_2010_21_41_53_+0100_tDJmFM.lxL7_l7qU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 01 Mar 2010 10:36:31 -0700
Tom Rini <tom_rini@mentor.com> wrote:

> On Fri, 2010-02-19 at 00:34 +0000, Antonio Ospite wrote:
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> >=20
> > ---
> > In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more logic=
al to
> > put it just before the target system info.
>=20
> Pushed, thanks.
>=20

You pushed v1, really not a big deal :)

Many thanks,
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

--Signature=_Mon__1_Mar_2010_21_41_53_+0100_tDJmFM.lxL7_l7qU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuMJpEACgkQ5xr2akVTsAElLgCdGwQhGYnFJnAamUTsJC9EcM3C
busAoI1oOo9sudEehH9vv2ou7B9ikq4p
=sbXv
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_21_41_53_+0100_tDJmFM.lxL7_l7qU--
