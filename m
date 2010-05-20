Received: from smtp-out09a.alice.it ([85.33.3.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OFEIp-0007Bm-Nl
	for openembedded-devel@openembedded.org; Fri, 21 May 2010 00:33:20 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT09A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 00:28:15 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 00:28:15 +0200
Received: from jcn ([82.55.137.199]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 21 May 2010 00:28:14 +0200
Date: Fri, 21 May 2010 00:28:08 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100521002808.946c76aa.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 20 May 2010 22:28:14.0243 (UTC)
	FILETIME=[BC932730:01CAF86B]
X-SA-Exim-Connect-IP: 85.33.3.9
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: binutils-cross-sdk_cvs.bb fails in do_install
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
X-List-Received-Date: Thu, 20 May 2010 22:33:20 -0000
X-Groupsio-MsgNum: 19453
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__21_May_2010_00_28_08_+0200_dqdVTr8GB1HTLxPn"

--Signature=_Fri__21_May_2010_00_28_08_+0200_dqdVTr8GB1HTLxPn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

as per subject binutils-cross-sdk_cvs.bb fails to build for
DISTRO=3Dminimal this prevents meta-toolchain to be build from scratch as
well.

http://tinderbox.openembedded.org/builds/71564/

Any hints?

Thanks,
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

--Signature=_Fri__21_May_2010_00_28_08_+0200_dqdVTr8GB1HTLxPn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv1t3gACgkQ5xr2akVTsAGKAQCffZPtHGn/b2xJBoV1vUU5DiJZ
DzgAn1lDZGFY8VgpU15IzMMbHQCLiRYI
=F4FC
-----END PGP SIGNATURE-----

--Signature=_Fri__21_May_2010_00_28_08_+0200_dqdVTr8GB1HTLxPn--
