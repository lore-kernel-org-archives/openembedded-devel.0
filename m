Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A4FC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 08:03:53 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.38051.1710749030691305981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 01:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id 6AADA282AB
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 09:03:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm7yD-1GnKt90; Mon, 18 Mar 2024 09:03:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] folks: update 0.15.7 -> 0.15.8
Date: Mon, 18 Mar 2024 09:04:12 +0100
Message-ID: <20240318080412.1454-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318080412.1454-1-f_l_k@t-online.de>
References: <20240318080412.1454-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710749025-867FA383-DE94B064/0/0 CLEAN NORMAL
X-TOI-MSGID: dfbe6f56-d1ca-4ade-b7e3-6ff253aadf38
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 08:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109400

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../folks/{folks_0.15.7.bb =3D> folks_0.15.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.7.bb =3D> folks=
_0.15.8.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.7.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.8.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.7.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.8.bb
index a22907178..4d2681710 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.7.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.8.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??=3D ""
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
-SRC_URI[archive.sha256sum] =3D "120f219ef63212caa95ae7f6aeb64e29928b0b1a=
8b9452054304a00d0f347871"
+SRC_URI[archive.sha256sum] =3D "954a6afb3e378f01d310fd443790f235cb0eb71e=
2139cff4f05f09ab725e49c2"
--=20
2.44.0


