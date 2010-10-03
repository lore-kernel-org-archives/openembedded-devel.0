Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2MLQ-0007FN-04 for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 13:03:05 +0200
Received: from f053041250.adsl.alicedsl.de ([78.53.41.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2MLB-00064R-CR for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 11:02:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 03 Oct 2010 13:02:48 +0200
Message-ID: <1286103768.4310.2.camel@mattotaupa>
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
Subject: [PATCH 1/2] python-native_2.6.5: Correct indentation. Use spaces instead of a tabulator.
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
X-List-Received-Date: Sun, 03 Oct 2010 11:03:05 -0000
X-Groupsio-MsgNum: 24306
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jVW+Gs43GIDpiVTpo3kY"

--=-jVW+Gs43GIDpiVTpo3kY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 2 Oct 2010 18:31:55 +0200

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/python/python-native_2.6.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/python-=
native_2.6.5.bb
index 999335c..76fbbb6 100644
--- a/recipes/python/python-native_2.6.5.bb
+++ b/recipes/python/python-native_2.6.5.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-=
${PV}.tar.bz2 \
            file://00-fix-bindir-libdir-for-cross.patch \
            file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
-	   file://06-ctypes-libffi-fix-configure.patch \
+           file://06-ctypes-libffi-fix-configure.patch \
            file://10-distutils-fix-swig-parameter.patch \
            file://11-distutils-never-modify-shebang-line.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
--=20
1.7.1


--=-jVW+Gs43GIDpiVTpo3kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyoYtIACgkQPX1aK2wOHVh4pQCdEj+IYfmxnn6ZAgppArbNuiAh
bEsAoIMzKQAznliKWrYPiVhrtvmHKM25
=+2Ti
-----END PGP SIGNATURE-----

--=-jVW+Gs43GIDpiVTpo3kY--
