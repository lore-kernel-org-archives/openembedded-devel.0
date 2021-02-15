Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web11.29655.1613386182212191074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 02:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id E2E28C;
	Mon, 15 Feb 2021 11:49:38 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOBvysSS7LlM; Mon, 15 Feb 2021 11:49:25 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 6B97C17001;
	Mon, 15 Feb 2021 11:49:25 +0100 (CET)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.24 -> 2.0.25
Date: Mon, 15 Feb 2021 11:49:24 +0100
Message-Id: <20210215104924.22923-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215104924.22923-1-jubalh@iodoru.org>
References: <20210215104924.22923-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 .../jasper/{jasper_2.0.24.bb =3D> jasper_2.0.25.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.24.bb =3D> jasper_2.0=
.25.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.24.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.25.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.24.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.25.bb
index 2071c1fbd..0bad670df 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.24.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.25.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "9a2835a81ce9c41a48f36dadce79f110da8d6c75"
+SRCREV =3D "9092dcb7f7680204ef523c73eb6132162b4358e3"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.26.2

