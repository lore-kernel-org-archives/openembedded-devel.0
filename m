Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1Oceay-0005MC-26
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 15:16:52 +0200
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Sat, 24 Jul 2010 15:20:33 +0000
	id 000000000002ECF6.000000004C4B04C1.00006626
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jul 2010 15:17:01 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.32-gentoo-r7; KDE/4.4.4; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
MIME-Version: 1.0
Message-Id: <201007241517.13511.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Maxima for OE
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
X-List-Received-Date: Sat, 24 Jul 2010 13:16:52 -0000
X-Groupsio-MsgNum: 21367
Content-Type: multipart/signed; boundary="nextPart2972540.Lts8nYbFPv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2972540.Lts8nYbFPv
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi
I've got some issues
root@htcdream ~ # file /usr/lib/maxima/5.21.1/binary-clisp/lisp.run
/usr/lib/maxima/5.21.1/binary-clisp/lisp.run: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.9, not stripped

How can we bring the buildsystem to use the right compiler?

best regards
	leviathan

--nextPart2972540.Lts8nYbFPv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAkxK59kACgkQAeZw77btGjrJegCfT2R5Dj+6lWCcbX4FG56/P8Hv
m5UAoKM/HLxS9BGZp9GxgLdKq/fVzJpY
=kFgA
-----END PGP SIGNATURE-----

--nextPart2972540.Lts8nYbFPv--
