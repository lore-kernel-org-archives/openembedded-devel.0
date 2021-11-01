Return-Path: <jubalh@iodoru.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D62C433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:16:04 +0000 (UTC)
Received: from mail.desaster-games.net (mail.desaster-games.net
 [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web09.45620.1635779751520698452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136,
 mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 21DCE12001;
	Mon,  1 Nov 2021 16:15:46 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RROEnI+1XhaK; Mon,  1 Nov 2021 16:15:32 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id A44DF12003;
	Mon,  1 Nov 2021 16:15:32 +0100 (CET)
From: Michael Vetter <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.26 -> 2.0.33
Date: Mon,  1 Nov 2021 16:15:33 +0100
Message-Id: <20211101151533.8354-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101151533.8354-1-jubalh@iodoru.org>
References: <20211101151533.8354-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 15:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93745

---
 .../jasper/{jasper_2.0.26.bb =3D> jasper_2.0.33.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.26.bb =3D> jasper_2.0=
.33.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_2.0.33.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index e63385488..da863b731 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s"
-SRCREV =3D "5083b949f0caa5bc6257cd81162a33c15bf8a1d1"
+SRCREV =3D "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.31.1


