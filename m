Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSTQ-0008RG-5D for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 19:43:53 +0200
Received: from f053040153.adsl.alicedsl.de ([78.53.40.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSTN-0005Lj-Fu for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:43:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100713154458.GA3559@rhein.zuhause.netz>
References: <1279027764.3935.13.camel@mattotaupa>
	<20100713154458.GA3559@rhein.zuhause.netz>
Date: Thu, 15 Jul 2010 19:43:45 +0200
Message-ID: <1279215826.3741.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc, perl 5.8.8: error: #error It appears you have defined _FILE_OFFSET_BITS=64.
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
X-List-Received-Date: Thu, 15 Jul 2010 17:44:01 -0000
X-Groupsio-MsgNum: 21009
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NMJ74/uM1eNlzRr3JgWU"

--=-NMJ74/uM1eNlzRr3JgWU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Dienstag, den 13.07.2010, 17:44 +0200 schrieb Henning Heinold:

> Khem and blindvt introduced a new DISTRO feature largefile which now enab=
les stat64 ander serval other largefile
> options. Unfornatly for now only minimal-uclibc-distro is using it. A qui=
ck workaround is to add largefile
> in the angstroem.inc file.

thank you for your reply.

Koen committed your proposed workaround in
b62ea92436361e3f89eb433389a2fd48f967e4f0 [1].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi?url=3Dopenembedded/commit/&id=3Db=
62ea92436361e3f89eb433389a2fd48f967e4f0

--=-NMJ74/uM1eNlzRr3JgWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw/SMwACgkQPX1aK2wOHVgZhgCfaiBm+vA6y2/9bAUGDfdoWLjp
5SwAn0/hYIyu1TPvR55LJshOvG2y9G05
=8cAK
-----END PGP SIGNATURE-----

--=-NMJ74/uM1eNlzRr3JgWU--
