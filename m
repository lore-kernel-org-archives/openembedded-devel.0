Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R14hC-0001eu-GT
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 01:04:46 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 378CBA61CB;
	Wed,  7 Sep 2011 00:59:42 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 00:59:40 +0200
Message-Id: <1315349980-6611-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] tzcode-native: switch to 2011i as 2011g is no more fetchable
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
X-List-Received-Date: Tue, 06 Sep 2011 23:04:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 ...code-native_2011g.bb =3D> tzcode-native_2011i.bb} |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011g.bb =3D> tzco=
de-native_2011i.bb} (54%)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb b/met=
a-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
similarity index 54%
rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
index 651d1dd..8ab4504 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D3ae8198f82258=
417ce29066d3b034035"
 # Also, tzdata (and it is needed to build tzcode) version can differ fro=
m
 # tzcode version, thus this variable
=20
-TZDATA_PV =3D "2011h"
+TZDATA_PV =3D "2011i"
=20
-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.2"
=20
-SRC_URI[tzcode-2011g.md5sum] =3D "ecb564279b28c5b184421c525d997d6c"
-SRC_URI[tzcode-2011g.sha256sum] =3D "636c735d8df1276cc8ab88bc31bb36a21f9=
1ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata-2011h.md5sum] =3D "546d27b6c1e5e1097bd512651815017f"
-SRC_URI[tzdata-2011h.sha256sum] =3D "c098786d053736dd18d4f1fbebdf41554c6=
fd702a36f75c18f1c66712d2abc24"
+SRC_URI[tzcode-2011i.md5sum] =3D "cf7f4335b7c8682899fa2814e711c1b2"
+SRC_URI[tzcode-2011i.sha256sum] =3D "f0dd991de3f8d6c599c104e294377c9befa=
1ef40aa5a1d09e2e295a453f3c1ec"
+SRC_URI[tzdata-2011i.md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
+SRC_URI[tzdata-2011i.sha256sum] =3D "f8dde7ca5e61f21ac34c8cdbef5568d00c8=
29981211098f059d8104964c81ffa"
=20
--=20
1.7.6



