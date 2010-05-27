Received: from smtp-out109.alice.it ([85.37.17.109])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OHd0k-0004RW-5i
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 15:20:35 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out109.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 27 May 2010 15:15:19 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 27 May 2010 15:15:05 +0200
Received: from jcn ([87.6.141.54]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 27 May 2010 15:15:05 +0200
Date: Thu, 27 May 2010 15:14:51 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100527151451.85d5c520.ospite@studenti.unina.it>
In-Reply-To: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
References: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 27 May 2010 13:15:05.0863 (UTC)
	FILETIME=[9FA68170:01CAFD9E]
X-SA-Exim-Connect-IP: 85.37.17.109
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 13:20:35 -0000
X-Groupsio-MsgNum: 19616
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__27_May_2010_15_14_51_+0200_6wXPsv418+ocBroD"

--Signature=_Thu__27_May_2010_15_14_51_+0200_6wXPsv418+ocBroD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2010 08:34:07 +0200
Raffaele Recalcati <lamiaposta71@gmail.com> wrote:

> Hi all,
> I was searching a clean way to develop in OE my new kernel and my new
> applications.
>=20
> I saw this nice article about kernel development:
> http://bec-systems.com/site/521/best-practices-for-kernel-development-wit=
h-openembedded
>=20
> I would like a way to develop inside Openembedded, but not in work
> directory.
> I mean to develop a project in a git tree, allowing me to use 'git diff'
> ..... and finally 'git push' to my internal git servers.

Hi Raffaele, you can even avoid having a git server, look at:
http://ao2.it/blog/2010/05/27/neat-compilerun-cycle-git-and-openembedded

does this work for you?

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

--Signature=_Thu__27_May_2010_15_14_51_+0200_6wXPsv418+ocBroD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv+cEsACgkQ5xr2akVTsAEgIQCdEZSPzOwSl15j4BPfzRTLtgD2
PbwAoIbxup0ewVnNXIdhOmtxO3eipLFA
=V5wS
-----END PGP SIGNATURE-----

--Signature=_Thu__27_May_2010_15_14_51_+0200_6wXPsv418+ocBroD--
