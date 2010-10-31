Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PCb4L-0005Wp-Jy for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 17:47:46 +0100
Received: from f053032235.adsl.alicedsl.de ([78.53.32.235]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PCb3c-0001tW-1N for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 16:47:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Oct 2010 17:46:58 +0100
Message-ID: <1288543618.13060.5.camel@mattotaupa>
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
Subject: [PATCH 1/2] accelges_svn: sort `DEPENDS` alphabetically
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
X-List-Received-Date: Sun, 31 Oct 2010 16:47:46 -0000
X-Groupsio-MsgNum: 25647
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0u+tuPi8/O2tgK0OEE8R"

--=-0u+tuPi8/O2tgK0OEE8R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 31 Oct 2010 13:49:32 +0100

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/accelges/accelges_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges_s=
vn.bb
index db6a6ee..805dc11 100644
--- a/recipes/accelges/accelges_svn.bb
+++ b/recipes/accelges/accelges_svn.bb
@@ -9,7 +9,7 @@ PR =3D "r4"
 PE =3D "1"
 SRCREV =3D "206"
=20
-DEPENDS =3D "dbus dbus-glib libxrandr libnotify notification-daemon curl g=
tk+"
+DEPENDS =3D "curl dbus dbus-glib gtk+ libnotify libxrandr notification-dae=
mon"
 RDEPENDS_${PN} =3D "notification-daemon"
=20
 SRC_URI =3D "svn://accelges.googlecode.com/svn/;module=3Dtrunk;proto=3Dhtt=
p"
--=20
1.7.2.3

--=-0u+tuPi8/O2tgK0OEE8R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzNnXwACgkQPX1aK2wOHVihOwCfaFzw8ekiSFvz+Bb2dunQe+L7
MyMAoICiySbNHZucZJ5EvssIOzKrE5SV
=fBhQ
-----END PGP SIGNATURE-----

--=-0u+tuPi8/O2tgK0OEE8R--
