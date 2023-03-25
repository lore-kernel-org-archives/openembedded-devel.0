Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE2C77B70
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17403.1679731394320089381
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 484971BA08
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhT0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 11/32] gnome-desktop: update 43 -> 44.0
Date: Sat, 25 Mar 2023 09:02:35 +0100
Message-Id: <20230325080256.923752-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-8388965E/0/0 CLEAN NORMAL
X-TOI-MSGID: 40988e6e-7d6a-4ca0-b10f-95d9d6026fdb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101723

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-desktop_43.bb =3D> gnome-desktop_44.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_43.bb =3D> =
gnome-desktop_44.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb b=
/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
index 254551884..eae9d9d06 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
@@ -18,7 +18,7 @@ GIR_MESON_OPTION =3D ""
=20
 SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.pa=
tch"
-SRC_URI[archive.sha256sum] =3D "3d6e153317486157596aa3802f87676414c57073=
8f450a94a041fe8835420a69"
+SRC_URI[archive.sha256sum] =3D "42c773745d84ba14bc1cf1c4c6f4606148803a5c=
d337941c63964795f3c59d42"
=20
 DEPENDS +=3D " \
     fontconfig \
--=20
2.34.1


