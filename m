Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1NBZch-0004ZV-U0
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 20:58:31 +0100
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Fri, 20 Nov 2009 21:58:51 +0000
	id 000000000002A88F.000000004B07111B.00004A6F
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 20:55:05 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; x86_64; ; )
References: <20091120172438.3e6f603e@Gorodetsky>
In-Reply-To: <20091120172438.3e6f603e@Gorodetsky>
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
MIME-Version: 1.0
Message-Id: <200911202055.21122.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error building opie-image
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
X-List-Received-Date: Fri, 20 Nov 2009 19:58:31 -0000
X-Groupsio-MsgNum: 14551
Content-Type: multipart/signed; boundary="nextPart2552797.vOaYTeaCxb";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2552797.vOaYTeaCxb
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Some weeks ago I bought a MINI2440 target=20
>(http://www.friendlyarm.net/products/mini2440) and I tried to build an
>opie image for this target. I built the image about 20 october
>following the openembedded manual and it ran, but now I'm
>trying it again and I obtain a compilation error.
Very possible. The build depencies are changing dynamically and you recieve=
=20
build errors nearly every 2hours.
So the best way is either to track the errors down or just wait until someo=
ne=20
has fixed it. So hold on 1-2h, make a new git pull and try again, hopefully=
 it=20
works again then.

>I've been looking for that in google and forums but I didn't find why this
>fail. I think it's a bug into a package source, but I'm not sure.
One point is, that opie has gotten very difficult to keep it building/runni=
ng=20
with never libs because Trolltech belongs now to Nokia and all the developm=
ent=20
gets invested into qt4.6
Opie with its qtopia underlay stumbles behind.
But no fear. Just try it again with update, perhaps it works now.
Its like Schroedingers cat, you never know if it builds or not until you tr=
y.

>thanks in advance and sorry for my bad english :-S
No problem. Its not worse then mine ;-)

leviathan

--nextPart2552797.vOaYTeaCxb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAksG9CgACgkQAeZw77btGjquVgCdGakp2747RknyB305sUBhsAU0
ulgAn1E0WPloyu6YyPdZnP+sEyXDKnNH
=CEIg
-----END PGP SIGNATURE-----

--nextPart2552797.vOaYTeaCxb--
