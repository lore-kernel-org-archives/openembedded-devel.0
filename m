Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F30FCF9C46
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20386.1726844890006089038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BDF6EDE47
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0R0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/23] gnome-terminal: update 3.50.1 -> 3.54.0
Date: Fri, 20 Sep 2024 17:08:10 +0200
Message-ID: <20240920150822.1131707-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844862-857F8467-D02215EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a6ae7e4-f7dc-44b8-b266-f3396b47cb51
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112414

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-terminal_3.50.1.bb =3D> gnome-terminal_3.54.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb=
 =3D> gnome-terminal_3.54.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.b=
b
index 3bbfe9ece..ec8cbecca 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -24,7 +24,7 @@ SRC_URI =3D " \
 	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
 	file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
 "
-SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
+SRCREV =3D "965cb9307713c618253918633416fcad86bcc5d2"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
--=20
2.46.0


