Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PBks2-0004Jo-Qf for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 11:03:45 +0200
Received: from f053040187.adsl.alicedsl.de ([78.53.40.187]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PBkrL-0006Yn-2p for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 09:02:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 11:02:49 +0200
Message-ID: <1288342969.18134.5.camel@mattotaupa>
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
Subject: OEDEM 2010: [RFC] useful commit message
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
X-List-Received-Date: Fri, 29 Oct 2010 09:03:50 -0000
X-Groupsio-MsgNum: 25594
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nAh+s+NyBk5rfRt3/JSY"

--=-nAh+s+NyBk5rfRt3/JSY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


could you please discuss the following proposal.

I would very much like more elaborate commit messages. This is in my
opinion already demanded by the commit policy [1], but often patch
submitters, especially those not sending changes to review to the list,
since they have direct access to the repository, fail to adhere to the
policy.

The reason is, quite often I do not understand why a change was
necessary. It would very much help me, if at least the error message was
pasted to be able to compare with one=E2=80=99s own error messages and what
distribution and machine was used to test the recipe.

I added an item to the OEDEM wiki page too [2].


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://wiki.openembedded.org/index.php?title=3DOedem%2F2010&diff=3D2961=
&oldid=3D2954

--=-nAh+s+NyBk5rfRt3/JSY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzKjbQACgkQPX1aK2wOHViHzwCeLS1mtVaanbXfuwKCYcvUQkBp
1esAnjGRXLh3zKMNzaOHUAL/ZyquvnxV
=z+bd
-----END PGP SIGNATURE-----

--=-nAh+s+NyBk5rfRt3/JSY--
