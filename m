Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVth-0004MJ-S9 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 19:36:33 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVru-0008IX-6J for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 17:34:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 19:34:15 +0200
Message-ID: <1303061655.23572.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] gst-plugin-schroedinger: use `${INC_PR}` for `PR`
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
X-List-Received-Date: Sun, 17 Apr 2011 17:36:33 -0000
X-Groupsio-MsgNum: 31246
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uBlzAM5fXkP2sL/QfDxY"

--=-uBlzAM5fXkP2sL/QfDxY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 19:32:24 +0200

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../schroedinger/gst-plugin-schroedinger_1.0.9.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/schroedinger/gst-plugin-schroedinger_1.0.9.bb b/recipe=
s/schroedinger/gst-plugin-schroedinger_1.0.9.bb
index 0a95646..1fd7cbd 100644
--- a/recipes/schroedinger/gst-plugin-schroedinger_1.0.9.bb
+++ b/recipes/schroedinger/gst-plugin-schroedinger_1.0.9.bb
@@ -1,5 +1,5 @@
 require schroedinger.inc
-PR =3D "r0"
+PR =3D "${INC_PR}.0"
=20
 DEPENDS +=3D "gstreamer gst-plugins-base"
=20
--=20
1.7.4.4

--=-uBlzAM5fXkP2sL/QfDxY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2rJJcACgkQPX1aK2wOHVj3FQCfQDM22J/2otNVeQqOJstapK4W
blAAn0mH//DB1zo9cd+Whft6eYywcV8P
=eMIT
-----END PGP SIGNATURE-----

--=-uBlzAM5fXkP2sL/QfDxY--
