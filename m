Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nuu67-0007Iz-R6
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 21:56:20 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 21:53:00 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 21:53:01 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 21:53:00 +0100
Date: Thu, 25 Mar 2010 21:52:54 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100325215254.9ae6d9cb.ospite@studenti.unina.it>
In-Reply-To: <20100325203900.GB17837@gmail.com>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<20100325203900.GB17837@gmail.com>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 25 Mar 2010 20:53:00.0471 (UTC)
	FILETIME=[27C4BC70:01CACC5D]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH 0/5] Misc updates for EZX bits in OE
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
X-List-Received-Date: Thu, 25 Mar 2010 20:56:24 -0000
X-Groupsio-MsgNum: 18132
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__25_Mar_2010_21_52_54_+0100_NeD/6dqupJ80g.oH"

--Signature=_Thu__25_Mar_2010_21_52_54_+0100_NeD/6dqupJ80g.oH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2010 13:39:00 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On (25/03/10 18:19), Antonio Ospite wrote:
[...]
> > Note that although ezx-gen-blob builds fine now, it seems to have issue=
s with
> > GCC 4.4: the binary size is about 300KiB instead of the expected 64KiB,=
 if
> > anyone has a clue please let me know.
>=20
> I can help you here. If you can give me the two images with symbols and
> your linking script it uses. Secondly are you using same binutils/ld in
> both cases ?
>

I'll dig for an older toolchain in order to replicate the two
scenarios, and get back here to get your help.
Many thanks for your offer Khem.

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

--Signature=_Thu__25_Mar_2010_21_52_54_+0100_NeD/6dqupJ80g.oH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkurzSYACgkQ5xr2akVTsAHCAwCePJ76zc5Dhi7QHokvjlzBRmS+
65YAoKorRZY5rg2B1YguZs9w7yx0uvxg
=ld/4
-----END PGP SIGNATURE-----

--Signature=_Thu__25_Mar_2010_21_52_54_+0100_NeD/6dqupJ80g.oH--
