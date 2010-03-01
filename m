Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NmEH3-0007QN-O8
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:39:41 +0100
Received: from FBCMMO04.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 23:36:45 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 23:35:48 +0100
Received: from badebec ([87.3.28.51]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 1 Mar 2010 23:35:48 +0100
Date: Mon, 1 Mar 2010 23:35:37 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100301233537.dc587174.ospite@studenti.unina.it>
In-Reply-To: <19c1b8a91003011414p3610b861k136ea412526bff19@mail.gmail.com>
References: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
	<19c1b8a91003011414p3610b861k136ea412526bff19@mail.gmail.com>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2010 22:35:48.0708 (UTC)
	FILETIME=[8A690240:01CAB98F]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=AWL,RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Mon, 01 Mar 2010 22:39:42 -0000
X-Groupsio-MsgNum: 17225
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__1_Mar_2010_23_35_37_+0100_zypAukEU4hTfX8cl"

--Signature=_Mon__1_Mar_2010_23_35_37_+0100_zypAukEU4hTfX8cl
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Mar 2010 14:14:13 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Feb 28, 2010 at 10:32 AM, Antonio Ospite
> <ospite@studenti.unina.it> wrote:
> > Make archives names look a little better. Compare the current:
> > =A0minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-tool=
chain.tar.bz2
> > to the proposed:
> > =A0minimal-dev.snapshot.20100216-i686-linux-armv5te-linux-gnueabi-toolc=
hain.tar.bz2
>=20
> may be just getting rid of that '-.' and using just '-' would be enough ?
> is there any advantage of using . over -
>

I thought that using some dot-notation would make more clear both that
the string indicates a _version_ and that it is a single field on its
own.

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

--Signature=_Mon__1_Mar_2010_23_35_37_+0100_zypAukEU4hTfX8cl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuMQToACgkQ5xr2akVTsAHbSQCgrcXkR4JiIj7rGl+INseJ1bZo
KxUAoIHASJnwweLebNvAiwltV8MuAZqj
=PVSN
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_23_35_37_+0100_zypAukEU4hTfX8cl--
