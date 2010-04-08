Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nzsf5-00019m-WA
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 16:24:52 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 16:21:29 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 16:21:25 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 16:21:24 +0200
Date: Thu, 8 Apr 2010 16:21:17 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100408162117.e7638f69.ospite@studenti.unina.it>
In-Reply-To: <hpk94t$lgd$2@dough.gmane.org>
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>
	<201004032017.10514.marcin@juszkiewicz.com.pl>
	<20100406115837.fde46160.ospite@studenti.unina.it>
	<20100408112243.f558a240.ospite@studenti.unina.it>
	<hpk94t$lgd$2@dough.gmane.org>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 08 Apr 2010 14:21:25.0035 (UTC)
	FILETIME=[C52E37B0:01CAD726]
X-SA-Exim-Connect-IP: 85.33.2.30
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
X-List-Received-Date: Thu, 08 Apr 2010 14:24:52 -0000
X-Groupsio-MsgNum: 18501
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__8_Apr_2010_16_21_17_+0200_6.IGFmqz+hXblteM"

--Signature=_Thu__8_Apr_2010_16_21_17_+0200_6.IGFmqz+hXblteM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Apr 2010 11:54:37 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 08-04-10 11:22, Antonio Ospite wrote:
[...]

> > Should I just send a patch which blindly removes native
> > recipes for older versions, or try to port the BBCLASSEXTEND mechanism
> > to them? I don't know if I am fully comfortable with such changes in OE,
> > but I can always send a tentative patch.
>=20
> Porting them has a slight preference over deleting them. The -native
> recipes shouldn't be needed for things like maemo-compat, hence the
> 'slight' :)
>=20
> regards,
>=20
> Koen

Ok, so if porting is only slightly preferred I dare sending an easy-way
patch which drops them all together :P
On its way.

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

--Signature=_Thu__8_Apr_2010_16_21_17_+0200_6.IGFmqz+hXblteM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku95l0ACgkQ5xr2akVTsAFFjQCfeEwiVYyd8MyW07WrXWgfgEHj
JrQAn04TEdp+ZmEMYv7Xva3f61hIAgaP
=/OeF
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Apr_2010_16_21_17_+0200_6.IGFmqz+hXblteM--
