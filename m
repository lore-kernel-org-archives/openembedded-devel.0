Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08335C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 08:24:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.17397.1709886258607248882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 00:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id 2B4D1393A0
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 09:24:16 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1riVWX-04FQqv0; Fri, 8 Mar 2024 09:24:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] webp-pixbuf-loader: update 0.2.5 -> 0.2.7
Date: Fri,  8 Mar 2024 09:24:34 +0100
Message-ID: <20240308082434.2849002-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709886253-30FF6937-6678B836/0/0 CLEAN NORMAL
X-TOI-MSGID: 426e7372-33ec-4e17-af92-17f087dfd4b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 08:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109226

---
 ...{webp-pixbuf-loader_0.2.5.bb =3D> webp-pixbuf-loader_0.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/webp-pixbuf-loader/{webp-pixbuf-loader=
_0.2.5.bb =3D> webp-pixbuf-loader_0.2.7.bb} (91%)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.2.5.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf=
-loader_0.2.7.bb
similarity index 91%
rename from meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loa=
der_0.2.5.bb
rename to meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loade=
r_0.2.7.bb
index e7cad39a3..73f22a3d9 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.5.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.7.bb
@@ -15,7 +15,7 @@ EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
 SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;branch=3Dmainline"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "481533dd0e2c014975d9dc786887a5475c3af073"
+SRCREV =3D "52232e4ba282b2fed68e8fcb4b5d45ed0eaa4ed3"
=20
 FILES:${PN} =3D " \
     ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
--=20
2.44.0


