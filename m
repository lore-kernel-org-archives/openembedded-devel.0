Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C90C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 06:57:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.6805.1715324248816830424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 23:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id DE0CC27DA1
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 08:57:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5KC5-1pmwld0; Fri, 10 May 2024 08:57:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-calculator: update 46.0 -> 46.1
Date: Fri, 10 May 2024 08:57:50 +0200
Message-ID: <20240510065750.1902770-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715324245-61FF93C7-3A9E3CD4/0/0 CLEAN NORMAL
X-TOI-MSGID: f907a65a-ae6c-41e9-ac71-b39076801b84
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 06:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110309

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_46.0.bb =3D> gnome-calculator_46.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_46.0.=
bb =3D> gnome-calculator_46.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
6.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.1.=
bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.1=
.bb
index 5c7e27378..f1a93ea83 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.1.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "44694fda6b6233923f5c10a48d02d2cf5724e011=
a8a85789074c953101f33bf1"
+SRC_URI[archive.sha256sum] =3D "2d36750a73890086122cf3f0c83e685178915856=
15165306fa1596a918668247"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.44.0


