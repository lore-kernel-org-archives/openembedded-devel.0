Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovuij-00042A-0K for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 18:20:40 +0200
Received: from g225082214.adsl.alicedsl.de ([92.225.82.214]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovuhs-0002qE-M1 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 16:19:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 18:19:34 +0200
Message-ID: <1284567574.3890.36.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Automatically utilize of `mercurial-native`?
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
X-List-Received-Date: Wed, 15 Sep 2010 16:20:40 -0000
X-Groupsio-MsgNum: 23594
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1OdnkZR3Qhv+aC/sq5O/"

--=-1OdnkZR3Qhv+aC/sq5O/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Eric added a mercurial-native recipe in 41ee3c [1] to eliminate the
necessity to have Mercurial installed on the build host.

Is there a way to build this when Mercurial is not installed on the
build host? Or do I have to build it manually?

    bitbake mercurial-native


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D41ee3c4=
d7c0e72436049c2c0972fe6e3b6311c5f

--=-1OdnkZR3Qhv+aC/sq5O/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyQ8hYACgkQPX1aK2wOHVh6ZwCfZMHN1BnGKIDjpYoFF8SuHjJL
sEkAnA3rjyeCf2U8Q/8nVMYFA+Mw4wGa
=rw3/
-----END PGP SIGNATURE-----

--=-1OdnkZR3Qhv+aC/sq5O/--
