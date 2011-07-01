Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcZKn-0000ww-0n for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 10:44:21 +0200
Received: from g225080119.adsl.alicedsl.de ([92.225.80.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcZHI-00082v-Og for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 08:40:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309498993-13565-1-git-send-email-raj.khem@gmail.com>
References: <1309498993-13565-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 01 Jul 2011 10:39:28 +0200
Message-ID: <1309509569.4418.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Add patch to disable --nonet option
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
X-List-Received-Date: Fri, 01 Jul 2011 08:44:21 -0000
X-Groupsio-MsgNum: 32928
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iqUtHxaZvBTnmdTeTHYE"

--=-iqUtHxaZvBTnmdTeTHYE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.06.2011, 22:43 -0700 schrieb Khem Raj:
> Hi I am not particularly happy with this patch but by letting xsltproc
> download stylesheets from internet it atleast compiles the thing. But
> its very slow. So any better solution if someone has suggestion please
> by all means

Do install docbook-xsl on your host help? Last time I had that problem I
was told to install them.


Thanks,

Paul

--=-iqUtHxaZvBTnmdTeTHYE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4Nh7cACgkQPX1aK2wOHVh+tACcDcjQIZ4lmGNmjjfAFi494XKQ
d50An3LAQ3SH+H0Gv72ULA+r74MM7J/O
=HKw2
-----END PGP SIGNATURE-----

--=-iqUtHxaZvBTnmdTeTHYE--
