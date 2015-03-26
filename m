Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0731D723B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 11:00:07 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id EF6C6A002DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 11:52:53 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015032611515322-18438 ;
	Thu, 26 Mar 2015 11:51:53 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 11:48:50 +0100
Message-Id: <1427366930-41626-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 26.03.2015 11:51:53,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 26.03.2015 11:51:53
Subject: [meta-oe][dizzy][PATCH] can-utils_git.bb: fix SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2015 11:00:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

gitorious.org is closing down the can-utils project moved to github.com

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta-oe/recipes-extended/socketcan/can-utils=5Fgit.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils=5Fgit.bb b/meta-o=
e/recipes-extended/socketcan/can-utils=5Fgit.bb
index d8de9df..931e332 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils=5Fgit.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils=5Fgit.bb
@@ -5,7 +5,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://include/linux/can.h;endlin=
e=3D43;md5=3D390a2c9a3c5e3595a0
=20
 DEPENDS =3D "libsocketcan"
=20
-SRC=5FURI =3D "git://git.gitorious.org/linux-can/${BPN}.git;protocol=3Dgit=
;branch=3Dmaster"
+SRC=5FURI =3D "git://github.com/linux-can/${BPN}.git;protocol=3Dgit;branch=
=3Dmaster"
 SRCREV =3D "67a2bdcd336e6becfa5784742e18c88dbeddc973"
=20
 PV =3D "0.0+gitr${SRCPV}"
--=20
1.9.1


