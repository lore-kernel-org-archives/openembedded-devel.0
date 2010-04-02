Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxj5c-0005OH-KC for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 17:47:21 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxj2T-0004x7-7j for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 15:44:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Apr 2010 17:44:03 +0200
Message-ID: <1270223043.3873.21.camel@mattotaupa>
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
Subject: [PATCH] libplayer: Update `SRCREV` to 4fb30e64db79 [1].
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
X-List-Received-Date: Fri, 02 Apr 2010 15:47:21 -0000
X-Groupsio-MsgNum: 18391
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-drBYy2ZtycDGJ864Bfz1"

--=-drBYy2ZtycDGJ864Bfz1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[1] http://hg.geexbox.org/libplayer/rev/4fb30e64db79

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libplayer/libplayer_hg.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libplayer/libplayer_hg.bb b/recipes/libplayer/libplaye=
r_hg.bb
index cfe150b..59354cb 100644
--- a/recipes/libplayer/libplayer_hg.bb
+++ b/recipes/libplayer/libplayer_hg.bb
@@ -1,8 +1,8 @@
 require libplayer.inc
 PV =3D "1.0.0+hg"
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
-SRCREV =3D "a628f49d952a"
+SRCREV =3D "4fb30e64db79"
=20
 SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
=20
--=20
1.7.0.3

--=-drBYy2ZtycDGJ864Bfz1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2EMMACgkQPX1aK2wOHViotQCbB6FEXI8lMbYjYtMd0u349A+0
/YwAn0kVDxUntXvz+ruTqv8PSysXwgRJ
=yqpi
-----END PGP SIGNATURE-----

--=-drBYy2ZtycDGJ864Bfz1--
