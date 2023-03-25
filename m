Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946DAC77B74
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.17401.1679731393924622755
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 113B612DC1
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrm-0RoPhP0; Sat, 25 Mar 2023 09:03:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 07/32] gnome-calculator: update 43.0.1 -> 44.0
Date: Sat, 25 Mar 2023 09:02:31 +0100
Message-Id: <20230325080256.923752-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731390-8556AC08-2739C546/0/0 CLEAN NORMAL
X-TOI-MSGID: 60a90370-5572-42c4-b758-967d7c535399
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101721

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_43.0.1.bb =3D> gnome-calculator_44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_43.0.=
1.bb =3D> gnome-calculator_44.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
3.0.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_44.=
0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43=
.0.1.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_44.0=
.bb
index 3459b6d5f..53dafba18 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43.0.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_44.0.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "02c12ded3cf5053d17537d95ec69587f4b919899=
d7726eceecdb4b47ffb1c90f"
+SRC_URI[archive.sha256sum] =3D "14e763329f88309a7e152780d57361b543100e32=
3906b34e0655fdc315b71043"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.34.1


