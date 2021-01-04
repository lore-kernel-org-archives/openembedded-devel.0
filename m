Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web11.11379.1609753065792198183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 01:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id F07E220007;
	Mon,  4 Jan 2021 10:37:41 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZ3LxLBdrOd5; Mon,  4 Jan 2021 10:37:28 +0100 (CET)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 8BB172000A;
	Mon,  4 Jan 2021 10:37:28 +0100 (CET)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.23 -> 2.0.24
Date: Mon,  4 Jan 2021 10:37:27 +0100
Message-Id: <20210104093727.763-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104093727.763-1-jubalh@iodoru.org>
References: <20210104093727.763-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 .../jasper/{jasper_2.0.23.bb =3D> jasper_2.0.24.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.23.bb =3D> jasper_2.0=
.24.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.23.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.24.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.23.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.24.bb
index 2abd11a4c..2071c1fbd 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.23.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.24.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "cc02d63dde901e06d1f866984fd0e80601deaa13"
+SRCREV =3D "9a2835a81ce9c41a48f36dadce79f110da8d6c75"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.26.2

