Received: from smtp-out09a.alice.it ([85.33.3.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ683-0007iJ-HZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 16:38:12 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-OUT09A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 16:33:58 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 16:33:58 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 16:33:57 +0200
Date: Mon, 31 May 2010 16:33:50 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100531163350.7c63c2bb.ospite@studenti.unina.it>
In-Reply-To: <hu0g2o$hlh$1@dough.gmane.org>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<hu0g2o$hlh$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 31 May 2010 14:33:57.0990 (UTC)
	FILETIME=[4DDEC860:01CB00CE]
X-SA-Exim-Connect-IP: 85.33.3.9
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
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
X-List-Received-Date: Mon, 31 May 2010 14:38:12 -0000
X-Groupsio-MsgNum: 19696
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__31_May_2010_16_33_50_+0200_+9O+gteMEPEVd6AO"

--Signature=_Mon__31_May_2010_16_33_50_+0200_+9O+gteMEPEVd6AO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2010 16:11:36 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 31-05-10 11:55, Antonio Ospite wrote:
> > Hi, here's some motorola-ezx related changes, plus a couple of other fi=
xes I
> > am using here.
> > Namely, the non ezx related changes are 01 and 02.
> >=20
> > Can anyone review and apply, please?
>=20
> Feel free to add my ack to 2-6,8-12
>=20

Thanks Koen, I sent a v2 for patch 07, which skips the IMAGE_DEV_MANAGER
change.

Let me know if that is acceptable now.

Next time could you please use a ACKed-by line which I can copy and
paste? This will save some seconds.

Thanks a lot,
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

--Signature=_Mon__31_May_2010_16_33_50_+0200_+9O+gteMEPEVd6AO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwDyM4ACgkQ5xr2akVTsAHtTACcCT/7CbsmPYGbTc5u1Wo2MV0b
6AEAnirDpOX3saSAap8F6Kjfxj/V6ZLb
=E7Rt
-----END PGP SIGNATURE-----

--Signature=_Mon__31_May_2010_16_33_50_+0200_+9O+gteMEPEVd6AO--
