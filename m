Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O79xm-0005xG-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 18:18:15 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 28 Apr 2010 18:14:32 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 28 Apr 2010 18:14:27 +0200
Received: from jcn ([87.3.13.157]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 28 Apr 2010 18:14:26 +0200
Date: Wed, 28 Apr 2010 18:14:20 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100428181420.38065efb.ospite@studenti.unina.it>
In-Reply-To: <hr4f9u$48g$1@dough.gmane.org>
References: <hqpfou$igp$1@dough.gmane.org>
	<1272296194-17980-1-git-send-email-ospite@studenti.unina.it>
	<hr4f9u$48g$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 28 Apr 2010 16:14:26.0602 (UTC)
	FILETIME=[DF9238A0:01CAE6ED]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] image.bbclass: create /etc/device_table from IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Wed, 28 Apr 2010 16:18:16 -0000
X-Groupsio-MsgNum: 18864
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__28_Apr_2010_18_14_20_+0200_RZCaQDNcN1K/jR_B"

--Signature=_Wed__28_Apr_2010_18_14_20_+0200_RZCaQDNcN1K/jR_B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Apr 2010 18:34:06 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 26-04-10 17:36, Antonio Ospite wrote:
> > Right now when the 'devices' script from initscripts is called the
> > layout specified in IMAGE_DEVICES_TABLES is lost.
> >=20
> > With this change the default behaviour when no IMAGE_DEVICE_TABLES is
> > specified is to always use files/device_table-minimal.txt
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>=20
> Acked-By: Koen Kooi <koen@openembedded.org>

Koen, would you push this if there are no objections?

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

--Signature=_Wed__28_Apr_2010_18_14_20_+0200_RZCaQDNcN1K/jR_B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvYXtwACgkQ5xr2akVTsAGFhwCfV+B4wW7xEGmhArgde8b/yjmK
/lcAoJqDnwN95s3aYw1TU1kppfYIYwUm
=/IeE
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Apr_2010_18_14_20_+0200_RZCaQDNcN1K/jR_B--
