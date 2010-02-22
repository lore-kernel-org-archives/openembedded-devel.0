Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NjU52-0001s3-ID
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 09:55:55 +0100
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Feb 2010 09:53:07 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Feb 2010 09:53:03 +0100
Received: from badebec ([82.61.82.81]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 22 Feb 2010 09:53:02 +0100
Date: Mon, 22 Feb 2010 09:43:50 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100222094350.148f88c0.ospite@studenti.unina.it>
In-Reply-To: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 22 Feb 2010 08:53:02.0137 (UTC)
	FILETIME=[70BFD290:01CAB39C]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Mon, 22 Feb 2010 08:55:55 -0000
X-Groupsio-MsgNum: 16938
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__22_Feb_2010_09_43_51_+0100_2S1gUu_3du57v/YS"

--Signature=_Mon__22_Feb_2010_09_43_51_+0100_2S1gUu_3du57v/YS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Feb 2010 11:34:49 +0100
Antonio Ospite <ospite@studenti.unina.it> wrote:

> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
> In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more logical=
 to
> put it just before the target system info.
>=20
> Regards,
>    Antonio
>=20

Ping.

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Mon__22_Feb_2010_09_43_51_+0100_2S1gUu_3du57v/YS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuCQ8cACgkQ5xr2akVTsAEV0gCeLSNzAq9XPUv5n4LHGNjndvWL
S8oAoIQE01Jpsc1SX3F+0XAlolhcrZ0l
=KK72
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Feb_2010_09_43_51_+0100_2S1gUu_3du57v/YS--
