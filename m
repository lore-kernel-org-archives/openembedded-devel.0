Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95058C43217
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 17:19:37 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.21572.1665854374747443516
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Oct 2022 10:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 4E9A410B55
	for <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 19:19:32 +0200 (CEST)
Received: from flk-MS-7C91.. ([79.219.224.131]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ojkoo-3HnAFF0; Sat, 15 Oct 2022 19:19:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 1/2] pipewire: upgrade 0.3.57 -> 0.3.59
Date: Sat, 15 Oct 2022 19:19:16 +0200
Message-Id: <20221015171917.3622-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665854366-4AFF5689-58864470/0/0 CLEAN NORMAL
X-TOI-MSGID: 27880678-eec6-4bf1-9bfe-e327df61ecbb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 17:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99178

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.57.bb =3D> pipewire_0.3.59.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.57.bb =3D=
> pipewire_0.3.59.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.bb
index 0ca8fd0dc..757c88c95 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "49f1c2038fb7b5249affa56709b117a2a8603b52"
+SRCREV =3D "f54a72fd9a67eeb8d1502d6d75979dbddb00fdf2"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


