Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C36C4829D
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 06:30:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.36478.1707892243163524591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 22:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 6108C24006
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 07:30:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.212]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ra8mz-2u5vvt0; Wed, 14 Feb 2024 07:30:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hwdata: update 0.378 -> 0.379
Date: Wed, 14 Feb 2024 07:30:52 +0100
Message-ID: <20240214063052.26307-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707892238-867FA383-83DB9E37/0/0 CLEAN NORMAL
X-TOI-MSGID: bc2d3018-af4a-4f82-9f34-f4c2e9e1b05e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 06:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108733

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/hwdata/{hwdata_0.378.bb =3D> hwdata_0.379.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.378.bb =3D> hwdata_0.379=
.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.378.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.379.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.378.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.379.bb
index cf344f095..50d449ee5 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.378.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.379.bb
@@ -5,7 +5,7 @@ SECTION =3D "System/Base"
 LICENSE =3D "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445=
a57"
=20
-SRCREV =3D "5580883256f77cfba526ebd81caa504e61047d87"
+SRCREV =3D "87db4fd0620270614f5079c5f73b1fb6000ca081"
 SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


