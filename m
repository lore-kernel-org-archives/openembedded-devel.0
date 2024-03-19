Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152F4C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 06:41:58 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.8974.1710830513727646707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 23:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 951ADD1FE
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 07:41:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmTAT-1pzs4B0; Tue, 19 Mar 2024 07:41:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] tecle: update 45.0 -> 46.0
Date: Tue, 19 Mar 2024 07:42:13 +0100
Message-ID: <20240319064213.4961-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319064213.4961-1-f_l_k@t-online.de>
References: <20240319064213.4961-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710830509-56FA6986-A4902A4A/0/0 CLEAN NORMAL
X-TOI-MSGID: a32848ba-5366-422d-8646-530085d1a848
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 06:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109469

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/tecla/{tecla_45.0.bb =3D> tecla_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_45.0.bb =3D> tecla_46.0.bb}=
 (80%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb b/meta-gnome/re=
cipes-gnome/tecla/tecla_46.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
index 197db17e9..62b3aa3e3 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
@@ -13,4 +13,4 @@ REQUIRED_DISTRO_FEATURES =3D "wayland"
=20
 inherit gnomebase pkgconfig  features_check
=20
-SRC_URI[archive.sha256sum] =3D "5c02bb4019b1cffb5663da6107503eff853836a8=
783dd4705dd04a49f7adc25b"
+SRC_URI[archive.sha256sum] =3D "4a081eab867a5a8b09758991cad7645920f323aa=
bca954408290fb6f44591b0f"
--=20
2.44.0


