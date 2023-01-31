Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62F9C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:00:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.14193.1675177215063686511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7J-0004FN-0h; Tue, 31 Jan 2023 16:00:13 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7J-001iEN-13; Tue, 31 Jan 2023 16:00:12 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7G-008ynS-MV; Tue, 31 Jan 2023 16:00:10 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-initramfs][PATCH 2/2] kexecboot: update homepage
Date: Tue, 31 Jan 2023 16:00:08 +0100
Message-Id: <20230131150008.2140231-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230131150008.2140231-1-u.oelmann@pengutronix.de>
References: <20230131150008.2140231-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100877

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 9f7a214d8b8e..62d1effcccf3 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "kexecboot linux-as-bootloader"
 DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
-HOMEPAGE = "http://kexecboot.org"
+HOMEPAGE = "https://github.com/kexecboot/kexecboot/wiki"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
-- 
2.30.2


