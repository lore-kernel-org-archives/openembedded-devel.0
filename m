Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nveu5-0003Sa-NP for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 23:54:54 +0100
Received: from f053034000.adsl.alicedsl.de ([78.53.34.0] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nver1-0008BZ-8V for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 22:51:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Mar 2010 23:51:41 +0100
Message-ID: <1269730301.4033.171.camel@mattotaupa>
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
Subject: [PATCH] libvalhalla: Add libvalhalla hg.
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
X-List-Received-Date: Sat, 27 Mar 2010 22:54:54 -0000
X-Groupsio-MsgNum: 18181
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rWW6XR4WJgWrRMp/5Leh"

--=-rWW6XR4WJgWrRMp/5Leh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../libnfo_hg.bb =3D> libvalhalla/libvalhalla_hg.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 copy recipes/{libnfo/libnfo_hg.bb =3D> libvalhalla/libvalhalla_hg.bb} (71%=
)

diff --git a/recipes/libnfo/libnfo_hg.bb b/recipes/libvalhalla/libvalhalla_=
hg.bb
similarity index 71%
copy from recipes/libnfo/libnfo_hg.bb
copy to recipes/libvalhalla/libvalhalla_hg.bb
index a70ac38..73a4cd0 100644
--- a/recipes/libnfo/libnfo_hg.bb
+++ b/recipes/libvalhalla/libvalhalla_hg.bb
@@ -1,8 +1,8 @@
-require libnfo.inc
+require libvalhalla.inc
 PV =3D "1.0.0+hg"
 PR =3D "${INC_PR}.0"
=20
-SRCREV =3D "8f6237741f72"
+SRCREV =3D "a12610802732"
=20
 SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
=20
--=20
1.7.0.3


--=-rWW6XR4WJgWrRMp/5Leh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuui/0ACgkQPX1aK2wOHVilkACeM3L867p0XsjFv/mqplbukQvx
CQEAn0pEdPok7rusJ2r3Uv2uCVwCefcQ
=Zrzv
-----END PGP SIGNATURE-----

--=-rWW6XR4WJgWrRMp/5Leh--
