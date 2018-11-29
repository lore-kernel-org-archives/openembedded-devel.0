Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 356896C0E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 15:50:37 -0500
Message-Id: <20181129205038.8809-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libtinyxml2: update to 7.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2018 20:51:04 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../libtinyxml2/{libtinyxml2_6.2.0.bb =3D> libtinyxml2_7.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_6.2.0.bb =3D> li=
btinyxml2_7.0.1.bb} (88%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_6.2.0.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2_7.0.1.bb
similarity index 88%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_6.2.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_7.0.1.bb
index bbb69a1dd..e4bb3f326 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_6.2.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_7.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://tinyxml2.cpp;endline=3D22;md=
5=3Dc19221dbd8a66ad3090462af4
=20
 SRC_URI =3D "git://github.com/leethomason/tinyxml2.git"
=20
-SRCREV =3D "c1424ee4e1c1ed8129d9147ccc920ab92dd9ef86"
+SRCREV =3D "de6d164822076f9b1e26a7222808a25ac03867d8"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.19.1

