Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NvBZ3-0001M2-Oa
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 16:35:14 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 16:32:02 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 16:32:02 +0100
Received: from jcn ([79.2.146.62]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 26 Mar 2010 16:32:00 +0100
Date: Fri, 26 Mar 2010 16:31:55 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100326163155.abc907ca.ospite@studenti.unina.it>
In-Reply-To: <20100326161724.0dd4dfda.ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<20100325203900.GB17837@gmail.com>
	<20100326161724.0dd4dfda.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 26 Mar 2010 15:32:00.0705 (UTC)
	FILETIME=[7A776B10:01CACCF9]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 26 Mar 2010 15:35:14 -0000
X-Groupsio-MsgNum: 18150
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__26_Mar_2010_16_31_55_+0100_RdV49dax_tXxQN7z"

--Signature=_Fri__26_Mar_2010_16_31_55_+0100_RdV49dax_tXxQN7z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2010 16:17:24 +0100
Antonio Ospite <ospite@studenti.unina.it> wrote:

> Here are more details:
> A gcc-4.1.2 toolchain[1] produces the expected result,
> the current gcc-4.4.2 toolchain[2] from 'minimal' distro does not.
>=20

Forgot the refs in previous mail even if they were in the attached
script. And I hope the attached 600KB didn't annoy people _too_much_

Regards,
   Antonio

[1]
http://ezxdev.org/qtopia/sdk/arm-angstrom-linux-gnueabi-4.1.2.tar.bz2
[2]
http://people.openezx.org/ao2/deploy/sdk/minimal-dev-snapshot-20100323-x86_=
64-linux-armv5te-linux-gnueabi-toolchain.tar.bz2

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__26_Mar_2010_16_31_55_+0100_RdV49dax_tXxQN7z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkus02sACgkQ5xr2akVTsAHBxACfdmhciXv0knLSOV/snAVyuULm
EKsAnjEdck/Nd+VZABvcEYXDhQDldAgf
=GShg
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Mar_2010_16_31_55_+0100_RdV49dax_tXxQN7z--
