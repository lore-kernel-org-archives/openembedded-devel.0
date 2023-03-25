Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EF3C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:19 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17413.1679731399386958720
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4EEDE1E81C
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyro-0RoPhe0; Sat, 25 Mar 2023 09:03:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 22/32] gnome-text-editor: update 43.1 -> 44.0
Date: Sat, 25 Mar 2023 09:02:46 +0100
Message-Id: <20230325080256.923752-22-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731392-85D6DC08-99200EF6/0/0 CLEAN NORMAL
X-TOI-MSGID: 5dde1310-e919-4b51-ab61-d0dec9b74cd4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101737

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_43.1.bb =3D> gnome-text-editor_44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_43.=
1.bb =3D> gnome-text-editor_44.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_43.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
4.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
43.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_44=
.0.bb
index a2ac710a0..40bcd27d2 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_44.0.b=
b
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "973a4b0deb68f9f91a54a4dd415b6afde9b5ae3e=
e684bc761471f94290f9f6cb"
+SRC_URI[archive.sha256sum] =3D "f67bc3780734ffa815fcc4c5daa7b555d24e459f=
81ea2b548e6a85c1612a31ca"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.34.1


