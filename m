Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RV4IY-0007eN-2l
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 17:43:18 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 4A296CAD3F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 17:29:54 +0100 (CET)
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 595504B03C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 17:29:44 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 17:29:42 +0100
Message-Id: <1322497782-4934-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [=meta-oe] hicolor-icon-theme: add checksums
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
X-List-Received-Date: Mon, 28 Nov 2011 16:43:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-the=
me_0.12.bb b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-the=
me_0.12.bb
index db43267..8d48dec 100644
--- a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12=
.bb
+++ b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12=
.bb
@@ -13,6 +13,9 @@ PR =3D "r1"
 SRC_URI =3D "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar=
.gz \
         file://index.theme"
=20
+SRC_URI[md5sum] =3D "55cafbcef8bcf7107f6d502149eb4d87"
+SRC_URI[sha256sum] =3D "9edca690617eaa19054951ca53501c802180262be8880ed8=
4754ac46c93bec73"
+
 FILES_${PN} +=3D "${datadir}/icons"
=20
 do_install_append () {
--=20
1.7.6.4



