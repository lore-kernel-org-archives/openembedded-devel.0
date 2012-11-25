Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvbR-0006G2-2X
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:07:49 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id D2977CB2CAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:24 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 70ECAA62D7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:20 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:06 +0100
Message-Id: <1353864310-20097-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353864310-20097-1-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 3/7] modphp: upgrade to 5.3.19
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
X-List-Received-Date: Mon, 26 Nov 2012 10:07:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb | 5 -----
 meta-webserver/recipes-php/modphp/modphp_5.3.19.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.19.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb b/meta-we=
bserver/recipes-php/modphp/modphp_5.3.14.bb
deleted file mode 100644
index 2a264d7..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include modphp5.inc
-PR =3D "r3"
-
-SRC_URI[md5sum] =3D "7caac4f71e2f21426c11ac153e538392"
-SRC_URI[sha256sum] =3D "c8075b6e83c5db0d26cc8426a7456856421089a76c963813=
b1fcac3ced041cb3"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb b/meta-we=
bserver/recipes-php/modphp/modphp_5.3.19.bb
new file mode 100644
index 0000000..56599d6
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
@@ -0,0 +1,5 @@
+include modphp5.inc
+PR =3D "r0"
+
+SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
+SRC_URI[sha256sum] =3D "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db0=
21020594e2469fd6"
--=20
1.7.11.7



