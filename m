Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832F7C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:24:35 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.195985.1698312271040813772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id BF5445436A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:24:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwbF-3pzHJx0; Thu, 26 Oct 2023 11:24:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: Update 45.0 -> 45.1
Date: Thu, 26 Oct 2023 11:24:37 +0200
Message-ID: <20231026092437.833491-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698312261-28FF6D4D-A62EF36D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8fd1ca1d-b200-494c-abc4-e1746ac59edd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105739

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-remote-desktop_45.0.bb =3D> gnome-remote-desktop_45.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-remote-desktop/{gnome-remote-desktop_45.0.bb =3D> gnome-remote-desktop_4=
5.1.bb} (91%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-remote-desktop/gnome-remote-desktop_45.0.bb b/meta-gnome/dynamic-la=
yers/meta-virtualization/recipes-gnome/gnome-remote-desktop/gnome-remote-=
desktop_45.1.bb
similarity index 91%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-remote-desktop/gnome-remote-desktop_45.0.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-remote-desktop/gnome-remote-desktop_45.1.bb
index d3089648c..9e887056e 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_45.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_45.1.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "cb993112d5a3ca21ec217df2d84068e4cad2a4aa=
6cab52f0e186fa1152f7a381"
+SRC_URI[archive.sha256sum] =3D "dcd9c18ac2306695631fcf00a88645c38e370eba=
05c69df39f540204d4eafd8d"
=20
 DEPENDS =3D " \
     asciidoc-native \
--=20
2.42.0


