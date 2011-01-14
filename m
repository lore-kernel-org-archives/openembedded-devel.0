Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PdtOM-0002Xv-UU for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 00:49:15 +0100
Received: from g229063146.adsl.alicedsl.de ([92.229.63.146]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PdtNq-00031k-F9; Fri, 14 Jan 2011 23:48:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jan 2011 00:48:41 +0100
Message-ID: <1295048921.3996.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [PATCH] libsigc++-2.0_2.2.8: add checksums
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
X-List-Received-Date: Fri, 14 Jan 2011 23:49:15 -0000
X-Groupsio-MsgNum: 28062
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9e4YTA7nTaPzLdKiuse0"

--=-9e4YTA7nTaPzLdKiuse0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat Jan 15 00:37:48 2011 +0100

This patch fixes commit 0e50dd7f [1]

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0e50dd7=
fb9ee092bc04e581e6d5fc0fc6c6099ef

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Michael 'Mickey' Lauer <mickey@vanille-media.de>
---
 recipes/libsigc++-2.0/libsigc++-2.0_2.2.8.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/libsigc++-2.0/libsigc++-2.0_2.2.8.bb b/recipes/libsigc=
++-2.0/libsigc++-2.0_2.2.8.bb
index f72140c..8a812df 100644
--- a/recipes/libsigc++-2.0/libsigc++-2.0_2.2.8.bb
+++ b/recipes/libsigc++-2.0/libsigc++-2.0_2.2.8.bb
@@ -5,6 +5,10 @@ LICENSE =3D "GPL LGPL"
 DEPENDS =3D "mm-common"
=20
 SRC_URI =3D "ftp://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++=
-${PV}.tar.gz;name=3Darchive"
+
+SRC_URI[archive.md5sum] =3D "05c8333e6effe43473e06f723c6afd23"
+SRC_URI[archive.sha256sum] =3D "b77f409ae172e75fb4712b759993049a1555986140=
ff1aff3020bc6cbbf77cef"
+
 S =3D "${WORKDIR}/libsigc++-${PV}"
=20
 inherit autotools
--=20
1.7.2.3

--=-9e4YTA7nTaPzLdKiuse0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0w4NgACgkQPX1aK2wOHVjMbQCdHmCkwAmrQuXcuRFK1WTdSe1P
30AAn2kJoZeBNAqDbG62bBKycfsbxZ5+
=pvWr
-----END PGP SIGNATURE-----

--=-9e4YTA7nTaPzLdKiuse0--
