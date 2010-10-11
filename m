Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5RXB-0003KY-Nc for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 01:11:58 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5RWn-0001ge-V1 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 23:11:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 01:11:32 +0200
Message-ID: <1286838692.3900.40.camel@mattotaupa>
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
Subject: [PATCH 2/4] gedit: GPLv2+ is the correct the `LICENSE`.
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
X-List-Received-Date: Mon, 11 Oct 2010 23:11:58 -0000
X-Groupsio-MsgNum: 24708
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-t+Iqy0uaOWwX2YPwoidS"

--=-t+Iqy0uaOWwX2YPwoidS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 12 Oct 2010 00:55:26 +0200

`COPYING` [1] and the file headers, for example [2], say GPLv2+. Only `READ=
ME` [3] just mentions GPLv2.

[1] http://git.gnome.org/browse/gedit/tree/COPYING?id=3Ddada4388aa0c33486a6=
d48ee1c8f2adac67abb01
[2] http://git.gnome.org/browse/gedit/tree/gedit/gedit-view-frame.c?id=3Dda=
da4388aa0c33486a6d48ee1c8f2adac67abb01
[3] http://git.gnome.org/browse/gedit/tree/README?id=3D3fdf01ec9e0ac5f48d22=
e7e5d369c81fa357ea49

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gnome/gedit_2.30.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index eaf9f32..e426d18 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "GNOME editor"
 SECTION =3D "x11/gnome"
-LICENSE =3D "GPL"
+LICENSE =3D "GPLv2"
=20
 DEPENDS =3D "gconf gnome-common glib-2.0 gtk+ gtksourceview2 iso-codes"
 RDEPENDS_${PN} +=3D " gtksourceview2"
--=20
1.7.1


--=-t+Iqy0uaOWwX2YPwoidS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyzmaQACgkQPX1aK2wOHViMgwCfRyFSuxJWexf47uPPSRvAMV/z
l3IAniwh1I8getlngDI2KcRbtaXR0+BN
=LIiP
-----END PGP SIGNATURE-----

--=-t+Iqy0uaOWwX2YPwoidS--
