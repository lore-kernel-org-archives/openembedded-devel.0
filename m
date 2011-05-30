Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7rJ-0001Re-Up for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 21:10:37 +0200
Received: from f053035189.adsl.alicedsl.de ([78.53.35.189]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7oo-0003QG-E2 for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 19:08:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 21:07:30 +0200
Message-ID: <1306782450.4106.481.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: base.bbclass: Why is `oe_runmake install` not the default for `do_install()`?
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
X-List-Received-Date: Mon, 30 May 2011 19:10:38 -0000
X-Groupsio-MsgNum: 32403
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pE4NyCBF45ar0Vv9LrEL"

--=-pE4NyCBF45ar0Vv9LrEL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


editing the `tiobench` recipe I was wondering why `do_install()` has no
default like `oe_runmake install` set in `base.bbclass`.


Thanks,

Paul

--=-pE4NyCBF45ar0Vv9LrEL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3j6vIACgkQPX1aK2wOHVhe9QCdGzLgtpZ5i82SWyNFE88rJNAt
Jy0AnjATXHz/mv7g+uXis7SchgDZWn1d
=8ONG
-----END PGP SIGNATURE-----

--=-pE4NyCBF45ar0Vv9LrEL--
