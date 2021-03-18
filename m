Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web09.7661.1616067372821573234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 04:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 20AECC23B;
	Thu, 18 Mar 2021 12:36:08 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vMoAUuU0TC2; Thu, 18 Mar 2021 12:35:54 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id AE49B14009;
	Thu, 18 Mar 2021 12:35:54 +0100 (CET)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH 1/1] jasper: upgrade 2.0.26 -> 2.0.27
Date: Thu, 18 Mar 2021 12:35:54 +0100
Message-Id: <20210318113555.1663-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 .../jasper/{jasper_2.0.26.bb =3D> jasper_2.0.27.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.26.bb =3D> jasper_2.0=
.27.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.27.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.27.bb
index de28af8ba..e316440d2 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.27.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "5083b949f0caa5bc6257cd81162a33c15bf8a1d1"
+SRCREV =3D "10322667205fa9c198ca26f7ace197ed00846f83"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.26.2

