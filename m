Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A47C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 13:51:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.15381.1646574701768534098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 05:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 718F01C0004;
	Sun,  6 Mar 2022 13:51:37 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] hwdata: Update to 0.357
Date: Sun,  6 Mar 2022 05:50:30 -0800
Message-Id: <20220306135030.1578397-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 13:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95814

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../recipes-support/hwdata/{hwdata_0.356.bb => hwdata_0.357.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.356.bb => hwdata_0.357.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.356.bb b/meta-oe/recipes-support/hwdata/hwdata_0.357.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.356.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.357.bb
index 6488897b6..01ebf3c90 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.356.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.357.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "66a9f63255a06e2d9ec49501188ca47cb537675b"
+SRCREV = "f9e7eed1b85760028a5157986b3313c99c4d0225"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


