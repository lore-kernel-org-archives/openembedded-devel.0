Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHAAH-0001mz-Ry for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:37:01 +0200
Received: from f053037176.adsl.alicedsl.de ([78.53.37.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHA8l-0004LE-GE for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 07:35:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 03 May 2011 09:34:25 +0200
Message-ID: <1304408065.13481.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] orc: add version 0.4.14
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
X-List-Received-Date: Tue, 03 May 2011 07:37:02 -0000
X-Groupsio-MsgNum: 31582
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Hok11bhE29BM53R4rGzB"

--=-Hok11bhE29BM53R4rGzB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 3 May 2011 09:29:58 +0200

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am build testing this right now. If others want to try it out please do s=
o.
---
 recipes/orc/orc_0.4.14.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/orc/orc_0.4.14.bb

diff --git a/recipes/orc/orc_0.4.14.bb b/recipes/orc/orc_0.4.14.bb
new file mode 100644
index 0000000..639fd4f
--- /dev/null
+++ b/recipes/orc/orc_0.4.14.bb
@@ -0,0 +1,6 @@
+require orc.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI[orc.md5sum] =3D "6b3ff209e9763ebe40e152538884bd71"
+SRC_URI[orc.sha256sum] =3D "6b0c536984871954364976516ea0328e2dcd856111726a=
23e609504ba2b12313"
--=20
1.7.4.4


--=-Hok11bhE29BM53R4rGzB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2/sAEACgkQPX1aK2wOHVjI8QCcDqr8miBC4mkooTySmYJHD9Ka
cHgAniA44WWAuIuJBe8KF2ZqKBN4nKq8
=YqNU
-----END PGP SIGNATURE-----

--=-Hok11bhE29BM53R4rGzB--
