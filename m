Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1ObW41-0003wZ-Iz
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 11:58:13 +0200
Received: from jcn (82.57.78.224) by smtp207.alice.it (8.5.124.08)
	id 4C1A26CF022FD609; Wed, 21 Jul 2010 11:57:58 +0200
Date: Wed, 21 Jul 2010 11:57:35 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100721115735.7bb34bc2.ospite@studenti.unina.it>
In-Reply-To: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
References: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 82.57.200.103
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] libgpsbt_0.1: adding dbus-glib to DEPENDS
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
X-List-Received-Date: Wed, 21 Jul 2010 09:58:13 -0000
X-Groupsio-MsgNum: 21233
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__21_Jul_2010_11_57_35_+0200_qFSHZhkCEhHhH6Ux"

--Signature=_Wed__21_Jul_2010_11_57_35_+0200_qFSHZhkCEhHhH6Ux
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jul 2010 16:08:56 +0200
Nicola Ranaldo <nicola.ranaldo@gmail.com> wrote:

> ---
>  recipes/maemo4/libgpsbt_0.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>

Ah I just realized these patches miss the proper Signed-off-by line,
Nicola, what address should I use for that? Maybe you are willing to
send a v2 with proper SOB lines and improved commit messages?

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

--Signature=_Wed__21_Jul_2010_11_57_35_+0200_qFSHZhkCEhHhH6Ux
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkxGxI8ACgkQ5xr2akVTsAG63wCdE0PDgwcLehNOuzs9HnLy4hZX
Y2IAnjn9asIpdx3X0oMds3+qrP+SUpSk
=ki1I
-----END PGP SIGNATURE-----

--Signature=_Wed__21_Jul_2010_11_57_35_+0200_qFSHZhkCEhHhH6Ux--
