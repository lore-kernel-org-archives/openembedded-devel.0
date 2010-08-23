Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnfQY-0000eC-4N for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 00:23:58 +0200
Received: from e178249013.adsl.alicedsl.de ([85.178.249.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnfPw-0003Ze-AX for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 22:23:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=ktBQXfW_dbi-2+yUkgGSrParCNt9ZEJCK+JC0@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
	<1282556402.3853.17.camel@mattotaupa>
	<AANLkTi=ktBQXfW_dbi-2+yUkgGSrParCNt9ZEJCK+JC0@mail.gmail.com>
Date: Tue, 24 Aug 2010 00:22:56 +0200
Message-ID: <1282602176.3775.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 22:23:59 -0000
X-Groupsio-MsgNum: 22586
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5y4iSmZSnXBreudVYPCu"

--=-5y4iSmZSnXBreudVYPCu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 23.08.2010, 15:27 -0600 schrieb AJ ONeal:
> >
> > You are also missing a Signed-off-by line.
> >
>=20
> All I do to add that is --signoff, correct?

No. Please take a look at the link I gave you [1] and the other patches
sent to this list.

Signed-off-by: Your Name <address>

is needed below your commit message. Git can do this for you with the
`-s` option for `git commit` or `git format-patch -s`.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy

--=-5y4iSmZSnXBreudVYPCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxy9MAACgkQPX1aK2wOHVhAkwCfRUYpKGJjacc+02FkPLWTyTcT
dFgAnRMAonSjZ82BAl1Qzgpf/LTDsD2b
=Avjl
-----END PGP SIGNATURE-----

--=-5y4iSmZSnXBreudVYPCu--
