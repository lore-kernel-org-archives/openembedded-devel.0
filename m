Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NzxIf-0001hV-9n
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 21:22:02 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 21:18:37 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 21:18:37 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 21:18:34 +0200
Date: Thu, 8 Apr 2010 21:18:29 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100408211829.41acb61f.ospite@studenti.unina.it>
In-Reply-To: <201004082311.48792.roman@khimov.ru>
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
	<1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
	<201004082311.48792.roman@khimov.ru>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 08 Apr 2010 19:18:34.0728 (UTC)
	FILETIME=[48817680:01CAD750]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode-native_2010f: Update tzdata SRC_URI and checksum
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
X-List-Received-Date: Thu, 08 Apr 2010 19:22:03 -0000
X-Groupsio-MsgNum: 18512
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__8_Apr_2010_21_18_29_+0200_hWdRbcgEnmoJZqjl"

--Signature=_Thu__8_Apr_2010_21_18_29_+0200_hWdRbcgEnmoJZqjl
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Apr 2010 23:11:42 +0400
Roman I Khimov <roman@khimov.ru> wrote:

> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 08 =D0=B0=D0=BF=D1=80=D0=B5=
=D0=BB=D1=8F 2010 13:30:02 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Antonio Ospite =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > -	ftp://elsie.nci.nih.gov/pub/tzdata2010g.tar.gz;name=3Dtzdata-2010g \
> > +	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=3Dtzdata-2010h \
> ..........
> >  +SRC_URI[tzdata-2010g.md5sum] =3D "d384ac091e6d56802f9b3e6b3d3f0f2e"
> >  +SRC_URI[tzdata-2010g.sha256sum] =3D
> >  "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
>=20
> Actually, it should be "SRC_URI[tzdata-2010h...]", fixed and pushed.
>

Thanks a lot Roman.

> --=20
>  http://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3


--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__8_Apr_2010_21_18_29_+0200_hWdRbcgEnmoJZqjl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku+LAUACgkQ5xr2akVTsAECNgCgiJaJci+PKTEf7SH7tS+rZGIl
dSsAn1tOKd/rs67sc/uPQUVUoXkL/ISZ
=K4Qe
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Apr_2010_21_18_29_+0200_hWdRbcgEnmoJZqjl--
