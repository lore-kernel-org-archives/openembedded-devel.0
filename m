Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE64C76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 15:46:29 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.24309.1680363986787676706
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 08:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id AD0CB88E7
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Apr 2023 17:46:22 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.236.62]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pidQq-4QO3hh0; Sat, 1 Apr 2023 17:46:20 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_L_K@t-online.de>
Subject: [meta-multimedia][PATCH 1/2] flatpak: update 1.15.3 -> 1.15.4
Date: Sat,  1 Apr 2023 17:46:07 +0200
Message-Id: <20230401154608.6796-1-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680363980-79066C36-4EEC80B2/0/0 CLEAN NORMAL
X-TOI-MSGID: e131715d-3227-4f71-a0d3-9097d6b8d460
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 15:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101869

Signed-off-by: Markus Volk <f_L_K@t-online.de>
---
 .../flatpak/{flatpak_1.15.3.bb =3D> flatpak_1.15.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.3.bb =3D> flatpak_=
1.15.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.3.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.3.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
index 3aafa3f0d..fcf80fc85 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.3.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "756994b5c433dad9786f9fad736667c4f524aeac"
+SRCREV =3D "e936e3100d406c50ba49f3ad6a0ecae455345ec0"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


