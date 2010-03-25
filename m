Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NusSH-0008E7-Bt
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 20:10:59 +0100
Received: from FBCMMO05.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 20:07:05 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 20:07:03 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 20:07:03 +0100
Date: Thu, 25 Mar 2010 20:06:56 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Stefan Schmidt <stefan@datenfreihafen.org>
Message-Id: <20100325200656.c892fb13.ospite@studenti.unina.it>
In-Reply-To: <20100325183050.GH11431@excalibur.local>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<1269537597-26456-5-git-send-email-ospite@studenti.unina.it>
	<20100325174240.GF11431@excalibur.local>
	<20100325191311.7f113c74.ospite@studenti.unina.it>
	<20100325183050.GH11431@excalibur.local>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 25 Mar 2010 19:07:03.0481 (UTC)
	FILETIME=[5AB50A90:01CACC4E]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/5] ezx: update ezx-gen-blob version
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
X-List-Received-Date: Thu, 25 Mar 2010 19:10:59 -0000
X-Groupsio-MsgNum: 18129
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__25_Mar_2010_20_06_56_+0100_mUjtUdTAOL4oSXBO"

--Signature=_Thu__25_Mar_2010_20_06_56_+0100_mUjtUdTAOL4oSXBO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2010 19:30:50 +0100
Stefan Schmidt <stefan@datenfreihafen.org> wrote:

> Hello.
>=20
> On Thu, 2010-03-25 at 19:13, Antonio Ospite wrote:
> > On Thu, 25 Mar 2010 18:42:40 +0100
> > Stefan Schmidt <stefan@datenfreihafen.org> wrote:
> >=20
> > > On Thu, 2010-03-25 at 18:19, Antonio Ospite wrote:
> > > > NOTE: this version builds fine but the resulting binaries do not se=
em to
> > > > be correct, their size is about 300KiB instead of the expected 64Ki=
B.
[...]
> > > Side note for others: Personally I know nobody who ever installed the=
 gen-blob
> > > produced with OE on his phone. All people who did it used a precompil=
ed version
> > > from Wyrm, Antonio or me or compiled it by hand. So this one should n=
ot bring to
> > > much harm.
> > >
> >
> > As you may guess, even compiling it manually "doesn't work" anymore with
> > a recent toolchain...  to be more precise: I've tried running the
> > big binary loading it via usb, it seems to work but it is just not
> > suitable to be flashed because of its size.
>=20
> Interesting. It is stripped, right?

Yep.

> Anyway, as the old one does not build and
> the new one "works" you have my
>
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
>=20

Thanks.
Stefan are you also going to push these changes?

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

--Signature=_Thu__25_Mar_2010_20_06_56_+0100_mUjtUdTAOL4oSXBO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkurtFAACgkQ5xr2akVTsAF41wCfWEYl4vIFt9lG+Yh9SZnAlgaq
JKkAoK5Z2HihOnsEWEFobIh/buKaLciv
=JBpK
-----END PGP SIGNATURE-----

--Signature=_Thu__25_Mar_2010_20_06_56_+0100_mUjtUdTAOL4oSXBO--
