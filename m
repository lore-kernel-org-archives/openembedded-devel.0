Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O2r3w-0002Ge-8d
	for openembedded-devel@openembedded.org; Fri, 16 Apr 2010 21:18:48 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 16 Apr 2010 21:14:15 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 16 Apr 2010 21:14:15 +0200
Received: from jcn ([82.60.124.12]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 16 Apr 2010 21:14:14 +0200
Date: Fri, 16 Apr 2010 21:14:09 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100416211409.3a1b1533.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 16 Apr 2010 19:14:14.0922 (UTC)
	FILETIME=[00F436A0:01CADD99]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [BUG] pixman_0.16.2.bb fails in do_compile
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
X-List-Received-Date: Fri, 16 Apr 2010 19:18:49 -0000
X-Groupsio-MsgNum: 18678
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__16_Apr_2010_21_14_09_+0200_/hany_jB4Aqh2Clu"

--Signature=_Fri__16_Apr_2010_21_14_09_+0200_/hany_jB4Aqh2Clu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's the complete log:
http://tinderbox.openembedded.org/packages/550959/

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

--Signature=_Fri__16_Apr_2010_21_14_09_+0200_/hany_jB4Aqh2Clu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvItwEACgkQ5xr2akVTsAHo2wCfdhMDPVfDgL2wF/vU0t/AJoVS
1HsAoIl22boXUqCetEs2wzZLhfZdShXn
=BFor
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Apr_2010_21_14_09_+0200_/hany_jB4Aqh2Clu--
