Received: from smtp-out09a.alice.it ([85.33.3.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJTHQ-0005tx-Bu
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 17:21:25 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT09A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 1 Jun 2010 17:17:10 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 1 Jun 2010 17:17:09 +0200
Received: from jcn ([79.3.140.143]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 1 Jun 2010 17:17:07 +0200
Date: Tue, 1 Jun 2010 17:17:00 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Koen Kooi <k.kooi@student.utwente.nl>
Message-Id: <20100601171700.19595a1f.ospite@studenti.unina.it>
In-Reply-To: <hu0ob2$ivu$1@dough.gmane.org>
References: <hu05te$c6i$1@dough.gmane.org>
	<1275316120-11406-1-git-send-email-ospite@studenti.unina.it>
	<hu0ob2$ivu$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 01 Jun 2010 15:17:07.0975 (UTC)
	FILETIME=[8008E170:01CB019D]
X-SA-Exim-Connect-IP: 85.33.3.9
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.gnumonks.org, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/12 v2] motorola-ezx-base.inc: refresh machine definition
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
X-List-Received-Date: Tue, 01 Jun 2010 15:21:25 -0000
X-Groupsio-MsgNum: 19727
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__1_Jun_2010_17_17_00_+0200_lY7v47ISYv0Gxg0E"

--Signature=_Tue__1_Jun_2010_17_17_00_+0200_lY7v47ISYv0Gxg0E
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2010 18:32:34 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 31-05-10 16:28, Antonio Ospite wrote:
> > Reorder sections to a more logic scheme, following magician.conf, other
> > cleanups:
> >=20
> >  * sort MACHINE_FEATURES alphabetically
> >  * add ezx-gen-blob to EXTRA_IMAGEDEPENDS
> >  * use MODUTILS=3D26
> >  * Add needed kernel modules for BP
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>=20
> Acked-by: Koen Kooi <koen@openembedded.org>
>=20

Thanks Koen, btw, trying "git am" om my own patches before pushing I've
found some whitepsace issues, I'll fix these, no semantic changes, but
I just wanted to point out that the changes I am going to push are not
_exactly_ the same I sent here for review.

Is there anything like checkpatch.pl for OE?

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

--Signature=_Tue__1_Jun_2010_17_17_00_+0200_lY7v47ISYv0Gxg0E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwFJGwACgkQ5xr2akVTsAH6ywCgj0d0E72b/d7i+ebfQM8A285d
KQAAoIpC2TNU3HjxO3k1BgN5aj/9eNNW
=/VSc
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jun_2010_17_17_00_+0200_lY7v47ISYv0Gxg0E--
