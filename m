Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C269EE6452
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 10:24:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.17445.1694773468207661936
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 03:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id 52CE22A80A
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 12:24:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.62]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qh5zt-21SQRV0; Fri, 15 Sep 2023 12:24:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] evolution-data-server: upgrade 3.48.3 -> 3.50.0
Date: Fri, 15 Sep 2023 12:24:28 +0200
Message-ID: <20230915102428.58455-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694773465-1D7F216C-1BB018CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 40d38b2f-cef0-4e42-bafa-fb229eafeb6e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 10:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104893

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 5452a2e79..511cc04af 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "b71e412e52f567c83394b5926df92b4f4f6d2cdd=
ebad384a517c720671fad996"
-PV =3D "3.48.3"
+SRC_URI[archive.sha256sum] =3D "c9f793d99ba188ef8cf2891b8062d7e570e3cba2=
2b8cfc46eb561c6cecc81d3a"
+PV =3D "3.50.0"
--=20
2.41.0


