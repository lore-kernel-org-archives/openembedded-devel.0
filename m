Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CE5C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.17396.1679731391373333741
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id B585212DB6
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhK0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 02/32] eog: update 43.2 -> 44.0
Date: Sat, 25 Mar 2023 09:02:26 +0100
Message-Id: <20230325080256.923752-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731389-8556AC08-9DCE6DB7/0/0 CLEAN NORMAL
X-TOI-MSGID: 0961c64d-a7f6-4ce6-95a2-db956a2bb82c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101713

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_43.2.bb =3D> eog_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_43.2.bb =3D> eog_44.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_43.2.bb b/meta-gnome/recipe=
s-gnome/eog/eog_44.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/eog/eog_43.2.bb
rename to meta-gnome/recipes-gnome/eog/eog_44.0.bb
index 7dbc0ecf2..c95d0e653 100644
--- a/meta-gnome/recipes-gnome/eog/eog_43.2.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "9dcfdce5585a90e2bb1cf57e377cb1eb12d41bd9=
bcb9bbacdf506bc1b1354ef9"
+SRC_URI[archive.sha256sum] =3D "41d85fab05c430898dbfd847e48e1f5b4935dc3c=
bcee546e759a907eda671054"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


