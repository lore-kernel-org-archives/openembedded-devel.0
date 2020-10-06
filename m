Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web11.9068.1601969484608126645
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 00:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 24B7CB;
	Tue,  6 Oct 2020 09:31:19 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVWTBDOhQokq; Tue,  6 Oct 2020 09:31:05 +0200 (CEST)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 1C6549;
	Tue,  6 Oct 2020 09:31:05 +0200 (CEST)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH 1/1] jasper: upgrade 2.0.21 -> 2.0.22
Date: Tue,  6 Oct 2020 09:31:06 +0200
Message-Id: <20201006073107.11952-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 .../jasper/{jasper_2.0.21.bb =3D> jasper_2.0.22.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.21.bb =3D> jasper_2.0=
.22.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.22.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.22.bb
index be87d07c0..b2b053a28 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.22.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "2c3ab8c542a66eb5def030d30602fa455d1adbd9"
+SRCREV =3D "95b2f0583a71c92cddefb54b522efe717b7a5adc"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.26.2

