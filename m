Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgxVt-00006l-Qa for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 12:17:26 +0200
Received: from g225136218.adsl.alicedsl.de ([92.225.136.218]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgxVq-0002Se-Jt for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:17:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100803225018.GG4752@home.lan>
References: <20100803225018.GG4752@home.lan>
Date: Thu, 05 Aug 2010 12:17:19 +0200
Message-ID: <1281003439.3692.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] git: replace remaining broken hardlinks with symlinks.
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
X-List-Received-Date: Thu, 05 Aug 2010 10:17:26 -0000
X-Groupsio-MsgNum: 21909
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JBC9/fnY02+XI407s/uF"

--=-JBC9/fnY02+XI407s/uF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Yann,


Am Mittwoch, den 04.08.2010, 00:50 +0200 schrieb Yann Dirson:

[=E2=80=A6]

could you do me a favor and explain what is broken regarding hardlinks
please. This issue was pointed out to me before, but I could not
reproduce it or did not understand it [1].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/02186=
9.html

--=-JBC9/fnY02+XI407s/uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxaj6kACgkQPX1aK2wOHVjsTACfWZp8tDgYbUpZfiyzG6x6gPLg
R6IAnjwzz6FG/mXiZpvwiFLv7yeEZoPj
=JTQZ
-----END PGP SIGNATURE-----

--=-JBC9/fnY02+XI407s/uF--
