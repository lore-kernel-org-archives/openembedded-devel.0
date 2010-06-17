Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OPNWi-00018c-BY
	for openembedded-devel@openembedded.org; Fri, 18 Jun 2010 00:25:44 +0200
Received: from jcn (79.2.147.76) by smtp209.alice.it (8.5.124.08)
	id 4C1A275900089A50 for openembedded-devel@openembedded.org;
	Fri, 18 Jun 2010 00:15:41 +0200
Date: Fri, 18 Jun 2010 00:15:36 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100618001536.60bbc113.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 82.57.200.105
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: meta-toolchain fails in do_populate_sdk
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
X-List-Received-Date: Thu, 17 Jun 2010 22:25:45 -0000
X-Groupsio-MsgNum: 20249
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__18_Jun_2010_00_15_36_+0200_Pl3kuvgFP5a.p7Ra"

--Signature=_Fri__18_Jun_2010_00_15_36_+0200_Pl3kuvgFP5a.p7Ra
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

* check_data_file_clashes: Package gdb-cross-sdk wants to install file
.../build/tmp/work/armv5te-oe-linux-gnueabi/meta-toolchain-1.0-r0/sdk/image=
/usr/local/minimal/arm/share/info/dir
But that file is already provided by package  * binutils-cross-sdk

here's the full log:
http://tinderbox.openembedded.org/builds/74560/

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

--Signature=_Fri__18_Jun_2010_00_15_36_+0200_Pl3kuvgFP5a.p7Ra
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwanogACgkQ5xr2akVTsAFnPgCfYZrUuxKakTtjH9YyGeUWjsbi
30MAn2ZBQ+YUeDNvKDYuZbIYbhXy4jhN
=UPLB
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jun_2010_00_15_36_+0200_Pl3kuvgFP5a.p7Ra--
