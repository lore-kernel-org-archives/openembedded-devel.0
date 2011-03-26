Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q3ROq-0002MW-O5 for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 12:11:20 +0100
Received: from f053040067.adsl.alicedsl.de ([78.53.40.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q3RN2-0001aw-CI for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 11:09:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2011 12:09:27 +0100
Message-ID: <1301137767.3979.40.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] orc: add version 0.4.10
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
X-List-Received-Date: Sat, 26 Mar 2011 11:11:20 -0000
X-Groupsio-MsgNum: 30645
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hhIf5yh6iOXvDB3+yRyO"

--=-hhIf5yh6iOXvDB3+yRyO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Thu, 24 Mar 2011 10:21:23 +0100

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
0.4.11 is out already, but I tested my used program with 0.4.10 only.
---
 recipes/orc/orc_0.4.10.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes/orc/orc_0.4.10.bb

diff --git a/recipes/orc/orc_0.4.10.bb b/recipes/orc/orc_0.4.10.bb
new file mode 100644
index 0000000..e072fab
--- /dev/null
+++ b/recipes/orc/orc_0.4.10.bb
@@ -0,0 +1,4 @@
+require orc.inc
+
+SRC_URI[orc.md5sum] =3D "dd4e7a1820c9db5853aa7fe31ddb5a03"
+SRC_URI[orc.sha256sum] =3D "5001a0034edc06800b546246fbe0407ba6e9759c9583d5=
d93adba3557b6a777e"
--=20
1.7.4.1

--=-hhIf5yh6iOXvDB3+yRyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2NyWcACgkQPX1aK2wOHVg4DQCfZ/pQPSzCs1BXksgBAI4KbMqY
XKcAn2We8IlWkta8f77L06gmHEZFYVtx
=dRHt
-----END PGP SIGNATURE-----

--=-hhIf5yh6iOXvDB3+yRyO--
