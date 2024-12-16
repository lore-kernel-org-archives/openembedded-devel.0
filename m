Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D578E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 12:15:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.55109.1734351341331899914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 04:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 45A46A31
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 13:15:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNA0a-0JvUjx0; Mon, 16 Dec 2024 13:15:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] luajit: update
Date: Mon, 16 Dec 2024 13:15:25 +0100
Message-ID: <20241216121527.1428075-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734351332-E9FF89BF-27089953/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f3d0566-6657-4def-be34-389c05f5caf9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 12:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114332

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index 4189217541..6a79ffb897 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=
=3Dhttp;branch=3Dv2.1 \
            "
=20
 PV =3D "2.1"
-SRCREV =3D "c525bcb9024510cad9e170e12b6209aedb330f83"
+SRCREV =3D "19878ec05c239ccaf5f3d17af27670a963e25b8b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.47.0


