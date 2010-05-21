Received: from smtp-out09a.alice.it ([85.33.3.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OFOXh-0002d9-97
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 11:29:23 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT09A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 11:24:16 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 11:24:15 +0200
Received: from jcn ([87.6.141.180]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 21 May 2010 11:24:13 +0200
Date: Fri, 21 May 2010 11:24:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100521112407.789326cc.ospite@studenti.unina.it>
In-Reply-To: <AANLkTimU5JQEFE8fUjjcUyNNONU3LbODV4YI6CH-1UKd@mail.gmail.com>
References: <20100521002808.946c76aa.ospite@studenti.unina.it>
	<20100521002516.GC29183@gmail.com>
	<AANLkTimU5JQEFE8fUjjcUyNNONU3LbODV4YI6CH-1UKd@mail.gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 21 May 2010 09:24:13.0777 (UTC)
	FILETIME=[60AF6C10:01CAF8C7]
X-SA-Exim-Connect-IP: 85.33.3.9
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross-sdk_cvs.bb fails in do_install
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
X-List-Received-Date: Fri, 21 May 2010 09:29:27 -0000
X-Groupsio-MsgNum: 19461
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__21_May_2010_11_24_08_+0200_lRGvJ84Y/mFTGv1R"

--Signature=_Fri__21_May_2010_11_24_08_+0200_lRGvJ84Y/mFTGv1R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 21 May 2010 00:23:26 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 20, 2010 at 5:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On (21/05/10 00:28), Antonio Ospite wrote:
> >> Hi,
> >>
> >> as per subject binutils-cross-sdk_cvs.bb fails to build for
> >> DISTRO=3Dminimal this prevents meta-toolchain to be build from scratch=
 as
> >> well.
> >>
> >> http://tinderbox.openembedded.org/builds/71564/
> >>
> >> Any hints?
> >
> > Does it happen with 2.20 as well ?
> >
>=20
> To answer myself. It does not fail with 2.20. It should be fixed now
> with commit id 9bd07cffd22f65cb9b7b6f3d0c59939de5da8fb3 please retry.
>

Confirmed, thanks!

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

--Signature=_Fri__21_May_2010_11_24_08_+0200_lRGvJ84Y/mFTGv1R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv2UTgACgkQ5xr2akVTsAGodwCeL2718M7PRdipJ8w/9AxEbKtv
3g4AmgK7/Km6jOOvZu/Ue0cI6t8mBke6
=A2MW
-----END PGP SIGNATURE-----

--Signature=_Fri__21_May_2010_11_24_08_+0200_lRGvJ84Y/mFTGv1R--
