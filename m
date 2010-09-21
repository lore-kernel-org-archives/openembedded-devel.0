Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OxztL-00046R-BM for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 12:16:03 +0200
Received: from f053044049.adsl.alicedsl.de ([78.53.44.49]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OxztI-0001nP-VI for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:16:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 12:15:59 +0200
Message-ID: <1285064159.23605.1.camel@mattotaupa>
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
Subject: [PATCH] docs/usermanual: s/are be copied/are copied/
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
X-List-Received-Date: Tue, 21 Sep 2010 10:16:03 -0000
X-Groupsio-MsgNum: 23764
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0oCJ3QhVqd+oCsCaQQUQ"

--=-0oCJ3QhVqd+oCsCaQQUQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 21 Sep 2010 12:13:25 +0200

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am no native speaker, so please correct me if =C2=BBare being copied=C2=
=AB should be used.
---
 docs/usermanual/reference/var_src_uri.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/re=
ference/var_src_uri.xml
index 9563256..c4f30a2 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -229,7 +229,7 @@ SRC_URI[sha256sum] =3D &quot;36bdb85c97b39ac604bc58cb78=
57ee08295242c78a12848ef8a31
     <para>The following example shows the specification of a patch
     file:<screen>file://ospfd-no-opaque-lsa-fix.patch</screen></para>
=20
-    <para>Patch files are be copied to the patches subdirectory of the sou=
rce
+    <para>Patch files are copied to the patches subdirectory of the source
     directory, <command>${S}/patches</command>, and then applied from the
     source directory. The patches are searched for along the path specifie=
d
     via the file path variable, <command>${FILESPATH},</command> and if no=
t
--=20
1.7.1

--=-0oCJ3QhVqd+oCsCaQQUQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyYhdQACgkQPX1aK2wOHVi0qQCeKWvgBsY+3dAcAOvLhOGbZjEZ
hMgAn2zMvOH8dc2cpP/Qk61PX4J3H23e
=w4Ne
-----END PGP SIGNATURE-----

--=-0oCJ3QhVqd+oCsCaQQUQ--
