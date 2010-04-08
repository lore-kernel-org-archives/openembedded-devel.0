Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nzsj9-0001Mr-Jo
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 16:29:04 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 16:25:40 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 16:25:39 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 16:25:38 +0200
Date: Thu, 8 Apr 2010 16:25:33 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100408162533.ae09c2c4.ospite@studenti.unina.it>
In-Reply-To: <hpkoet$h25$1@dough.gmane.org>
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>
	<201004032017.10514.marcin@juszkiewicz.com.pl>
	<20100408161130.b0b6ed73.ospite@studenti.unina.it>
	<hpkoet$h25$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 08 Apr 2010 14:25:39.0080 (UTC)
	FILETIME=[5C9A6880:01CAD727]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Thu, 08 Apr 2010 14:29:04 -0000
X-Groupsio-MsgNum: 18502
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__8_Apr_2010_16_25_33_+0200_z9HSB0X7kJHpLwc7"

--Signature=_Thu__8_Apr_2010_16_25_33_+0200_z9HSB0X7kJHpLwc7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Apr 2010 16:15:57 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 08-04-10 16:11, Antonio Ospite wrote:
>=20
> > versioned dependencies are possible in .bb files
>=20
> Actually, they aren't. DISTROs should take care of stuff like this in
> the current OE design.

In what sense they are not possible?
I can see some with
git grep DEPENDS | grep '>=3D'=20
but that could be misleading me.

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

--Signature=_Thu__8_Apr_2010_16_25_33_+0200_z9HSB0X7kJHpLwc7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku9510ACgkQ5xr2akVTsAEbtwCfXi+zTEhoZEuoMQbwI/XTzHHP
NBEAn2b+/BS7pBt1tipuA6tlAjRsIbOW
=mPSB
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Apr_2010_16_25_33_+0200_z9HSB0X7kJHpLwc7--
