Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QArIy-0006fR-Se for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 00:15:56 +0200
Received: from f053034154.adsl.alicedsl.de ([78.53.34.154]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QArH8-0004KC-6I for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:14:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 00:13:39 +0200
Message-ID: <1302905619.3853.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] orc: add version 0.4.12
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
X-List-Received-Date: Fri, 15 Apr 2011 22:15:56 -0000
X-Groupsio-MsgNum: 31203
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0Q+NFeylf1wBpfclcekH"

--=-0Q+NFeylf1wBpfclcekH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 16 Apr 2011 00:09:44 +0200


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/orc/orc_0.4.12.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes/orc/orc_0.4.12.bb

diff --git a/recipes/orc/orc_0.4.12.bb b/recipes/orc/orc_0.4.12.bb
new file mode 100644
index 0000000..801db15
--- /dev/null
+++ b/recipes/orc/orc_0.4.12.bb
@@ -0,0 +1,4 @@
+require orc.inc
+
+SRC_URI[orc.md5sum] =3D "3130b63e6a1284b3e0796fab2450753a"
+SRC_URI[orc.sha256sum] =3D "61a676f7530277cced1ce327fcb812067595408b60bb34=
7999240e393fb27fc5"
--=20
1.7.4.1


--=-0Q+NFeylf1wBpfclcekH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2owwYACgkQPX1aK2wOHVgfnACfYmTSuBAnbrKs12qBPTw5bulZ
gi4An0vM8sADI9Of15NUXKSBTfrqyek6
=E/BD
-----END PGP SIGNATURE-----

--=-0Q+NFeylf1wBpfclcekH--
