Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PBx1H-00012T-8l for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 00:01:56 +0200
Received: from f053040187.adsl.alicedsl.de ([78.53.40.187]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PBx0Z-0002wN-9u for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 22:01:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CCB3C63.4000503@crhc.illinois.edu>
References: <4CCB3C63.4000503@crhc.illinois.edu>
Date: Fri, 29 Oct 2010 22:01:09 +0000
Message-ID: <1288389669.3777.34.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]: Fix GraphViz .dot output for rdepends and rrecs (BitBake 1.10)
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
X-List-Received-Date: Fri, 29 Oct 2010 22:01:56 -0000
X-Groupsio-MsgNum: 25622
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xgCKQr8cAVjDNZVCGmuj"

--=-xgCKQr8cAVjDNZVCGmuj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 29.10.2010, 16:28 -0500 schrieb Matt Johnson:
> The below patch fixes rdepends and rrecs GraphViz output.

[=E2=80=A6]

It looks like your MUA mangled the patch and added line breaks.

Also your Signed-of-by line is missing. Please take a look at OE=E2=80=99s
commit policy [1].


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy

--=-xgCKQr8cAVjDNZVCGmuj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzLRCUACgkQPX1aK2wOHVi8nACePNpUIe5Y9zQW9M2cho6bjQsH
o3UAnjIMI9fpyJ8IPxot+sXvhhQxfNdL
=Iy38
-----END PGP SIGNATURE-----

--=-xgCKQr8cAVjDNZVCGmuj--
