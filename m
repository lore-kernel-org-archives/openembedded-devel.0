Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B030CC83F34
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 16:54:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.18837.1753203244457537509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id A348F1C0B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 18:54:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGFX-0UEHLv0; Tue, 22 Jul 2025 18:53:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gnome-shell-extensions: uodate 48.0 -> 48.3
Date: Tue, 22 Jul 2025 18:53:44 +0200
Message-ID: <20250722165344.105075-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722165344.105075-1-f_l_k@t-online.de>
References: <20250722165344.105075-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1753203235-A2FEB6D2-AE9CEE4B/0/0 CLEAN NORMAL
X-TOI-MSGID: a6763eb7-9b59-4d43-8d50-b3983514bee7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 16:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118694

48.3
=3D=3D=3D=3D
* Misc. bug fixes and cleanups [Florian; !409, !411, !405, !413]
Contributors:
  Florian M=C3=BCllner
48.2
=3D=3D=3D=3D
* windowsNavigator: Fix handling keyboard shortcuts [Daniel; !395]
* build: Allow disabling the X11 session [Neal; !396, !400]
Contributors:
  Daniel Buch Hansen, Neal Gompa
48.1
=3D=3D=3D=3D
Translators:
  Hugo Carvalho [pt], Danial Behzadi [fa]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.=
3.bb
index f2f3e8654d..5537b3521e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "f301b5e7354d5adc01c8bb21793810074e1ea408=
de45300f767d104454db3e33"
+SRC_URI[archive.sha256sum] =3D "adde34c08f40b63411be6f1d17e235550a009049=
4871e6481c312989d7f4a2d4"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.50.1


