Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web09.13861.1614959512218139215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id F230A1700C;
	Fri,  5 Mar 2021 16:51:47 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70mKVtGDU2Tr; Fri,  5 Mar 2021 16:51:34 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 8235117009;
	Fri,  5 Mar 2021 16:51:34 +0100 (CET)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.25 -> 2.0.26
Date: Fri,  5 Mar 2021 16:51:35 +0100
Message-Id: <20210305155135.29965-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305155135.29965-1-jubalh@iodoru.org>
References: <20210305155135.29965-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 .../jasper/{jasper_2.0.25.bb =3D> jasper_2.0.26.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.25.bb =3D> jasper_2.0=
.26.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.25.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.26.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.25.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
index 0bad670df..de28af8ba 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.25.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "9092dcb7f7680204ef523c73eb6132162b4358e3"
+SRCREV =3D "5083b949f0caa5bc6257cd81162a33c15bf8a1d1"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.26.2

