Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A8EC07E8D
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.12009.1713765622234442712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id C61E213D6D
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 08:00:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rymiy-0eOXRt0; Mon, 22 Apr 2024 08:00:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] gnome-shell-extensions: update 46.0 -> 46.1
Date: Mon, 22 Apr 2024 08:00:41 +0200
Message-ID: <20240422060041.222739-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422060041.222739-1-f_l_k@t-online.de>
References: <20240422060041.222739-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713765620-72713D2B-7537CED3/0/0 CLEAN NORMAL
X-TOI-MSGID: 4cc3fe6e-d7bb-485c-b2dd-1f973d421e50
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110079

46.1
=3D=3D=3D=3D
* screenshot-window-sizer: Add flathub-recommended size [Florian; !317]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_46.0.bb =3D> gnome-shell-extensions_46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_46.0=
.bb =3D> gnome-shell-extensions_46.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
46.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
6.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
1.bb
index eff5fecff..b79f70c60 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.1.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "d8138f88cd92df9f932309149c236fbdd77c1bc0=
95445036ab7eb0ecda53c01a"
+SRC_URI[archive.sha256sum] =3D "c5ba50700da77a986f0060beedacfc017e7ec822=
83f2a6384842a0807bc4553f"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.44.0


