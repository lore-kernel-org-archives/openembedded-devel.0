Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr7GM-0002r4-Rb for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:11:10 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr7DT-0007B6-EA for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:08:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 11:08:05 +0100
Message-ID: <1268647686.3759.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: docs/usermanual: Preferred ordering of `PR` and `require`?
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
X-List-Received-Date: Mon, 15 Mar 2010 10:11:10 -0000
X-Groupsio-MsgNum: 17639
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5v9K3VmoBPwTnvrGEmdd"

--=-5v9K3VmoBPwTnvrGEmdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


this is just a style question. Looking at the following page of the OE
user manual [1] the ordering of `PR` and `require` is not consistent in
the given examples.

What ordering should be suggested. Of course this should just be a
suggestion and recipe authors can do as they prefer anyway.


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_require.html

--=-5v9K3VmoBPwTnvrGEmdd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkueBwUACgkQPX1aK2wOHVhb2ACfU4V46p8tqSGrJM4IQ7HuU+NI
0UEAn3umBN8Q/PmIEzROtEYSiVnXe9YB
=ULaN
-----END PGP SIGNATURE-----

--=-5v9K3VmoBPwTnvrGEmdd--
